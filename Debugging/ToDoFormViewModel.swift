//
//  ToDoFormViewModel.swift
//  Debugging
//
//  Created by Wolfpack Digital on 29.01.2023.
//

import Foundation

class ToDoFormViewModel: ObservableObject {
    
    var toDoStorage: DataStore = DataStore()
    
    @Published var titleText: String = ""
    @Published var descriptionText: String = ""
    @Published var isCompleted: Bool = false
    @Published var date: Date = Date()
    
    var id: String?
    
    init() {}
    
    init(currentToDo: ToDo) {
        self.titleText = currentToDo.title
        self.descriptionText = currentToDo.description
        self.isCompleted = currentToDo.isCompleted
        self.date = currentToDo.date
        self.id = currentToDo.id
    }
    
    var updating: Bool { id != nil }
    var isDisabled: Bool { titleText.isEmpty || descriptionText.isEmpty }
}

