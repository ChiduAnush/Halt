//
//  DynamicFilteredView.swift
//  Task manage practice
//
//  Created by user2 on 27/02/24.
//
import SwiftUI
import CoreData

struct DynamicFilteredView<Content: View, T>: View where T: NSManagedObject {
    // MARK: - CoreData Request
    @FetchRequest var request: FetchedResults<T>
    let content: (T) -> Content
    
    init(dateToFilter: Date, @ViewBuilder content: @escaping (T) -> Content) {
        // Predicate to filter current date Tasks
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: dateToFilter)
        let tomorrow = calendar.date(byAdding: .day, value: 1, to: today)!
        
        let filterKey = "taskDate"
        
        let predicate = NSPredicate(format: "\(filterKey) >= %@ AND \(filterKey) < %@", argumentArray: [today, tomorrow])
        
        // Initialize request with NSPredicate and sorting descriptor
        _request = FetchRequest(entity: T.entity(), sortDescriptors: [.init(keyPath: \Task.taskDate, ascending: true)], predicate: predicate)
        self.content = content
    }
    
    var body: some View {
        Group {
            if request.isEmpty {
//                Text("No tasks found!!!")
//                    .font(.system(size: 16))
//                    .fontWeight(.light)
//                    .offset(y: 100)
                    VStack{
                        Image("Image4")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250, height: 250)
                        .opacity(0.80)
                        
                        Text("Add new Tasks!!")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(.secondary)
                    
                    }
                
            } else {
                ForEach(request, id: \.objectID) { object in
                    self.content(object)
                }
            }
        }
    }
}
