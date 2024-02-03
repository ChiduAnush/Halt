//
//  HomeView.swift
//  Halt
//
//  Created by Chidu Anush on 03/02/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color(.systemIndigo).opacity(0.5), .clear]), startPoint: .topTrailing, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack{
                HomeTopNextEvent()
                HomeViewQuote()
            }
            
        }
        
        
        
    }
}

#Preview {
    HomeView()
}





struct HomeViewQuote: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Overcome Distractions,")
                    .font(.system(size: 45))
                    .fontWeight(.light)
                HStack{
                    Text("Conquer")
                        .font(.system(size: 50))
                        .fontWeight(.regular)
                        .foregroundStyle(Color(.systemIndigo))
                    Text("your")
                        .font(.system(size: 45))
                }
                Text("Mind.")
                    .font(.system(size: 45))
            }
            .padding(.leading)
            Spacer()

        }

    }
}

struct HomeTopNextEvent: View {
    var body: some View {
        HStack{
            Image(systemName: "clock")
                .font(.title2)
            Text("iOS Team Gmeet")
                .fontWeight(.medium)
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "chevron.down")
                    .font(.title3)
                    .foregroundStyle(Color(.systemIndigo))
                    
            })
        }
        .padding(.horizontal)
        
        Divider()
            .padding(.horizontal)
            .padding(.horizontal)
            .padding(.vertical, 10)
            .foregroundStyle(Color(.systemGray6))
        
        
    }
}

