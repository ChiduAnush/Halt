////
////  twentytwenty.swift
////  Halt
////
////  Created by user2 on 05/03/24.
////
//
//import SwiftUI
//
////struct twentytwenty: View {
////    var body: some View {
////        Text("Hello, World!")
////    }
////}
//
//#Preview {
////    twentytwentyView(viewModel: TwentyTwentyTwentyViewModel())
//    twentytwentyView()
//}
//
//
//
//import SwiftUI
//import UserNotifications
//
//struct twentytwentyView: View {
//    @AppStorage("is202020Enabled") var is202020Enabled: Bool = false
//
////    @ObservedObject var viewModel: TwentyTwentyTwentyViewModel
//
//    var body: some View {
//        List{
//            Section(footer: Text("The 20:20:20 feature is designed to help reduce eye strain.\n\nThe rule is simple: every 20 minutes, take a 20 second break and look at something at least 20 feet away from your eyes.")){
//                Toggle(isOn: $is202020Enabled, label: {
//                    Text("Enable 20:20:20 Feature")
//                })
//                .tint(Color(uiColor: .systemIndigo))
//                .onChange(of: is202020Enabled) { newValue in
//                    if newValue {
//                        print("feature enabled")
//                        scheduleNotifications()
////                        viewModel.showToast = true
////                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
////                            viewModel.showToast = false
////                        }
//                    } else {
//                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
//                    }
//                }
//            }
//            
//            
//        }
//        
//        
//        
//
//    }
//
//    func scheduleNotifications() {
//        let center = UNUserNotificationCenter.current()
//
//        // Schedule the repeating notifications
//        let repeatingContent = UNMutableNotificationContent()
//        repeatingContent.title = "20:20:20 Reminder"
//        repeatingContent.body = "Look at something 20 meters away for 20 seconds"
//        repeatingContent.sound = UNNotificationSound.default
//
//        let repeatingTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
//
//        let repeatingRequest = UNNotificationRequest(identifier: UUID().uuidString, content: repeatingContent, trigger: repeatingTrigger)
//
//        center.add(repeatingRequest)
//
//
//    }
//
//}

import SwiftUI
import UserNotifications
//import AVFoundation

struct twentytwentyView: View {
    @AppStorage("is202020Enabled") var is202020Enabled: Bool = false
    @AppStorage("showBlank") var showBlank: Bool = false
//    @State private var player: AVAudioPlayer?

    var body: some View {
        
        List{
            Section(footer: Text("The 20:20:20 feature is designed to help reduce eye strain.\n\nThe rule is simple: every 20 minutes, take a 20 second break and look at something at least 20 feet away from your eyes.")){
                Toggle(isOn: $is202020Enabled, label: {
                    Text("Enable 20:20:20 Feature")
                })
                .tint(Color(uiColor: .systemIndigo))
                .onChange(of: is202020Enabled) { newValue in
                    if newValue {
                        print("feature enabled")
                        scheduleNotifications()
                    } else {
                        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                    }
                }
                
                Button(action: {
                    self.showBlank = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        
                        self.showBlank = false
                        
                    }
                }) {
                    Text("Start 20:20:20")
                }
            }
        }
        
    }

    func scheduleNotifications() {
        let center = UNUserNotificationCenter.current()

        // Schedule the repeating notifications
        let repeatingContent = UNMutableNotificationContent()
        repeatingContent.title = "20:20:20 Reminder"
        repeatingContent.body = "Look at something 20 meters away for 20 seconds"
        repeatingContent.sound = UNNotificationSound.default

        let repeatingTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)

        let repeatingRequest = UNNotificationRequest(identifier: UUID().uuidString, content: repeatingContent, trigger: repeatingTrigger)

        center.add(repeatingRequest)
    }

//    func playSound() {
//        guard let url = Bundle.main.url(forResource: "that-was-quick-606", withExtension: "mp3") else { return }
//
//        do {
//            player = try AVAudioPlayer(contentsOf: url)
//            player?.play()
//        } catch {
//            print("Unable to play sound")
//        }
//    }
}
