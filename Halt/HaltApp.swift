//
//  HaltApp.swift
//  Halt
//
//  Created by Chidu Anush on 02/02/24.
//

import SwiftUI
import UserNotifications
import AVFoundation

var player: AVAudioPlayer?

@main
struct HaltApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var Intentmodel = IntentViewModel.shared
    
    @StateObject private var notificationHandler = NotificationHandler()
    @AppStorage("showBlank") var showBlank: Bool = false
    
    @AppStorage("successCount") var successCount: Int = 0
    @Environment(\.scenePhase) private var scenePhase

//    @State private var player: AVAudioPlayer?

    var body: some Scene {
        WindowGroup {
            
            if showBlank {
                pink()
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
//                            if scenePhase == .active {
//                                self.successCount += 1
//                            }
//                            if scenePhase == .inactive || scenePhase == .background{
//                                print("inactive ho gya bhai")
//                                self.showBlank = false
//                            }
////                            self.showBlank = false
//                        }
//                    }
//                    .onAppear(perform: {
//                        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { _ in
//                            playSound()
//                            self.showBlank = false
//                        }
//                    })
//                    .onDisappear(perform: {
//                        playSound()
//                    })

            } else{
                
                
                
                if Intentmodel.showStartInterruptionView {
                    StartInterruptionView()
                } else {
                    ContentView()
                        .environment(\.managedObjectContext, persistenceController.container.viewContext)
                        .onAppear(perform: {
                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                                if let error = error {
                                    // Handle the error here.
                                    print("Error: \(error)")
                                }
                                
                                // Enable or disable features based on the authorization.
                                if granted {
                                    print("Notification permission granted.")
                                } else {
                                    print("Notification permission denied because: \(error?.localizedDescription ?? "unknown reason").")
                                }
                            }
                            
                        })
                        .environmentObject(notificationHandler)
                }
                
                
                
            }
            
            
            
            
        }
        .environmentObject(Intentmodel)

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



//class NotificationHandler: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
//    @Published var showNotificationView = false
//
//    override init() {
//        super.init()
//        UNUserNotificationCenter.current().delegate = self
//    }
//
//    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
//        // Check the identifier of the notification action
//        if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
//            // The user tapped on the notification, show the notification view
//            DispatchQueue.main.async {
//                self.showNotificationView = true
//            }
//        }
//        completionHandler()
//    }
//}

class NotificationHandler: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    @Published var showNotificationView = false
    @AppStorage("showBlank") var showBlank: Bool = false

    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Check the identifier of the notification action
        if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
            // The user tapped on the notification, show the blank screen
            DispatchQueue.main.async {
                self.showBlank = true
                Timer.scheduledTimer(withTimeInterval: 20, repeats: false) { _ in
                    self.playSound()
                    self.showBlank = false
                }
            }
        }
        completionHandler()
    }

    func playSound() {
        guard let url = Bundle.main.url(forResource: "cheerful-527", withExtension: "mp3") else { return }

        do {
            let player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("Unable to play sound")
        }
    }
}
