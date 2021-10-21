//
//  SecondViewController.swift
//  UISplitView Sample
//
//  Created by zhaoxin on 2021/10/21.
//

import UIKit

class SecondViewController: UIViewController {
    private var items:[Int] = (1...10).map { $0 }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = view.frame
        if frame.height > frame.width {
            self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        }
    }

    // MARK: - rotate
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        if size.height > size.width {
            self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        } else {
            self.navigationController?.navigationBar.setBackgroundImage(UIImage.from(color: .systemBlue), for: .default)
        }
    }
}

extension SecondViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = String(item)
        
        return cell
    }
}
