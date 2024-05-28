//
//  NewToDoView.swift
//  ToDoList
//
//  Created by Ali on 5/27/24.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    @Bindable var toDoItem: ToDoItem
    @Environment(\.modelContext) var modelContext
    @Binding var showNewTask: Bool
    var body: some View {
        VStack{
            Text("Task title:")
                .bold()
                .padding()
            TextField("Enter the task description...", text: $toDoItem.title, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Toggle(isOn: $toDoItem.isImportant) {
                Text("Is it imporant?")
                    .padding()
                Button {
                    addToDo()
                    self.showNewTask = false
                } label: {
                    Text("Save")
                }
            }
        }
        .padding()
        Spacer()
    }
    func addToDo(){
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: ToDoItem.self, configurations: config)

    let toDo = ToDoItem(title: "Example ToDo", isImportant: false)
    return NewToDoView(toDoItem: toDo, showNewTask: .constant(true))
        .modelContainer(container)
}
