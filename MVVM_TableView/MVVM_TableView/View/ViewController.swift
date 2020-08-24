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
  private var dataSourceGeneric : GenericDataSource<UITableViewCell, BSEmployeeData>?
  
  @IBOutlet weak var tblTableView : UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupGenericData()
  }
  
  func setupGenericData(){
    bsEmployeeViewModel = EmployeesViewModel(APIService())
    bsEmployeeViewModel?.setup(tblTableView)
    bsEmployeeViewModel?.bindEmployee = {
      self.setDataSource()
    }
  }
  
  func setDataSource(){
    self.dataSourceGeneric = GenericDataSource("Cell", bsEmployeeViewModel?.arrData, { cell, data  in
      cell.textLabel?.text = data.strName
    }, { data in
      print("Selected ",data)
    })
    
    
    DispatchQueue.main.async {
      self.tblTableView.dataSource = self.dataSourceGeneric
      self.tblTableView.delegate = self.dataSourceGeneric
      self.tblTableView.reloadData()
    }
    
  }

  
  
  
}
