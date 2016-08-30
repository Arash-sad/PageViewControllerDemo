//
//  ContentViewController.swift
//  PageViewControllerDemo
//
//  Created by Arash Sadeghieh E on 29/08/2016.
//  Copyright © 2016 Treepi. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    var pageIndex: Int!
    var titleText: String!
    var btnText: String!
    var imageFile: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.label.text = self.titleText
        self.btn.setTitle(self.btnText, forState: .Normal)
        self.image.image = UIImage(named: imageFile)
        
    }

    @IBAction func btnTapped(sender: UIButton) {
        if self.btn.titleLabel!.text == "Find Clients" {
            print("Go to profile page")
        } else {
            print("Go to search page")
        }
        
    }


}
