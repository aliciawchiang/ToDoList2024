//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Ali on 5/27/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
