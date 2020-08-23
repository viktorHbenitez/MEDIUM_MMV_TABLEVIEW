//
//  EmployeeDataSource.swift
//  MVVM_TableView
//
//  Created by Victor Hugo Benitez Bosques on 23/08/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation
import UIKit

class EmployeeDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
 
  private var bsModelView : EmployeeListInterface
  
  init(_ bsDataModelView : EmployeeListInterface) {
    bsModelView = bsDataModelView
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bsModelView.numberOfRowsInSection(tableView, section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return bsModelView.cellForRowAt(tableView, indexPath)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Cell selected", indexPath.row)
  }
  
  
  
  
  
  
}
