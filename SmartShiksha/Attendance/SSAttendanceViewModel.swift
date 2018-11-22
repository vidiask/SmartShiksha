//
//  SSAttendanceViewModel.swift
//  SmartShiksha
//
//  Created by Vikas Pandey on 11/05/18.
//  Copyright © 2018 XYZ. All rights reserved.
//

import UIKit

class SSAttendanceViewModel: NSObject {
    var students = [Student]()


    override init() {
        super.init()
        if let data = loadJson("Students"){
            students = data
        }
    }


    func studentCount() -> Int {
        return students.count
    }

    func getStudent(atIndex:Int) -> Student? {
        if atIndex < 0 || atIndex >= students.count{
            return nil
        }else{
            return students[atIndex]
        }
    }

    func studentAttendance(index:Int) -> Void {
        if let student = getStudent(atIndex: index){
            student.markAttendance()
        }
    }

    @discardableResult
    func loadJson(_ fileName: String) -> [Student]? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode([Student].self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
