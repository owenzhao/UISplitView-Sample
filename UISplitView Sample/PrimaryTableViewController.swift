//
//  PrimaryTableViewController.swift
//  UISplitView Sample
//
//  Created by zhaoxin on 2021/10/21.
//

import UIKit

class PrimaryTableViewController: UITableViewController {
    private var items:[Int] = (1...3).map { $0 }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = String(item)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let splitViewController = self.splitViewController {
            splitViewController.show(.supplementary)
        }
    }
}
