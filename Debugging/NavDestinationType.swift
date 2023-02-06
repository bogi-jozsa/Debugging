//
//  NavDestinationType.swift
//  Debugging
//
//  Created by Wolfpack Digital on 05.02.2023.
//

import Foundation
import SwiftUI

enum NavDestinationType: View {
    case new
    case update(ToDo)
    
    var body: some View {
        switch self {
        case .new: return ToDoFormView(viewModel: ToDoFormViewModel())
        case .update(let toDo): return ToDoFormView(viewModel: ToDoFormViewModel(currentToDo: toDo))
        }
    }
}
