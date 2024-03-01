//
//  InterruptionScreenSettingsView.swift
//  Halt
//
//  Created by Chidu Anush on 03/02/24.
//

import SwiftUI

struct InterruptionScreenSettingsView: View {
    
    
    var body: some View {
        

        VStack{
            
            InsightsTopNavBar()
                .padding()
            
            
            VStack{
                Text("Insights")
                    .font(.system(size: 50))
                
            }
            
            
        }
        
        
        
        
    }
}

#Preview {
    InterruptionScreenSettingsView()
}

struct InsightsTopNavBar: View {
    var body: some View {
        HStack{
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "person.crop.circle")
                    .font(.largeTitle)
                    .foregroundStyle(Color(uiColor: .white))
            })
            
            Spacer()
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "iphone.gen2.circle")
                    .font(.largeTitle)
                    .foregroundStyle(Color(uiColor: .white))
            })
        }
        .padding(.horizontal)
    }
}
