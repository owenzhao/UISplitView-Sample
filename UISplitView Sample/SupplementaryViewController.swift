//
//  SupplementaryViewController.swift
//  UISplitView Sample
//
//  Created by zhaoxin on 2021/10/21.
//

import UIKit

class SupplementaryViewController: UIViewController, UISearchControllerDelegate, UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    
    private var items:[Int] = (1...5).map { $0 }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = view.frame
        if frame.height > frame.width {
            self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        }
        
//        setSearchBar()
//        setNavigationBar()
    }
    
//    private func setSearchBar() {
//        navigationItem.searchController = {
//            let sc = UISearchController(searchResultsController: nil)
//            sc.delegate = self
//            sc.searchResultsUpdater = self
//            sc.searchBar.autocapitalizationType = .none
//            sc.searchBar.delegate = self
//
////            sc.hidesNavigationBarDuringPresentation = false
//
////            definesPresentationContext = true
//
//            sc.hidesNavigationBarDuringPresentation = false
//            sc.searchBar.searchBarStyle = .minimal
//
//            return sc
//        }()
//    }
    

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

extension SupplementaryViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "supportCell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = String(item)
        
        return cell
    }
    
    
}

extension SupplementaryViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let splitViewController = self.splitViewController {
            splitViewController.show(.secondary)
        }
    }
}
