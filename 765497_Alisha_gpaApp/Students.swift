//
//  Students.swift
//  765497_Alisha_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation
struct Student
{
    var Firstname: String
    var Lastname: String
    var StuID: String
    var marks = [[0,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]
    var GPA = [0.0,0.0,0.0]
    var cgpa: Double{
        
        return (GPA[0] + GPA[1] + GPA[2]) / 3
    }
    
    static var Students = [Student]()
}

