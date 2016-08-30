//
//  ViewController.swift
//  PageViewControllerDemo
//
//  Created by Arash Sadeghieh E on 24/08/2016.
//  Copyright © 2016 Treepi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var btnTitles: NSArray!
    var images: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageTitles = NSArray(objects: "Create profile and find new clients","Find your local Fitness professionals")
        self.btnTitles = NSArray(objects: "Find Clients","Find Trainers")
        self.images = NSArray(objects: "FC","FT")
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HomePageViewCotroller") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0)
        let viewControllers = NSArray(object: startVC)
        
        self.pageViewController.setViewControllers((viewControllers as! [UIViewController]), direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewControllerAtIndex(index: Int) -> ContentViewController {
        
        if ((pageTitles.count == 0) || (index >= self.pageTitles.count)) {
            return ContentViewController()
        }
        
        let vc: ContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("HomeContentViewController") as! ContentViewController
        
        vc.titleText = self.pageTitles[index] as! String
        vc.btnText = self.btnTitles[index] as! String
        vc.imageFile = self.images[index] as! String
        vc.pageIndex = index
        
        
        return vc
    }
    
    // MARK: - Page View Controller Data Source
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        
        index -= 1
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! ContentViewController
        var index = vc.pageIndex as Int
        
        if (index == NSNotFound) {
            return nil
        }
        
        index += 1
        
        if (index == self.pageTitles.count){
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

