//
//  InterruptionScreenSettingsView.swift
//  Halt
//
//  Created by Chidu Anush on 03/02/24.
//

import SwiftUI

struct InterruptionScreenSettingsView: View {
    
    
    @State private var showText1 = false
    @State private var showText2 = false
    
    @State private var showNewView = false
    
    
    
    var body: some View {
        
        Text("settings")
//        
//        ZStack {
//            HStack{
//                VStack(alignment: .leading){
//                    Text("Uh oh")
//                        .font(.system(size: 50))
//                        .offset(x: showText1 ? 0 : -UIScreen.main.bounds.width/2)
//                        .opacity(showText1 ? 1 : 0)
//                        .onAppear() {
//                            withAnimation(.easeOut(duration: 1)) {
//                                self.showText1 = true
//                            }
//                        }
//                    
//                    
//                    Text("Lorem ipsum set donor amit lorem\nipsum set donor amit")
//                        .opacity(showText2 ? 1 : 0)
//                }
//                
//                Spacer()
//            }
//            .padding(.leading)
//            .onAppear{
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
//                    withAnimation {
//                        showText2 = true
//                    }
//                }
//            }
//            
//            if showNewView {
//                InterruptionTasks()
//                    .transition(.move(edge: .bottom))
//                    .animation(.easeInOut(duration: 2))
//            }
//            
//            
//            
//            
//            
//            
//        }
//        .onAppear{
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
////                withAnimation {
////                    showNewView = true
////                }
//                showNewView = true
//            }
//        }
        
        
        
        
        
        
    }
}

#Preview {
    InterruptionScreenSettingsView()
}
