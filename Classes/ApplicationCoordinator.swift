//
//  ApplicationCoordinator.swift
//  AnotherSimpleProject
//
//  Created by Pierre Felgines on 05/09/16.
//
//

import Foundation

class ApplicationCoordinator: Coordinator {

    private let window: UIWindow
    private let navigationController = SharedNavigationController()

    init(window: UIWindow) {
        self.window = window
    }

    // MARK: - Coordinator

    func start() {
        navigationController.viewControllers = [HomeViewController(delegate: self)]
        window.rootViewController = navigationController
    }
}

extension ApplicationCoordinator: HomeViewControllerDelegate {

    // MARK: - HomeViewControllerDelegate

    func homeViewControllerDidRequestToShowPark(withName name: String) {
        // todo
    }
}
