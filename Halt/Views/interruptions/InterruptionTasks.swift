//
//  InterruptionTasks.swift
//  Halt
//
//  Created by user2 on 28/02/24.
//

import SwiftUI
import UIKit

func openInstagram() {
    let appURL = NSURL(string: "instagram://app")!
    let webURL = NSURL(string: "https://instagram.com/")!
    
    let application = UIApplication.shared
    print("enter func")
    print(application.canOpenURL(appURL as URL))
    if application.canOpenURL(appURL as URL) {
        print("enter 1 if")
        print("set to true")
        application.open(appURL as URL)
    } else {
        // if Instagram app is not installed, open URL inside Safari
        print("enter else")
        application.open(webURL as URL)
    }
}

struct InterruptionTasks: View {
    var body: some View {
        
        ZStack {

            Color(uiColor: .systemBackground)
                .cornerRadius(40)
            
            LinearGradient(gradient: Gradient(colors: [Color(uiColor: .systemIndigo), Color(uiColor: .systemIndigo).opacity(0.65),  Color.clear]), startPoint: .topLeading, endPoint: .bottom)
                .cornerRadius(40)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 25){
                Spacer()
                
                HStack{
                    VStack(alignment: .leading){
                        
                        HStack(alignment: .bottom){
                            Text("25")
                                .foregroundStyle(Color(uiColor: .white))
                                .font(.system(size: 75))
                            
                            Text("min")
                                .foregroundStyle(Color(uiColor: .white))
                                .fontWeight(.bold)
                                .opacity(0.5)
                                .padding(.bottom)
                        }
                        
                        Text("Thats the time you have spent already today on just entertainment.")
                            .foregroundStyle(Color.white)
                        
                        Text("You got these tasks yet to finish !")
                            .foregroundStyle(Color(uiColor: .white))
                            .opacity(0.5)
                            .padding(.top, 25)
                        
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                
                VStack(spacing: 15){
                    InterruptionScreenTodoCardView(todoTitle: "iOS Team Gmeet", todoDesc: "Update the pitch.")
                        .padding(.horizontal, 10)
                    
                    InterruptionScreenTodoCardView(todoTitle: "Update Resume", todoDesc: "Add SwiftUI in skillset.")
                        .padding(.horizontal, 10)
                    
                    InterruptionScreenTodoCardView(todoTitle: "Essay on Herbology", todoDesc: "Minimum 3 pages.")
                        .padding(.horizontal, 10)
                }
                
                Spacer()
                
                VStack(spacing: 15){
                    Button(action: {
                        print("go bck")
                        exit(0)
                    }, label: {
                        Text("Go back")
                            .foregroundStyle(Color(uiColor: .white))
                            .frame(maxWidth: .infinity)
                            .padding(.vertical)
                            .background(Color(uiColor: .systemIndigo).opacity(0.9))
                            .cornerRadius(10)
                            .padding(.horizontal, 10)
                            
                            
                    })
                    
                    Button(action: {
                        openInstagram()
                    }, label: {
                        Text("Continue to app")
                            .foregroundStyle(Color(uiColor: .systemIndigo))
                            .padding(.bottom)
//                           .frame(maxWidth: .infinity)
//                           .padding(.vertical)
//                           .background(Color(uiColor: .black).opacity(0.2))
//                           .cornerRadius(10)
//                           .border(Color.black, width: 2)
//                           .padding(.horizontal, 10)
                            
                    })

                }

            }
            .padding(.horizontal, 5)
            
        }
        
        
    }
}

#Preview {
    InterruptionTasks()
}




struct InterruptionScreenTodoCardView: View {
    
    let todoTitle: String
    let todoDesc: String
    
    var body: some View {
            
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text(todoTitle)
                    .foregroundStyle(Color.white)
                    .fontWeight(.semibold)
                
                Text(todoDesc)
                    .foregroundStyle(Color.white)
                    .opacity(0.5)
                
            }
            
            
            Spacer()
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).opacity(0.2))
        
            
        
        
        
        
    }
}
