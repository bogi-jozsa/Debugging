//
//  ToDo.swift
//  Debugging
//
//  Created by Wolfpack Digital on 29.01.2023.
//

import Foundation

struct ToDo: Codable, Hashable, Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var description: String
    var date: Date
    var isCompleted: Bool = false
}

public func getTodaysDate() -> Date {
    let date = Date()
    let dateFormatter = DateFormatter()
     
    dateFormatter.dateFormat = "dd.MM.yyyy"
    let resultString = dateFormatter.string(from: date)
    
    let resultDate = dateFormatter.date(from: resultString) ?? Date()
    return resultDate
}
