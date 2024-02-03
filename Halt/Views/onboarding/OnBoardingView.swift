//
//  OnBoardingView.swift
//  Halt
//
//  Created by Chidu Anush on 02/02/24.
//

import SwiftUI

struct OnBoardingView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 40){
                Spacer()
                
                VStack{
                    Text("Welcome to Halt")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Conquer distractions. Own your focus.")
                        .font(.subheadline)
                        .fontWeight(.light)
                }
                .padding(.vertical, 25)
                
                
                
                HStack{
                    Image(systemName: "macbook")
                        .font(.title)
                        .foregroundStyle(Color(.systemIndigo))
                        .padding(.trailing, 10)
                    VStack(alignment:.leading){
                        Text("Boost Productivity")
                            .font(.callout)
                            .fontWeight(.medium)
                        Text("Stay focussed and productive by effectively managing distractions.")
                            .font(.callout)
                            .fontWeight(.light)
                            .foregroundStyle(Color(.systemGray))
                    }
                }
                
                HStack{
                    Image(systemName: "stopwatch")
                        .font(.title)
                        .foregroundStyle(Color(.systemIndigo))
                        .padding(.horizontal)
                    VStack(alignment:.leading){
                        Text("Reclaim your time")
                            .font(.callout)
                            .fontWeight(.medium)
                        Text("Regain control over how your time is spent. ")
                            .font(.callout)
                            .fontWeight(.light)
                            .foregroundStyle(Color(.systemGray))
                    }
                }
                
                HStack{
                    Image(systemName: "pencil.line")
                        .font(.title)
                        .foregroundStyle(Color(.systemIndigo))
                        .padding(.horizontal, 19)
                    VStack(alignment:.leading){
                        Text("Never forget")
                            .font(.callout)
                            .fontWeight(.medium)
                        Text("Get timely reminders for your tasks and events.")
                            .font(.callout)
                            .fontWeight(.light)
                            .foregroundStyle(Color(.systemGray))
                    }
                }
                
                Spacer()
                Spacer()
                
                NavigationLink(destination: HomeView()){
                    Text("Continue")
                        
                        .fontWeight(.medium)
                        .foregroundStyle(Color(.white))
                        .padding(.horizontal, 100)
                        .padding(.vertical, 15)
                        .background(Color(.systemIndigo))
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }

                
                Spacer()


            }
            .padding()
        }
        
        
    }
}

#Preview {
    OnBoardingView()
}
