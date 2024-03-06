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
                    VStack(alignment: .leading){
                        HStack(spacing: 20){
                            Image(systemName: "1.circle")
                                .font(.title3)
                                .foregroundStyle(Color.secondary)
                            Text("Open the **Shortcuts app** in your iPhone, from your homescreen.")
                        }
                        
                        
                            
                    }
                }
                
                Section{
                    VStack(alignment: .leading){
                        HStack(spacing:20){
                            Image(systemName: "2.circle")
                                .font(.title3)
                                .foregroundStyle(Color.secondary)
                            Text("Go to the **Automation tab** and tap on \"+\" icon in the top left to add new personal automation. ")
                        }
                        
//                        Image("addIconSS")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .cornerRadius(10)
                    }
                }
                
                Section{
                    VStack(alignment: .leading){
                        HStack(spacing:20){
                            Image(systemName: "3.circle")
                                .font(.title3)
                                .foregroundStyle(Color.secondary)
                            Text("Scroll down, and select **App**.")
                        }
                        
                        Image("searchAppOptionSS")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    }
                }
                
                Section{
                    VStack(alignment: .leading){
                        HStack(spacing:20){
                            Image(systemName: "4.circle")
                                .font(.title3)
                                .foregroundStyle(Color.secondary)
                            VStack(alignment: .leading, spacing: 20){
                                Text("Choose the app you would like to interrupt.(e.g. Pinterest)")
                                Text("Note: Only select one app. A seperate automation is required for each app.")
                            }
                        }
                        
                        Image("selectAppSS")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    }
                }
                
                Section{
                    VStack(alignment: .leading){
                        HStack(spacing:20){
                            Image(systemName: "5.circle")
                                .font(.title3)
                                .foregroundStyle(Color.secondary)
                            VStack(alignment: .leading, spacing: 20){
                                Text("Select **+ New Blank Automation**.")
                            }
                        }
                        
                        Image("selectNewBlankAutomationsSS")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    }
                }
                
                Section{
                    VStack(alignment: .leading){
                        HStack(spacing:20){
                            Image(systemName: "6.circle")
                                .font(.title3)
                                .foregroundStyle(Color.secondary)
                            VStack(alignment: .leading, spacing: 20){
                                Text("Click **Add Action**.\n\nSearch for Just a sec, and click on **show Interruption View Intent**.\n\nTap on **Done**!")
                            }
                        }
                        
                        Image("selectInterruptSS")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
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
