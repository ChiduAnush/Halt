//
//  StartInterruptionView.swift
//  Halt
//
//  Created by user2 on 01/03/24.
//

import SwiftUI

struct StartInterruptionView: View {
    
    @State private var showUhOh = false
    @State private var showUhOhDesc = false
    
    @State private var showInterruptionTasks = false
    
    
    var body: some View {
        
        
        
        
        ZStack {
            
            
            HStack{
                VStack(alignment: .leading, spacing: 10){
                    Text("Just a sec!")
                        .font(.system(size: 50))
                        .offset(x: showUhOh ? 0 : -UIScreen.main.bounds.width/2)
                        .opacity(showUhOh ? 1 : 0)
                        .onAppear() {
                            withAnimation(.easeOut(duration: 1)) {
                                self.showUhOh = true
                            }
                            
                        }
                    
//                    Text("Lorem ipsum set donor amit lorem\nipsum set donor amit")
                    Text("Let's take a mindful moment before diving in. You sure u wanna continue??")
                        .opacity(showUhOhDesc ? 1 : 0)
                        .offset(x: 1)
                }
                
                Spacer()
            }
            .padding(.leading)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    withAnimation {
                        showUhOhDesc = true
                    }
                }
            }
            
            if showInterruptionTasks {
                InterruptionTasks()
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut(duration: 2))
            }
            
            
            
            
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.7) {
                showInterruptionTasks = true
            }
        }
        
        
        
    }
}

#Preview {
    StartInterruptionView()
}



