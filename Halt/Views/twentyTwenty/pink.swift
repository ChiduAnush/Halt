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
    
    @State private var progress = 0.0
    
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
            
            VStack(spacing: 25){

                GeometryReader { geometry in
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .foregroundColor(Color(uiColor: .systemFill))
                            .frame(width: geometry.size.width , height: geometry.size.height)
                        Rectangle()
                            .foregroundColor(Color(uiColor: .systemIndigo))
//                            .frame(height: geometry.size.height)
                            .frame(width: progress * geometry.size.width)
                            .animation(.linear(duration: 10), value: progress)
                    }
                    .cornerRadius(50.0)
                }
                .frame(height: 10)
                .padding()
                .padding()
                .onAppear {
                    progress = 1.0
                }
                
                if showText {
                    Text("Your world is much bigger than this screen")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .opacity(showText ? 1 : 0)
                        .offset(x: showText ? 0 : -UIScreen.main.bounds.width/2)
                        .multilineTextAlignment(.center)
                    
                    Text("Give your eyes some rest")
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
