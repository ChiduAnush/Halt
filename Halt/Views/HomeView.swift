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
                    .padding(.bottom)

                HomeAppsView()

                
                
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
            .foregroundStyle(Color(.secondarySystemFill))
    }
}

struct AppInfoBox: View {
    let appName:String
    let interruptionCount:Int
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 10) {
                Text(appName)
                    .font(.headline)
                Text("\(interruptionCount) times\nprevented")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .frame(width: 150)
        .padding()
        .background(Color(.systemFill).opacity(0.5))
        
        .cornerRadius(12)
//        .shadow(color: Color.black.opacity(0.2), radius: 8, x: 0, y: 4)
        
    }
}

struct AddNewAppInfoBox: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showTutorial = false
    var body: some View {
        let backgroundColor: Color = colorScheme == .dark ? Color(.systemFill) : Color(.systemIndigo)
            .opacity(colorScheme == .dark ? 1.0 : 0.3)
        
        HStack{
            VStack(alignment: .leading, spacing: 10) {
                Text("Add new")
                    .font(.headline)
                Image(systemName: "plus.circle")
                    .font(.title)
//                    .foregroundColor(.secondary)
                    .foregroundStyle(Color(.systemIndigo))
            }
            Spacer()
        }
        .frame(width: 150, height: 70)
        .padding()
        .background(Color(backgroundColor))
        .cornerRadius(12)
        .onTapGesture {
            showTutorial = true
        }
        .sheet(isPresented: $showTutorial) {
            TutorialView()
        }

    }
}

struct HomeAppsView: View {
    
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        
        VStack(alignment:.leading){
            Text("INTERRUPTED APPS")
                .font(.subheadline)
                .foregroundStyle(Color(foregroundColor))
                .padding(.leading, 5)
            HStack{
                AppInfoBox(appName: "Youtube", interruptionCount: 5)
                AddNewAppInfoBox()
            }
        }
        
    }
    
    private var foregroundColor: Color {
        return colorScheme == .dark ? Color(.systemGray) : .black
        }
}
