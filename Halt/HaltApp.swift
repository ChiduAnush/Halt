//
//  HaltApp.swift
//  Halt
//
//  Created by Chidu Anush on 02/02/24.
//

import SwiftUI

import UserNotifications


@main
struct HaltApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var Intentmodel = IntentViewModel.shared
    
    @StateObject private var notificationHandler = NotificationHandler()

    var body: some Scene {
        WindowGroup {
            
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
        .environmentObject(Intentmodel)

    }
}


class NotificationHandler: NSObject, ObservableObject, UNUserNotificationCenterDelegate {
    @Published var showNotificationView = false

    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // Check the identifier of the notification action
        if response.actionIdentifier == UNNotificationDefaultActionIdentifier {
            // The user tapped on the notification, show the notification view
            DispatchQueue.main.async {
                self.showNotificationView = true
            }
        }
        completionHandler()
    }
}
