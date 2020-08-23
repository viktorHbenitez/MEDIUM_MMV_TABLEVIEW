//
//  ViewController.swift
//  MVVM_TableView
//
//  Created by Victor Hugo Benitez Bosques on 8/20/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  private var bsEmployeeViewModel : EmployeeListInterface?
  private var bsDataSource : EmployeeDataSource?
  
  @IBOutlet weak var tblTableView : UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tblTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    bsEmployeeViewModel = EmployeesViewModel(APIService())
    setupDataSource()
    invokeBind()
  }
  
  func setupDataSource(){
    
    bsDataSource = EmployeeDataSource(EmployeesViewModel(APIService()))
    self.tblTableView.dataSource = bsDataSource
    self.tblTableView.delegate = bsDataSource
    
  }
  
  func invokeBind(){
    bsEmployeeViewModel?.bindEmployee = { [weak self] in
      DispatchQueue.main.async {
        self?.tblTableView.reloadData()
      }
    }
  }
  
}
