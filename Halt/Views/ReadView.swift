//
//  ReadView.swift
//  Halt
//
//  Created by Chidu Anush on 03/02/24.
//

import SwiftUI

struct ReadView: View {
    var body: some View {
        
        //        Text("hello read")
        NavigationStack{
            List{
                
                Section(""){
                    VStack(alignment: .leading, spacing: 15){
                        Text("Congratulations! 🎉")
                        Text("You have earned time by choosing not to spend it on unproductive apps.")
                            .foregroundStyle(Color(.systemGray))
                    }
                    
                    Text("To help you not just pass this time, but to ") + Text("Invest It,").foregroundStyle(Color(uiColor: .systemIndigo)) + Text("\nHere are some tips for mindfull usage.")
                    
                }
                
                Section("wellbeing"){
                    VStack(alignment: .leading){
                        HStack(spacing: 20){
                            Text("🧘")
                                .font(.largeTitle)
                                .foregroundStyle(Color.secondary)
                            NavigationLink(destination: MeditationArticleView()) {
                                VStack(alignment: .leading, spacing: 15){
                                    VStack(alignment: .leading){
                                        Text("Guided Meditation")
                                            .fontWeight(.medium)
//                                        Text("Mental wellbeing")
//                                            .foregroundStyle(Color.secondary)
                                    }
                                    HStack(spacing: 5){
                                        Image(systemName: "clock")
                                        Text("5 mins")
                                        Spacer()
                                    }
                                    .font(.subheadline)
                                    .foregroundStyle(Color.secondary)
                                }
                            }
                        }
                        
                    }
                    .padding(.vertical, 8)
                    
                    VStack(alignment: .leading){
                        HStack(spacing: 20){
                            Text("💧")
                                .font(.largeTitle)
                                .foregroundStyle(Color.secondary)
                            NavigationLink(destination: MeditationArticleView()) {
                                VStack(alignment: .leading, spacing: 15){
                                    VStack(alignment: .leading){
                                        Text("Drink water")
                                            .fontWeight(.medium)
//                                        Text("wellbeing")
//                                            .foregroundStyle(Color.secondary)
                                    }
                                    HStack(spacing: 5){
                                        Image(systemName: "clock")
                                        Text("10 mins")
                                        Spacer()
                                    }
                                    .font(.subheadline)
                                    .foregroundStyle(Color.secondary)
                                }
                            }
                        }
                        
                    }
                    .padding(.vertical, 8)
                    
                    VStack(alignment: .leading){
                        HStack(spacing: 20){
                            Text("🏃")
                                .font(.largeTitle)
                                .foregroundStyle(Color.secondary)
                            NavigationLink(destination: MeditationArticleView()) {
                                VStack(alignment: .leading, spacing: 15){
                                    VStack(alignment: .leading){
                                        Text("Excercise and Stretching")
                                            .fontWeight(.medium)
//                                        Text("wellbeing")
//                                            .foregroundStyle(Color.secondary)
                                    }
                                    HStack(spacing: 5){
                                        Image(systemName: "clock")
                                        Text("10 mins")
                                        Spacer()
                                    }
                                    .font(.subheadline)
                                    .foregroundStyle(Color.secondary)
                                }
                            }
                        }
                        
                    }
                    .padding(.vertical, 8)
                    

                }
                
                
                
            }
            .listStyle(.insetGrouped)
            .navigationTitle("What can i do instead?")
        }
        
        
    }
    
    
    
    
    
    
}


#Preview {
    ReadView()
}


