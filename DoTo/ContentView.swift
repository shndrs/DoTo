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
                List {
                    ForEach(items) { item in
                        Text(item.todo)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
