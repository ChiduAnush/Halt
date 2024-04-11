//
//  pink.swift
//  Halt
//
//  Created by ChiduAnush on 11/04/24.
//

import SwiftUI
import AVFoundation

struct pink: View {
    
    @State private var showText = false
    @State private var showAlert = false
    
    @AppStorage("showBlank") var showBlank: Bool = false
    
    @AppStorage("successCount") var successCount: Int = 0
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        
        ZStack{
            
            
            
            Color.black
                .ignoresSafeArea()
                .onChange(of: scenePhase) { newScenePhase in
                    if newScenePhase == .inactive || newScenePhase == .background {
                        self.showBlank = false
                        print("u missed it man.")
                        self.successCount -= 1
                    }
                }
                .onAppear(perform: {
                    
                    withAnimation(.easeIn(duration: 2.0)) {
                        showText = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        
                        playSound()
//                        showAlert = true
                        self.showBlank = false
       
                        self.successCount += 1
                        
                        
                    }
                })
                .onDisappear {
                    if showBlank {
                        showAlert = true
                    }
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Failed"), message: Text("You didn't finish the 20 seconds."), dismissButton: .default(Text("OK")))
                }
            
            VStack(spacing: 10){
                
                
                if showText {
                    Text("For the next 20 seconds, your world is bigger than this screen.")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(showText ? 1 : 0)
                        .offset(x: showText ? 0 : -UIScreen.main.bounds.width/2)
                        .multilineTextAlignment(.center)
                    
                    Text("Give your eyes a break and relax.")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(showText ? 1 : 0)
                        .offset(x: showText ? 0 : -UIScreen.main.bounds.width/2)
                }
            }
            
        }
        
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "cheerful-527", withExtension: "mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("Unable to play sound")
        }
    }
    
    
}

#Preview {
    pink()
}
