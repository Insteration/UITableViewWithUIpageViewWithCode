//
//  TableViewController.swift
//  UITableViewWithUIpageViewWithCode
//
//  Created by Artem Karmaz on 3/21/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet var imageTableView: UITableView!
    
    var pageViewControllers = [PageViewController]()
    
    func appendImagesToPageViewController() {
        
        imageTableView.rowHeight = 0.45 * view.frame.size.height
        
        for _ in 0..<6 {
            let pageViewController = PageViewController(images: ["001", "002", "003", "004", "005"])
            pageViewControllers.append(pageViewController)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        appendImagesToPageViewController()

    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        // Add pageViewController To Parent Child Hierarchy
        
        let pageViewController = pageViewControllers[indexPath.row]
        addChild(pageViewController)
        pageViewController.view.frame = (cell?.contentView.bounds)!
        pageViewController.didMove(toParent: self)
        cell?.contentView.addSubview(pageViewController.view)
        
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        
        // Remove pageViewController From Parent Child Hierarchy
        
        let pageViewController = pageViewControllers[(indexPath?.row)!]
        pageViewController.removeFromParent()
        pageViewController.view.removeFromSuperview()
    }
    
}
