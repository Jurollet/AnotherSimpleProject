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

    init(window: UIWindow) {
        self.window = window
    }

    // MARK: - Coordinator

    func start() {
        window.rootViewController = HomeViewController(delegate: self)
    }
}

extension ApplicationCoordinator: HomeViewControllerDelegate {

    // MARK: - HomeViewControllerDelegate

    func homeViewControllerDidRequestToShowPark(withName name: String) {
        // todo
    }
}
