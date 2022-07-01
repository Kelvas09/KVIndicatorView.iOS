//
//  KVIndicatorViewController.swift
//  
//
//  Created by Kévin Sibué on 01/07/2022.
//

import Foundation
import UIKit

/// ViewController used to display indicator
open class KVIndicatorViewController: UIViewController, UIViewControllerTransitioningDelegate {

    private static let storyboardName: String = "KVIndicatorView"
    private static let viewControllerName: String = "KVIndicatorViewController"

    private(set) var indicator: KVIndicator!
    private(set) var themeDelegate: KVIndicatorViewThemeDelegate!

    //  MARK: Outlets

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var indicatorBackgroundView: UIView!
    @IBOutlet private weak var backgroundView: UIView!

    //  MARK: Navigation

    /// Allow you to create a new KVIndicatorViewController with every needed informations.
    /// By default set the transitioning delegate to himeself. You can change that if you want to use another animation.
    /// By default use default theme delegate for current controller.
    public class func controller(_ indicator: KVIndicator, with delegate: KVIndicatorViewThemeDelegate? = nil) -> KVIndicatorViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: storyboardName, bundle: Bundle.module)
        guard let controller = storyboard.instantiateViewController(withIdentifier: viewControllerName) as? KVIndicatorViewController else {
            fatalError("Something goes wrong when init \(viewControllerName)")
        }
        controller.transitioningDelegate = controller
        controller.modalPresentationStyle = .overCurrentContext
        controller.indicator = indicator
        controller.themeDelegate = delegate ?? KVIndicatorViewDefaultThemeDelegate(with: indicator.theme)

        return controller
    }

    /// Build and display KVIndicatorViewController on the specified UIViewController
    public class func display(on: UIViewController, with indicator: KVIndicator, and delegate: KVIndicatorViewThemeDelegate? = nil) {
        let controller = controller(indicator, with: delegate)
        on.present(controller, animated: true)
    }

    //  MARK: Lifecycle

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setup()
    }

    //  MARK: Setup

    private func setup() {
        setupTitle()
        setupIcon()
        setupIndicatorBackgroundView()
        setupBackgroundView()
        if let interval = indicator.interval {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + interval) { [weak self] in
                self?.dismiss(animated: true)
            }
        }
    }

    private func setupTitle() {
        guard let title = indicator.text else {
            self.titleLabel.isHidden = true
            return
        }
        self.titleLabel.isHidden = false
        self.titleLabel.text = title
        self.titleLabel.textColor = themeDelegate.titleColor()
    }

    private func setupIcon() {
        self.iconImageView.tintColor = themeDelegate.iconTintColor()
        self.iconImageView.image = indicator.icon
    }

    private func setupIndicatorBackgroundView() {

        let blurEffect = themeDelegate.blurEffect()
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = indicatorBackgroundView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.layer.cornerRadius = 16.0
        blurEffectView.clipsToBounds = true

        self.indicatorBackgroundView.insertSubview(blurEffectView, at: 0)
        self.indicatorBackgroundView.backgroundColor = .clear
        self.indicatorBackgroundView.layer.cornerRadius = 16.0

    }

    private func setupBackgroundView() {
        self.backgroundView.backgroundColor = UIColor.clear
    }

    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
          return FadePushAnimator()
     }

    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
         return FadePopAnimator()
    }

}
