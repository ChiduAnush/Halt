//
//  Intents.swift
//  Halt
//
//  Created by ChiduAnush on 20/03/24.
//

import Foundation
import AppIntents


struct showTasks: AppIntent {
    
    static var title: LocalizedStringResource = "show Tasks"
    
    static var description: IntentDescription = IntentDescription("This action will open the tasks interruptions view in the Just a sec app.", categoryName: "Navigation")
    
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult {
        IntentViewModel.shared.showStartInterruptionView = true
        
        return .result()
    }
    
}
