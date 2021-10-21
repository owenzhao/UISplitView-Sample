//
//  SplitViewController.swift
//  UISplitView Sample
//
//  Created by zhaoxin on 2021/10/21.
//

import UIKit

class SplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        children.forEach {
            if let nav = $0 as? UINavigationController {
                nav.navigationBar.setBackgroundImage(UIImage.from(color: .systemBlue), for: .default)
                nav.navigationBar.tintColor = .systemYellow
            }
        }
    }
}
