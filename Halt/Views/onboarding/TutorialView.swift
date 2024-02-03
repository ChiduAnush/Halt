//
//  TutorialView.swift
//  Halt
//
//  Created by Chidu Anush on 03/02/24.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {


        NavigationStack{
            List{
                
                Section(""){
                    VStack(alignment: .leading, spacing: 15){
                        Text("Follow along below steps to set up halts to your unproductive apps.")
                        Text("Remember: You need to follow these steps from the beginning till the end for each app you want to interrupt.")
                            .foregroundStyle(Color(.systemGray))
                    }
                    
                }
                
                Section("step by step guide"){
                    VStack{
                        HStack(spacing: 20){
                            Image(systemName: "1.circle")
                                .font(.title3)
                            Text("Open the **Shortcuts app** in your iPhone, from your homescreen.")
                        }
                    }
                }
                
                Section{
                    VStack{
                        HStack(spacing:20){
                            Image(systemName: "2.circle")
                                .font(.title3)
                            Text("Go to the **Automation tab** and tap on \"+\" icon in the top left to add new personal automation. ")
                        }
                    }
                }
                
                Section{
                    VStack{
                        HStack(spacing:20){
                            Image(systemName: "3.circle")
                                .font(.title3)
                            Text("Scroll down, and select **App**.")
                        }
                    }
                }
                
                Section{
                    VStack{
                        HStack(spacing:20){
                            Image(systemName: "4.circle")
                                .font(.title3)
                            VStack(alignment: .leading, spacing: 20){
                                Text("Choose the app you would like to interrupt.(e.g. Pinterest)")
                                Text("Note: Only select one app. A seperate automation is required for each app.")
                            }
                        }
                    }
                }
                


                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Set up \"Halt\"")
        }


    }
}

#Preview {
    TutorialView()
}
