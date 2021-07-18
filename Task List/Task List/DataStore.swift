//
//  DataStore.swift
//  Task List
//
//  Created by Michael on 23/06/2021.
//

import Foundation
import SwiftUI
import Combine

struct Task : Identifiable {
    var id = String()
    var toDoItem = String()
    
    //Add more complicated stuff later if you want.
}
class TaskStore : ObservableObject {
    @Published var tasks = [Task]()
}
