//
//  OnBoardingView.swift
//  Halt
//
//  Created by Chidu Anush on 02/02/24.
//

import SwiftUI

//struct OnBoardingView: View {
//    var body: some View {
//
//        NavigationStack{
//            VStack(spacing: 35){
//                Spacer()
//
//                VStack{
//                    Text("Welcome to Halt")
//                        .font(.title)
//                        .fontWeight(.bold)
//
//                    Text("Conquer distractions. Own your focus.")
//                        .font(.subheadline)
//                        .fontWeight(.light)
//                }
//                .padding(.vertical, 50)
//
//
//                VStack(spacing: 10){
//                    HStack(){
//                        Image(systemName: "macbook")
//                            .resizable()
//                            .frame(width:30, height: 25)
//                            .font(.title)
//                            .foregroundStyle(Color(.systemIndigo))
//                            .padding(.horizontal)
//
//                        VStack(alignment:.leading){
//                            Text("Boost Productivity")
//                                .font(.callout)
//                                .fontWeight(.medium)
//                            Text("Stay focussed and productive by effectively managing distractions.")
//                                .font(.callout)
//                                .fontWeight(.light)
//                                .foregroundStyle(Color(.systemGray))
//                                .fixedSize(horizontal: false, vertical: true)
//                        }
//                    }
//                    Spacer()
//
//                    HStack(){
//                        Image(systemName: "stopwatch")
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                            .font(.title)
//                            .foregroundStyle(Color(.systemIndigo))
//                            .padding(.horizontal)
//                        VStack(alignment:.leading){
//                            Text("Reclaim your time")
//                                .font(.callout)
//                                .fontWeight(.medium)
//                            Text("Regain control over how your time is spent.")
//                                .font(.callout)
//                                .fontWeight(.light)
//                                .foregroundStyle(Color(.systemGray))
//                                .fixedSize(horizontal: false, vertical: true)
//                        }
//                    }
//                    Spacer()
//
//                    HStack(){
//                        Image(systemName: "pencil.line")
//                            .resizable()
//                            .frame(width: 30, height: 30)
//                            .font(.title)
//                            .foregroundStyle(Color(.systemIndigo))
//                            .padding(.horizontal)
//                        VStack(alignment:.leading){
//                            Text("Never forget")
//                                .font(.callout)
//                                .fontWeight(.medium)
//                            Text("Get timely reminders for your tasks and events.")
//                                .font(.callout)
//                                .fontWeight(.light)
//                                .foregroundStyle(Color(.systemGray))
//                                .fixedSize(horizontal: false, vertical: true)
//                        }
//                    }
//                    Spacer()
//                }
//
//                Spacer()
//                Spacer()
//
//            }
//            .padding(10)
//            NavigationLink(destination: TutorialView()){
//                Text("Continue")
//                    .fontWeight(.medium)
//                    .foregroundStyle(Color(.white))
//                    .padding(.horizontal, 100)
//                    .padding(.vertical, 15)
//                    .background(Color(.systemIndigo))
//                    .clipShape(RoundedRectangle(cornerRadius: 15))
//            }.padding(.bottom, 60)
//        }
//    }
//}

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
                

        
              
        NavigationStack{
                    VStack(spacing: 35){
                        Spacer()
                        
                        VStack{
                            Text("Welcome to Just a sec")
                                .font(.title)
                                .fontWeight(.bold)
                            
                            Text("Conquer distractions. Own your focus.")
                                .font(.subheadline)
                                .fontWeight(.light)
                        }
                        .padding(.vertical, 50)
                        
                        
                        VStack(spacing: 10){
                            HStack(){
                                Image(systemName: "macbook")
                                    //.resizable()
                                    .frame(width: 30, height: 20)
                                    .font(.title)
                                    .padding(.horizontal)
                                    .foregroundStyle(Color(.systemIndigo))
                                VStack(alignment:.leading){
                                    Text("Boost Productivity")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                    Text("Stay focussed and productive by effectively managing distractions.")
                                        .font(.callout)
                                        .fontWeight(.light)
                                        .foregroundStyle(Color(.systemGray))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            Spacer()
                            
                            HStack(){
                                Image(systemName: "stopwatch")
                                    //.resizable()
                                    .frame(width: 30, height: 30)
                                    .font(.title)
                                    .foregroundStyle(Color(.systemIndigo))
                                    .padding(.horizontal)
                                VStack(alignment:.leading){
                                    Text("Reclaim your time")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                    Text("Regain control over how your time is spent.")
                                        .font(.callout)
                                        .fontWeight(.light)
                                        .foregroundStyle(Color(.systemGray))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            Spacer()
                            
                            HStack(){
                                Image(systemName: "pencil.line")
                                    //.resizable()
                                    .frame(width: 30, height: 30)
                                    .font(.title)
                                    .foregroundStyle(Color(.systemIndigo))
                                    .padding(.horizontal)
                                VStack(alignment:.leading){
                                    Text("Never forget")
                                        .font(.callout)
                                        .fontWeight(.medium)
                                    Text("Get timely reminders for your tasks and events.")
                                        .font(.callout)
                                        .fontWeight(.light)
                                        .foregroundStyle(Color(.systemGray))
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            Spacer()
                        }
                        
                        Spacer()
                        Spacer()
                        
                    }
                    .padding(10)
                    NavigationLink(destination: TutorialView()){
                        Text("Continue")
                            .fontWeight(.medium)
                            .foregroundStyle(Color(.white))
                            .padding(.horizontal, 100)
                            .padding(.vertical, 15)
                            .background(Color(.systemIndigo))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }.padding(.bottom, 60)
                }
            }
       
}




#Preview {
    OnBoardingView()
}
