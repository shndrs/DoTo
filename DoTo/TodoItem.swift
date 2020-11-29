//
//  TodoItem.swift
//  DoTo
//
//  Created by Sahand Raeisi on 11/29/20.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    
    var id = UUID()
    let todo: String
    
}
