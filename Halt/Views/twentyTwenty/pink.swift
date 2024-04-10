//
//  pink.swift
//  Halt
//
//  Created by ChiduAnush on 11/04/24.
//

import SwiftUI
import AVFoundation

struct pink: View {
    
    @AppStorage("showBlank") var showBlank: Bool = false
    
    var body: some View {
        
        
        Color.pink
            .ignoresSafeArea()
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    
                    playSound()
                    self.showBlank = false
                    
                }
            })
                

        
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

//#Preview {
//    pink()
//}
