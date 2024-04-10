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
    
    var body: some View {
        
        ZStack{
            
            
            
            Color.black
                .ignoresSafeArea()
                .onAppear(perform: {
                    
                    withAnimation(.easeIn(duration: 2.0)) {
                        showText = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        
                        playSound()
                        self.showBlank = false
                        showAlert = true
                        
                    }
                })
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Congratulations!"), message: Text("You have successfully completed the 20:20:20 rule. Keep it up!"), dismissButton: .default(Text("Awesome!")))
                }
            
            VStack{
                
                
                if showText {
                    Text("Look away from your phone till you hear a bell.")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(showText ? 1 : 0)
                        .offset(x: showText ? 0 : -UIScreen.main.bounds.width/2)
                    
                    Text("Look at somethng at least 20 ft away from your eyes.")
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
