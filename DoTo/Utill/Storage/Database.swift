//
//  Database.swift
//  DoTo
//
//  Created by Sahand Raeisi on 11/29/20.
//

import Foundation

final class Database {

    private let defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    subscript(key: String) -> String? {
        get {
            return defaults.string(forKey: key)
        } set {
            defaults.set(newValue, forKey: key)
        }
    }
}
