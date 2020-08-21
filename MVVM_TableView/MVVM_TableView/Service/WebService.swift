//
//  WebService.swift
//  MVVM_TableView
//
//  Created by Victor Hugo Benitez Bosques on 8/20/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation


protocol ServiceInterface {
    func getEmployees(handler : @escaping (BSEmployees?)->(Void)) -> Void
}


class APIService: NSObject, ServiceInterface {
    typealias Block = (BSEmployees?)->(Void)

    private let URL_GET_EMPLOYESS = URL(string: "http://dummy.restapiexample.com/api/v1/employees")
    
    func getEmployees(handler : @escaping Block){
        guard let url = URL_GET_EMPLOYESS else {return}
        
        URLSession.shared.dataTask(with: url){ data, response, error in
            if let data = data {
                let arrData = try? JSONDecoder().decode(BSEmployees.self, from: data)
                handler(arrData)
            }
            else {
                handler(nil)
            }
        }.resume()
    }
    
    
    
}

