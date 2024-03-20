//
//  IntentViewModel.swift
//  Halt
//
//  Created by ChiduAnush on 20/03/24.
//

import Foundation
import SwiftUI

class IntentViewModel: ObservableObject {
    
    static let shared = IntentViewModel()
    
    @Published var showStartInterruptionView = false
    
    
}
