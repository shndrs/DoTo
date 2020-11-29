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
                    }, label: {
                        Image(systemName: "plus")
                    }).padding(.leading, 5)
                }.padding()
                
                // MARK: - TableView
                
                List {
                    ForEach(items) { item in
                        Text(item.todo).bold()
                    }
                }
            }
            .navigationBarTitle("Dotoo")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
