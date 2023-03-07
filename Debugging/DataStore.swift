//
//  DataStore.swift
//  Debugging
//
//  Created by Wolfpack Digital on 29.01.2023.
//

import Foundation

class DataStore: ObservableObject {
    
    @Published var toDos: [ToDo] = []
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("ToDos.txt")
    
    var actionCount: Int = 0
    
    init() {
        //for shell script:
//        let toDoPath: String = savePath.path
        
        loadToDos()
        
        //for conditional e.g.
//        insertPredefinedValues()
    }
    
    func loadToDos() -> Void {
        do {
            let data = try Data(contentsOf: savePath)
            toDos = try JSONDecoder().decode([ToDo].self, from: data)
        } catch {
            return
        }
    }
    
    func insertPredefinedValues() -> Void {
        let path: String = Bundle.main.path(forResource: "toDos", ofType: ".json") ?? ""
        do {
            let data: NSData = try NSData(contentsOfFile: path)
            do {
                let json = try JSONSerialization.jsonObject(with: data as Data) as? [AnyHashable : Any]
                if let json = json {
                    if let items: [[String: String]] = json["items"] as? [[String: String]] {
                        for item in items {
                            let title = item["title"] ?? ""
                            let description = item["description"] ?? ""
                            let newToDo = ToDo(title: title, description: description, date: Date())
                            toDos.append(newToDo)
                        }
                        saveToDos()
                    }
                }
            } catch {}
        } catch {}
    }
    
    func addToDo(toDo: ToDo) {
        toDos.append(toDo)
        saveToDos()
    }
    
    func updateToDo(toDo: ToDo) {
        guard let index = toDos.firstIndex(where: { $0.id == toDo.id } ) else { return }
        toDos[index] = toDo
        saveToDos()
    }
    
    func deleteToDo(indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveToDos()
    }
    
    func saveToDos() {
        do {
            let data = try JSONEncoder().encode(toDos)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Unable to save data.")
        }
    }
}

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        print(paths[0])
        return paths[0]
    }
}
