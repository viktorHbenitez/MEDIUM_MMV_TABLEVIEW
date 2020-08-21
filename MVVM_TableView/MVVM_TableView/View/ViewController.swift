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
    
    @IBOutlet weak var tblTableView : UITableView!{
        didSet{
            tblTableView.delegate = self
            tblTableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tblTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        bsEmployeeViewModel = EmployeesViewModel(APIService())
        invokeBind()
        
    }
    
    func invokeBind(){
        bsEmployeeViewModel?.bindEmployee = { [weak self] in
            DispatchQueue.main.async {
                self?.tblTableView.reloadData()
            }
        }
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bsEmployeeViewModel?.numberOfRowsInSection(tableView, section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return bsEmployeeViewModel?.cellForRowAt(tableView, indexPath) ?? UITableViewCell()
    }

}

protocol EmployeeListInterface {
    var iSection        :  Int { get }
    var bindEmployee    : (()->())? {get set}
    var arrData         : [BSEmployeeData]? {get}

    func numberOfRowsInSection(_ tblView : UITableView,
                               _ section : Int) -> Int
    func cellForRowAt(_ tblView : UITableView,
                      _ indexPath : IndexPath) -> UITableViewCell
}


class EmployeesViewModel :EmployeeListInterface {
   
    private let strCellIdentifier =  "cell"
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
                      _ indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            
            let cell = tblView.dequeueReusableCell(withIdentifier: strCellIdentifier, for: indexPath)
            
            let bsData = arrData?[indexPath.row]
            
            cell.textLabel?.text = bsData?.strName
            
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}







