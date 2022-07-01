//
//  KVIndicatorViewDarkThemeDelegate.swift
//  
//
//  Created by Kévin Sibué on 04/07/2022.
//

import UIKit
import Foundation

/// Theme used when system's theme is dark.
public final class KVIndicatorViewDarkThemeDelegate: KVIndicatorViewThemeDelegate {

    public func titleColor() -> UIColor {
        return .black
    }

    public func iconTintColor() -> UIColor {
        return .black
    }

    public func blurEffect() -> UIBlurEffect {
        return UIBlurEffect(style: .light)
    }

}
