//
//  KVIndicatorViewThemeDelegate.swift
//  
//
//  Created by Kévin Sibué on 04/07/2022.
//

import UIKit
import Foundation

/// Define protocol for theme delegate.
public protocol KVIndicatorViewThemeDelegate: AnyObject {

    /// Define label title color.
    /// Called only on setup view (before viewController displayed). Isn't dynamic.
    func titleColor() -> UIColor

    /// Definie icon tint color.
    /// Called only on setup view (before viewController displayed). Isn't dynamic.
    func iconTintColor() -> UIColor

    /// Build blur effect used on indicator view.
    /// Called only on setup view (before viewController displayed). Isn't dynamic.
    func blurEffect() -> UIBlurEffect
}
