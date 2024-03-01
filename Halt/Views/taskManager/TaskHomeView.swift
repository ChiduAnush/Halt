//
//  TaskHomeView.swift
//  Halt
//
//  Created by user2 on 29/02/24.
//

import SwiftUI

struct TaskHomeView: View {
    @StateObject var taskModel: TaskViewModel = TaskViewModel()
    @Namespace var animation

    //Coredate Context
    @Environment(\.managedObjectContext) var context
    //Edit button context
    @Environment(\.editMode) var editButtonContext
     

    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
                // MARK: Lazy Stack With Pinned Header
            LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                Section {
                        // MARK: Current Week View
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10){
                            ForEach(taskModel.currentWeek,id: \.self){day in
                                VStack(spacing: 10){
                                    Text(taskModel.extractDate(date: day, format: "dd"))
                                        .font(.system(size: 18))
                                        .fontWeight(.semibold)
            
                                    
                                        // EEE will return day as MON,TUE,....etc
                                    Text(taskModel.extractDate(date: day, format: "EEE"))
                                        .font(.system(size: 17))
                                    
                                    Circle()
                                        .fill(.white)
                                        .frame(width: 8, height: 8)
                                        .opacity(taskModel.isToday(date: day) ? 1 : 0)
                                }
                                    // MARK: Foreground Style
                                .foregroundStyle(taskModel.isToday(date: day) ? .white : .secondary)
                                .foregroundColor(taskModel.isToday(date: day) ? .primary: .indigo)
                                    // MARK: Capsule Shape
                                .frame(width: 45, height: 90)
                                .background(
                                    ZStack{
                                            // MARK: Matched Geometry Effect
                                        if taskModel.isToday(date: day){
                                            Capsule()
                                                .fill(.indigo).opacity(1)
                                                .matchedGeometryEffect(id: "CURRENTDAY", in: animation)
                                        }
                                    }
                                )
                                .contentShape(Capsule())
                                .onTapGesture {
                                        // Updating Current Day
                                    withAnimation{
                                        taskModel.currentDay = day
                                    }
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    tasksView()
                } header: {
                    headerView()
                }
            }
        }
        .ignoresSafeArea(.container, edges: .top)
        
        //MARK:- Add Button
        .overlay(
            Button(action: {
                taskModel.addNewTask.toggle()
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(.white)
                    .padding()
                    .background(.indigo, in: Circle())
                    .opacity(0.9)
                    .shadow(radius: 2)
                    
                
            })
            .padding()
            .opacity(0.8)
            .offset(y:-80)
            ,alignment: .bottomTrailing
                
            
        )
        .sheet(isPresented: $taskModel.addNewTask) {
            taskModel.editTask = nil
        } content: {
            NewTaskView()
                .environmentObject(taskModel)
        }
    }
    }

    struct TaskHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TaskHomeView()
    }
    }

    extension TaskHomeView {

        //Header
        func headerView() -> some View {
                HStack(spacing: 10) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(Date().formatted(date: .abbreviated, time: .omitted))
                            .foregroundColor(Color(uiColor: .systemIndigo))
                            .fontWeight(.semibold)
                        
                        Text("Today")
                            .font(.largeTitle.bold())
                    }
                    .hLeading()
                    
                    // MARK: - Edit button
                    EditButton()
                        .accentColor(.indigo)
                        .fontWeight(.semibold)
                        .environment(\.editMode, self.editButtonContext) // Add this line
                }
                .padding()
                .padding(.top, getSafeArea().top)
                .background(Color(UIColor.systemBackground)) // Dynamic background color
            }



        //Tasks View
    func tasksView() -> some View {
        
        LazyVStack(spacing: 20){
            //Converting object as Our Task Model
            DynamicFilteredView(dateToFilter: taskModel.currentDay) { (object: Task) in
                taskCardView(task: object)
            }
        }
        .padding()
        .padding(.top)
        }

        //Task card view
        
        func taskCardView(task: Task) -> some View {
            
            HStack(alignment: editButtonContext?.wrappedValue == .active ? .center : .top, spacing: 30){
                if editButtonContext?.wrappedValue == .active {
                    VStack(spacing: 10) {
                        Button {
                            // Edit task
                            taskModel.editTask = task
                            taskModel.addNewTask.toggle()
                        } label: {
                            Image(systemName: "pencil.circle.fill")
                                .font(.title)
                                .foregroundColor(.primary)
                        }
                        
                        Button {
                            // Delete task
                            context.delete(task)
                            try? context.save()
                        } label: {
                            Image(systemName: "minus.circle.fill")
                                .font(.title)
                                .foregroundColor(.red)
                        }
                    }
                } else {
                    VStack(spacing: 10){
                        Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                            .font(.title2)
                            .foregroundColor(task.isCompleted ? .green : .primary)
                            .onTapGesture {
                                // Toggle task completion
                                task.isCompleted.toggle()
                                try? context.save()
                            }
                        
                        Rectangle()
                            .fill(.primary)
                            .frame(width: 3)
                    }
                }
                
                VStack{
                    HStack(alignment: .top, spacing: 10) {
                        VStack(alignment: .leading, spacing: 12) {
                            Text(task.taskTitle ?? "")
                                .font(.title2.bold())
                            
                            Text(task.taskDescription ?? "")
                                .font(.callout)
                                .foregroundStyle(.secondary)
                        }
                        .hLeading()
                        Text(task.taskDate?.formatted(date: .omitted, time: .shortened) ?? "")
                    }
                }
                .foregroundColor(.primary)
                .padding(5)
                .background(Color("Black"))
                .cornerRadius(25)
            }
            .hLeading()
        }
        


    }

