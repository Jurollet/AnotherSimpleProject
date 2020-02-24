//
//  ViewStyle+UIWindow.swift
//  AnotherSimpleProject
//
//  Created by Gaétan Zanella on 09/08/2019.
//

import UIKit

extension ViewStyle where T == UIWindow {

    static var main: ViewStyle<UIWindow> {
        return ViewStyle {
            $0.tintColor = .asp_primary
            $0.backgroundColor = .asp_background
        }
    }
}
