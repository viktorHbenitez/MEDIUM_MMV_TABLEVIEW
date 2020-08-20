//
//  BSEmployee.swift
//  MVVM_TableView
//
//  Created by Victor Hugo Benitez Bosques on 8/20/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation

struct BSEmployees : Decodable {
    var strStatus : String
    var arrData : [BSEmployeeData]
    
    enum CodingKeys : String, CodingKey{
        case strStatus  =  "status"
        case arrData  = "data"
    }

}
