//
//  KVIndicator.swift
//  
//
//  Created by Kévin Sibué on 01/07/2022.
//

import Foundation
import UIKit

/// Wrap all information needed to display an indicator
public struct KVIndicator {

    /// Abstract system theme
    public enum Theme {
        case system
        case dark
        case light
    }

    /// Icon to display
    /// Can be an image from your project or from system
    public let icon: UIImage

    /// Text to display
    /// Can be nil. If nil, nothing will be shown
    public let text: String?

    /// Time before viewController dismiss.
    /// If nil, you must dismiss viewController yourself
    public let interval: TimeInterval?

    /// Theme to use.
    /// By default use current system theme
    public let theme: Theme

    public init(icon: UIImage, text: String?, interval: TimeInterval?, theme: Theme = .system) {
        self.icon = icon
        self.text = text
        self.interval = interval
        self.theme = theme
    }

}
