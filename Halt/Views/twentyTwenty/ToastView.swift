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
            .foregroundColor(.black)
            .padding()
//            .background(Color.secondary)
//            .background(Color.secondary.opacity(0.5))
            .background(Color(uiColor: .white))
            .cornerRadius(100)
            .shadow(color: .primary.opacity(0.06), radius: 5, x: 5, y: 5)
            .shadow(color: .primary.opacity(0.03), radius: 5, x: -5, y: -5)
            .frame(height: UIScreen.main.bounds.height/2)
    }
}


#Preview {
    ToastView()
}
