//
//  ToastView.swift
//  Halt
//
//  Created by user2 on 05/03/24.
//

import SwiftUI

struct ToastView: View {
    var body: some View {
        Text("20:20:20 feature enabled")
            .foregroundColor(.white)
            .padding()
            .background(Color.secondary)
            .background(Color.secondary.opacity(0.5))
            .cornerRadius(100)
            .frame(height: UIScreen.main.bounds.height/2)
    }
}


#Preview {
    ToastView()
}
