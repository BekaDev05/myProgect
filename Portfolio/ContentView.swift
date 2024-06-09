//
//  ContentView.swift
//  Portfolio
//
//  Created by Бектур Каримов on 9/6/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
        @State private var newTaskTitle: String = ""

        var body: some View {
            NavigationView {
                VStack {
                    HStack {
                        TextField("Enter new task", text: $newTaskTitle)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button(action: {
                            let task = Task(title: newTaskTitle)
                            taskStore.tasks.append(task)
                            newTaskTitle = ""
                        }) {
                            Text("Add")
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(5)
                        }
                    }
                    List {
                        ForEach(taskStore.tasks) { task in
                            TaskRow(task: task)
                        }
                        .onDelete(perform: deleteTasks)
                    }
                }
                .navigationBarTitle("ToDo List")
                .navigationBarItems(trailing: EditButton())
            }
        }

        func deleteTasks(at offsets: IndexSet) {
            taskStore.tasks.remove(atOffsets: offsets)
        }
    }

    struct TaskRow: View {
        @State var task: Task

        var body: some View {
            HStack {
                Text(task.title)
                Spacer()
                Button(action: {
                    task.isCompleted.toggle()
                }) {
                    Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(task.isCompleted ? .green : .gray)
                }
            }
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }

 }

#Preview {
    ContentView()
}
