//
//  ContentView.swift
//  DoTo
//
//  Created by Sahand Raeisi on 11/29/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var new = ""
    @State private var items = [TodoItem]()
    
    var body: some View {
        
        // MARK: - Navigation

        NavigationView {
            VStack {
                
                // MARK: - Adding Stack
                
                HStack {
                    TextField("Add a Dotoo...", text: $new)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: {
                        guard !new.isEmpty else { return }
                        items.append(TodoItem(todo: new))
                        new = ""
                        save()
                    }, label: {
                        Image(systemName: "plus")
                    }).padding(.leading, 5)
                }.padding()
                
                // MARK: - TableView
                
                List {
                    ForEach(items) { item in
                        Text(item.todo).bold()
                    }.onDelete(perform: { indexSet in
                        delete(at: indexSet)
                    })
                }
            }
            .navigationBarTitle("Dotoos")
        }.onAppear(perform: { loadItems() })
        
    }
    
    private func delete(at offset: IndexSet) {
        items.remove(atOffsets: offset)
        save()
    }
    
    private func save() {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(items),
                                  forKey: "todoList")
    }
    
    private func loadItems() {
        if let dataItems = UserDefaults.standard.value(forKey: "todoList") as? Data {
            if let list = try? PropertyListDecoder().decode(Array<TodoItem>.self, from: dataItems) {
                self.items = list
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
