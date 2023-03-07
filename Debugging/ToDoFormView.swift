//
//  ToDoFormView.swift
//  Debugging
//
//  Created by Wolfpack Digital on 29.01.2023.
//

import SwiftUI

struct ToDoFormView: View {
    
    @EnvironmentObject var dataStorage: DataStore
    @ObservedObject var viewModel: ToDoFormViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 10) {
            TextField("Title", text: $viewModel.titleText)
                .textFieldStyle(.roundedBorder)
            
            TextField("Description", text: $viewModel.descriptionText)
                .textFieldStyle(.roundedBorder)
            
            if viewModel.updating {
                Toggle("Completed", isOn: $viewModel.isCompleted)
            }
            
            updateSaveButton
            
            Spacer()
        }
        .padding()
        .navigationTitle("Add a new to do")
    }
}

extension ToDoFormView {
    func updateToDo() {
        guard let id = viewModel.id else {
            dismiss()
            return
        }
        
        let toDo = ToDo(id: id,
                        title: viewModel.titleText,
                        description: viewModel.descriptionText,
                        date: viewModel.date,
                        isCompleted: viewModel.isCompleted)
        dataStorage.updateToDo(toDo: toDo)
        dataStorage.actionCount += 1
        dismiss()
    }
    
    func addNewToDo() {
        let newToDo = ToDo(title: viewModel.titleText,
                           description: viewModel.descriptionText,
                           date: viewModel.date)
        dataStorage.addToDo(toDo: newToDo)
        dataStorage.actionCount += 1
        dismiss()
    }
    
    var updateSaveButton: some View {
        Button(action: { viewModel.updating ? updateToDo() : addNewToDo() },
               label: {
            Text(viewModel.updating ? "Update" : "Save")
                .tint(.black)
        })
        .buttonStyle(.bordered)
        .disabled(viewModel.isDisabled)
    }
}
