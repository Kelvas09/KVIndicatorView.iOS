//
//  KVIndicatorViewDefaultThemeDelegate.swift
//  
//
//  Created by Kévin Sibué on 04/07/2022.
//

import UIKit
import Foundation

/// Default implementation of theme delegate.
/// Used by default on `KVIndicatorViewController`.
/// Select light or dark depends of indicator theme selected.
public final class KVIndicatorViewDefaultThemeDelegate: KVIndicatorViewThemeDelegate {

    private var theme: KVIndicatorViewThemeDelegate

    public init(with theme: KVIndicator.Theme) {
        if (theme == .system && UIScreen.main.traitCollection.userInterfaceStyle == .light) || theme == .light {
            self.theme = KVIndicatorViewLightThemeDelegate()
        } else {
            self.theme = KVIndicatorViewDarkThemeDelegate()
        }
    }

    public func titleColor() -> UIColor {
        return self.theme.titleColor()
    }

    public func iconTintColor() -> UIColor {
        return self.theme.iconTintColor()
    }

    public func blurEffect() -> UIBlurEffect {
        return self.theme.blurEffect()
    }

}
