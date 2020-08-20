//
//  WebService.swift
//  MVVM_TableView
//
//  Created by Victor Hugo Benitez Bosques on 8/20/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation

class APIService: NSObject {
    
    private let URL_GET_EMPLOYESS = URL(string: "http://dummy.restapiexample.com/api/v1/employees")
    
    func getEmployees(){
        
        guard let url = URL_GET_EMPLOYESS else {return}
        URLSession.shared.dataTask(with: url){ data, response, error in
            
            if let data = data {
                let arrData = try? JSONDecoder().decode(BSEmployees.self, from: data)
                print(arrData)
            }
            else {
                print("error")
            }
        }.resume()
    }
    
    
    
}

