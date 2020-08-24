//
//  GenericDataSource.swift
//  MVVM_TableView
//
//  Created by Victor Hugo Benitez Bosques on 23/08/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation
import UIKit

class GenericDataSource<CellType, T>: NSObject, UITableViewDataSource, UITableViewDelegate where CellType: UITableViewCell{
  
  internal typealias closure = (CellType, T) -> (Void)
  internal typealias SelectedClosure = (T) -> (Void)
  internal var arrData : [T]?
  internal let strCellIdentifier : String
  internal let blockCellFor : closure
  internal let blockSelected : SelectedClosure
  
  init(_ strCell : String,
       _ data : [T]?,
       _ handler : @escaping closure,
       _ selectedHandler : @escaping SelectedClosure) {

    arrData = data
    strCellIdentifier = strCell
    blockCellFor = handler
    blockSelected = selectedHandler
  }
  
  
   func tableView(_ tableView:  UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrData?.count ?? 0
  }
  
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
    guard let cell = tableView.dequeueReusableCell(withIdentifier: strCellIdentifier, for: indexPath) as? CellType, let arrData = arrData  else {
      return UITableViewCell()
    }
    
    let data = arrData[indexPath.row]
    blockCellFor(cell, data)
    return cell
  }
  
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    
    if let item = arrData?[indexPath.row]{
      blockSelected(item)
    }
  }
  
}
