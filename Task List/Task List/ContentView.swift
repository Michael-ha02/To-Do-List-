//
//  ContentView.swift
//  Task List
//
//  Created by Michael on 23/06/2021.
//

import SwiftUI
import Combine
struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newToDo : String = ""
    
    var searchBar : some View {
        HStack{
            TextField("Enter in new task",text: self.$newToDo)
            Button(action: self.addNewToDo, label:{Text("Add New")})
        }
    }
    func addNewToDo(){
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count + 1), toDoItem: newToDo))
        self.newToDo = ""
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                searchBar.padding()
                List{ ForEach(self.taskStore.tasks){task in Text(task.toDoItem)}.onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                }.navigationBarTitle("TO DO LIST")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    func move(from source : IndexSet, to destination : Int){
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
        }
        
    func delete(at offsets : IndexSet) {
        taskStore.tasks.remove(atOffsets: offsets)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

