//
//  twentytwenty.swift
//  Halt
//
//  Created by user2 on 05/03/24.
//

import SwiftUI

//struct twentytwenty: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}

#Preview {
    twentytwenty()
}



import SwiftUI
import UserNotifications

struct twentytwenty: View {
    @AppStorage("is202020Enabled") var is202020Enabled: Bool = false

    var body: some View {
        Toggle(isOn: $is202020Enabled, label: {
            Text("Enable 20:20:20 Feature")
        })
        .onChange(of: is202020Enabled) { newValue in
            if newValue {
                print("feature enabled")
                scheduleNotifications()
            } else {
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
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

        // Schedule the immediate notification
        let immediateContent = UNMutableNotificationContent()
        immediateContent.title = "20:20:20 Feature Enabled"
        immediateContent.body = "The 20:20:20 feature is now enabled"
        immediateContent.sound = UNNotificationSound.default

        let immediateTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)

        let immediateRequest = UNNotificationRequest(identifier: UUID().uuidString, content: immediateContent, trigger: immediateTrigger)

        center.add(immediateRequest)
    }

}
