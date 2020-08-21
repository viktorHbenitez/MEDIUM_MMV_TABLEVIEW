//
//  BSEmployeeData.swift
//  MVVM_TableView
//
//  Created by Victor Hugo Benitez Bosques on 8/20/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation


struct  BSEmployeeData : Decodable {
    var Id : String
    var strName : String
    var strSalary : String
    var strAge : String
    var strImage : String
    
    
    enum CodingKeys : String, CodingKey{
        case Id = "id"
        case strName  = "employee_name"
        case strSalary = "employee_salary"
        case strAge   = "employee_age"
        case strImage = "profile_image"
    }
   
}
