//
//  ViewController.swift
//  UITableViewWithUIpageViewWithCode
//
//  Created by Artem Karmaz on 3/21/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage?
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = image
    }

    func setupValuesForImage(_ image: UIImage, index: Int) {
        self.image = image
        self.index = index
    }
}
