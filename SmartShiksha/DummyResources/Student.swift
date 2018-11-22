//
//  Student.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 11/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

struct ResponseData: Codable {
    var student: [Student]
}

class Student : Codable {
    var name: String
    var age: Int
    var city: String
    var gender: String
    var isPresent: Bool

    func markAttendance(){
        isPresent = !isPresent
    }
}
