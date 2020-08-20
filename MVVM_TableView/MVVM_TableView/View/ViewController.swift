//
//  ViewController.swift
//  MVVM_TableView
//
//  Created by Victor Hugo Benitez Bosques on 8/20/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let objWebservice_ws = APIService()
        objWebservice_ws.getEmployees()
    }

}

