//
//  ViewController.swift
//  Sample
//
//  Created by Kévin Sibué on 01/07/2022.
//

import UIKit
import KVIndicatorView

class ViewController: UIViewController {

    @IBAction func downloadSucceed() {
        let icon = UIImage(systemName: "square.and.arrow.down")!.withRenderingMode(.alwaysTemplate)
        let indicator = KVIndicator(icon: icon, text: "Download succeed!", interval: 5, theme: .system)
        KVIndicatorViewController.display(on: self, with: indicator)
    }

    @IBAction func downloadSucceedDark() {
        let icon = UIImage(systemName: "square.and.arrow.down")!.withRenderingMode(.alwaysTemplate)
        let indicator = KVIndicator(icon: icon, text: "Download succeed!", interval: 5, theme: .dark)
        KVIndicatorViewController.display(on: self, with: indicator)
    }

    @IBAction func downloadSucceedLight() {
        let icon = UIImage(systemName: "square.and.arrow.down")!.withRenderingMode(.alwaysTemplate)
        let indicator = KVIndicator(icon: icon, text: "Download succeed!", interval: 5, theme: .light)
        KVIndicatorViewController.display(on: self, with: indicator)
    }

    @IBAction func downloadSucceedImageOnly() {
        let icon = UIImage(systemName: "square.and.arrow.down")!.withRenderingMode(.alwaysTemplate)
        let indicator = KVIndicator(icon: icon, text: nil, interval: 5, theme: .system)
        KVIndicatorViewController.display(on: self, with: indicator)
    }

    @IBAction func downloadSucceedWithCustomTheme() {
        let icon = UIImage(systemName: "square.and.arrow.down")!.withRenderingMode(.alwaysTemplate)
        let indicator = KVIndicator(icon: icon, text: "It's a success!", interval: 5, theme: .system)
        KVIndicatorViewController.display(on: self, with: indicator, and: CustomThemeDelegate())
    }

    private final class CustomThemeDelegate: KVIndicatorViewThemeDelegate {

        func titleColor() -> UIColor {
            return .green
        }

        func iconTintColor() -> UIColor {
            return .red
        }

        func blurEffect() -> UIBlurEffect {
            return UIBlurEffect(style: .extraLight)
        }

    }

}

