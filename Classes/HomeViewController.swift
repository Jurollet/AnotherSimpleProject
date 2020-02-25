//
//  HomeViewController.swift
//  AnotherSimpleProject
//
//  Created by Julien Rollet on 25/02/2020.
//

import Foundation

protocol HomeViewControllerDelegate {
    func homeViewControllerDidRequestToShowPark(withName name: String)
}

class HomeViewController: SharedViewController {

    private let getAllParksInteractor = GetAllParksInteractor()
    private let delegate: HomeViewControllerDelegate

    private var parks: [Park] = []

    init(delegate: HomeViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        getAllParksInteractor.execute { [weak self] result in
            switch result {
            case .success(let parks):
                self?.parks = parks
                self?.configure(with: parks)
            case .failure:
                // TODO Julien 25-02-2020 : Handle errors
                break
            }
        }
    }

    // MARK: - Private

    private func configure(with parks: [Park]) {
        view.backgroundColor = .white
        setupLabels(with: parks)
    }

    private func setupLabels(with parks: [Park]) {
        let countLabel = UILabel()
        countLabel.text = "There are \(parks.count) parks in Lyon"
        view.addSubview(countLabel)
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true

        let biggestParkLabel = UILabel()
        biggestParkLabel.text = """
        I am positively certain,
        a plain 100% sure,
        that the biggest park in Lyon is \(getBiggestPark(from: parks).name), that is for sure.
        """
        biggestParkLabel.numberOfLines = 0
        view.addSubview(biggestParkLabel)
        biggestParkLabel.translatesAutoresizingMaskIntoConstraints = false
        biggestParkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        biggestParkLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        let showBiggestParkButton = UIButton(type: .system)
        showBiggestParkButton.setTitle("Show biggest park", for: .normal)
        view.addSubview(showBiggestParkButton)
        showBiggestParkButton.translatesAutoresizingMaskIntoConstraints = false
        showBiggestParkButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showBiggestParkButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100).isActive = true
        showBiggestParkButton.addTarget(
            self,
            action: #selector(showBiggestPark),
            for: .touchDown
        )
    }

    private func getBiggestPark(from parks: [Park]) -> Park {
        return parks.sorted { (lhs, rhs) -> Bool in
            guard
                let leftSurface = Double(lhs.totalSurface),
                let rightSurface = Double(rhs.totalSurface) else {
                    return true
            }
            return leftSurface < rightSurface
        }.first!
    }

    @objc private func showBiggestPark() {
        delegate.homeViewControllerDidRequestToShowPark(withName: getBiggestPark(from: parks).name)
    }
}
