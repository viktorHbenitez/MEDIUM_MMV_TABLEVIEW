//
//  EmployeesViewModel.swift
//  MVVM_TableView
//
//  Created by Victor Hugo Benitez Bosques on 23/08/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit


protocol TableViewInterface {
  var iSection        :  Int { get }
  func setup(_ tblView : UITableView)
  func numberOfRowsInSection(_ tblView : UITableView,
                             _ section : Int) -> Int
  func cellForRowAt(_ tblView : UITableView,
                    _ indexPath : IndexPath,
                    _ strCellIdentifier : String) -> UITableViewCell
}

protocol EmployeeInterface{
  var bindEmployee    : (()->())? {get set}
  var arrData         : [BSEmployeeData]? {get}
}

protocol EmployeeListInterface : TableViewInterface, EmployeeInterface {}


class EmployeesViewModel :EmployeeListInterface {
 
    private let service : ServiceInterface
    var iSection: Int = 1

    var arrData : [BSEmployeeData]?{
        didSet{
            guard let _ = arrData else { return }
            bindEmployee?()
        }
    }
    
    var bindEmployee: (()->())?
    
    init( _ service : ServiceInterface) {
        self.service = service
        executeService()
        
    }
    
    func executeService(){
        service.getEmployees { [weak self] bsEmployee in
            self?.arrData = bsEmployee?.arrData
        }
    }
    
  func setup(_ tblView : UITableView){
    tblView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
  

    func numberOfRowsInSection(_ tblView: UITableView,
                               _ section: Int) -> Int {
        switch section {
        case 0:
            return self.arrData?.count ?? 0
        default:
            return 0
        }
    }
    
    func cellForRowAt(_ tblView: UITableView,
                      _ indexPath: IndexPath,
                      _ strCellIdentifier : String) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            let cell = tblView.dequeueReusableCell(withIdentifier: strCellIdentifier, for: indexPath)
            
            let bsData = getObjModel(from: indexPath.row)
            cell.textLabel?.text = bsData?.strName
            
            return cell
        default:
            return UITableViewCell()
        }
    }
  
  func getObjModel(from row : Int) -> BSEmployeeData?{
    return arrData?[row]
  }
    
}







