//
//  ContentView.swift
//  Debugging
//
//  Created by Wolfpack Digital on 20.09.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataStorage: DataStore
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List() {
                        ForEach(dataStorage.toDos, id: \.self) { toDo in
                            NavigationLink(destination: NavDestinationType.update(toDo),
                                           label: {
                                VStack(alignment: .leading) {
                                    Text(toDo.title)
                                        .font(.headline)
                                        .strikethrough(toDo.isCompleted)
                                        .tint(Color.black)
                                    Text(toDo.description)
                                        .font(.caption)
                                        .tint(Color.black)
                                }
//                                .background(toDo.date > getTodaysDate() ? .yellow : .clear)
                            })
                        }
                        .onDelete(perform: dataStorage.deleteToDo)
                    }
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("To Do List")
                                .font(.largeTitle)
                        }
                        ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: NavDestinationType.new,
                                           label: {
                                Image(systemName: "plus.circle.fill")
                            })
                        }
                    }
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
//        .onAppear {
//            let helloWorld = "Hello World"
//            let width = helloWorld.size(withAttributes: [.font: Font.system(size: 16.0)])
////            let width = helloWorld.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16.0)])
//            print("\(width)")
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
