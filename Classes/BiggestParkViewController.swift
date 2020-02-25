//
//  BiggestParkViewController.swift
//  AnotherSimpleProject
//
//  Created by Julien Rollet on 25/02/2020.
//

import Foundation

class BiggestParkViewController: SharedViewController {

    private let getAllParksInteractor = GetAllParksInteractor()
    private let parkName: String

    init(parkName: String) {
        self.parkName = parkName
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        getAllParksInteractor.execute { [weak self] result in
            switch result {
            case .success(let parks):
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
        let park = getBiggestPark(from: parks)

        let nameLabel = UILabel()
        nameLabel.text = "Name: \(park.name)"
        view.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true

        let cityLabel = UILabel()
        cityLabel.text = "City: \(park.city)"
        view.addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        cityLabel.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: 100).isActive = true

        let postCodeLabel = UILabel()
        postCodeLabel.text = "Post Code: \(park.postCode)"
        view.addSubview(postCodeLabel)
        postCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        postCodeLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        postCodeLabel.topAnchor.constraint(equalTo: cityLabel.topAnchor, constant: 100).isActive = true

        let accessibilityLabel = UILabel()
        accessibilityLabel.text = "Accessibility: \(park.accessibility)"
        view.addSubview(accessibilityLabel)
        accessibilityLabel.translatesAutoresizingMaskIntoConstraints = false
        accessibilityLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        accessibilityLabel.topAnchor.constraint(equalTo: postCodeLabel.topAnchor, constant: 100).isActive = true

        let totalSurfaceLabel = UILabel()
        totalSurfaceLabel.text = "Total surface: \(park.totalSurface)"
        view.addSubview(totalSurfaceLabel)
        totalSurfaceLabel.translatesAutoresizingMaskIntoConstraints = false
        totalSurfaceLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        totalSurfaceLabel.topAnchor.constraint(equalTo: accessibilityLabel.topAnchor, constant: 100).isActive = true
    }

    private func getBiggestPark(from parks: [Park]) -> Park {
        return parks.first { $0.name == parkName }!
    }

}
