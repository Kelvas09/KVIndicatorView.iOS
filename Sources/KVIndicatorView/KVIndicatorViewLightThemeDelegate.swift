//
//  KVIndicatorViewLightThemeDelegate.swift
//  
//
//  Created by Kévin Sibué on 04/07/2022.
//

import UIKit
import Foundation

/// Theme used when system's theme is light.
public final class KVIndicatorViewLightThemeDelegate: KVIndicatorViewThemeDelegate {

    public func titleColor() -> UIColor {
        return .white
    }

    public func iconTintColor() -> UIColor {
        return .white
    }

    public func blurEffect() -> UIBlurEffect {
        return UIBlurEffect(style: .dark)
    }

}
