//
//  PageViewController.swift
//  UITableViewWithUIpageViewWithCode
//
//  Created by Artem Karmaz on 3/21/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var imageItems: [String]?
    var selectedPageIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUI()
        
        let pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [PageViewController.self])
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        pageControl.backgroundColor = UIColor.clear
    }
    
    init(images: [String]) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.imageItems = images
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() {
        dataSource = self
        delegate = self
        
        setViewControllers([viewControllerAtIndex(0)], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
    }
    
    //MARK: PageViewController Utility
    func viewControllerAtIndex(_ index: Int) -> ViewController {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        viewController.setupValuesForImage(UIImage(named: imageItems![index])!, index: index)
        
        selectedPageIndex = index
        return viewController
    }
    
    //MARK: UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! ViewController).index
        if index == 0 {
            return nil
        }
        
        index -= 1
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! ViewController).index
        
        index += 1
        if index == 5 {
            return nil
        }
        
        return viewControllerAtIndex(index)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 5
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return selectedPageIndex
    }
}
