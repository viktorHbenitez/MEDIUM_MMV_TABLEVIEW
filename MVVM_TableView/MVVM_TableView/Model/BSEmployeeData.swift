//
//  BSEmployeeData.swift
//  MVVM_TableView
//
//  Created by Victor Hugo Benitez Bosques on 8/20/20.
//  Copyright © 2020 Victor Hugo Benitez Bosques. All rights reserved.
//

import Foundation


struct  BSEmployeeData : Decodable {
    
    /* var id : String
    var employee_name : String
    var employee_salary : Double
    var employee_age : Int
    var profile_image : String*/
    var Id : Int
    var strName : String
    var strSalary : Int
    var strAge : Int
    var strImage : String
    
    
    enum CodingKeys : String, CodingKey{
        case Id = "id"
        case strName  = "employee_name"
        case strSalary = "employee_salary"
        case strAge = "employee_age"
        case strImage = "profile_image"
    }
   
}
