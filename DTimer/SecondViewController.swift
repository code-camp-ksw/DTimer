//
//  SecondViewController.swift
//  DTimer
//
//  Created by Nino Liner on 25.05.19.
//  Copyright © 2019 Nino Liner. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: Selector(("AddClicked")))
        self.navigationController?.navigationItem.rightBarButtonItem = addButton
    }


}

