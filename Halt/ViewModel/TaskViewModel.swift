//
//  TaskViewModel.swift
//  Task manage practice
//
//  Created by diyalv on 27/02/24.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
  
    //current week day
    @Published var currentWeek: [Date] = []
    //current day
    @Published var currentDay: Date = Date()
    // Filtering today tasks
    @Published var filteredTasks: [Task]?
    
    // New task View
    @Published var addNewTask: Bool = false
    // Edit task
    @Published var editTask: Task?
    
    
    // Core Data context
    let context = PersistenceController.shared.container.viewContext

        // MARK: - Fetch latest upcoming task
    func fetchLatestUpcomingTask(completion: @escaping (Task?) -> Void) {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = NSPredicate(format: "taskDate > %@" , Date() as NSDate)
        request.sortDescriptors = [NSSortDescriptor(key: "taskDate", ascending: true)]
        request.fetchLimit = 1
        
        do {
            let tasks = try context.fetch(request)
            completion(tasks.first)
        } catch {
            print("Error fetching upcoming task: \(error.localizedDescription)")
            completion(nil)
        }
    }
    

//    func fetchLatestUpcomingTask(completion: @escaping (Task?) -> Void) {
//        let request: NSFetchRequest<Task> = Task.fetchRequest()
//        request.predicate = NSPredicate(format: "taskDate > %@ AND isCompleted == %@", Date() as NSDate, NSNumber(value: false))
//        request.sortDescriptors = [NSSortDescriptor(key: "taskDate", ascending: true)]
//        request.fetchLimit = 1
//        
//        do {
//            let tasks = try context.fetch(request)
//            completion(tasks.first)
//        } catch {
//            print("Error fetching upcoming task: \(error.localizedDescription)")
//            completion(nil)
//        }
//    }
    
    func fetchTodayTasks(completion: @escaping ([Task]) -> Void) {
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        
        // Create a predicate to filter tasks for today's date
        let calendar = Calendar.current
        let startOfDay = calendar.startOfDay(for: Date())
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        let predicate = NSPredicate(format: "taskDate >= %@ AND taskDate < %@", startOfDay as NSDate, endOfDay as NSDate)
        
        request.predicate = predicate
        
        do {
            let tasks = try context.fetch(request)
            completion(tasks)
        } catch {
            print("Error fetching today's tasks: \(error.localizedDescription)")
            completion([])
        }
    }

    
    //MARK: - Init
    init() {
        fetchCurrentWeek()
    }
    
    //Fetch week
    func fetchCurrentWeek() {
        let today = Date()
        let calendar = Calendar.current

        // Clear out the currentWeek array
        currentWeek.removeAll()

        // Add the next 7 days to the currentWeek array
        for i in 0..<31 {
            if let nextDay = calendar.date(byAdding: .day, value: i, to: today) {
                currentWeek.append(nextDay)
            }
        }
    }
  
    //Extracting Date
    func extractDate(date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
    
    //check today date
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        return calendar.isDate(currentDay, inSameDayAs: date)
    }
    
    //check current time is task time
    func isCurrentDateTime(date: Date) -> Bool {
        
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        
        let currentHour = calendar.component(.hour, from: Date())
        let isToday = calendar.isDateInToday(date)
        
        return (hour == currentHour && isToday)
    }
}
