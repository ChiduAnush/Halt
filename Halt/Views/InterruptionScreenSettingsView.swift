//
//  InterruptionScreenSettingsView.swift
//  Halt
//
//  Created by Chidu Anush on 03/02/24.
//

import SwiftUI

struct InterruptionScreenSettingsView: View {
    
    
    var body: some View {
        

        ScrollView{
   
            
            InsightsTopNavBar()
                .padding(.vertical)
            
            
            InsightsTitleAndDesc()
            
            Divider()
                .padding()
                .padding(.vertical, 15)
            
            
            SectionView(title: "Screen time", insight: "5% decrease", color: .indigo)
            
            Divider()
                .padding()
                .padding(.vertical, 15)
            
            
            SectionView(title: "Time Earned", insight: "5% decrease", color: .indigo)
            
            Divider()
                .padding()
                .padding(.vertical, 15)
            
            
            SectionView(title: "bruh", insight: "5% decrease", color: .indigo)
            
            
            
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
                    .foregroundStyle(Color.primary)
                    .opacity(0.8)
            })
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "iphone.gen2.circle")
                    .font(.largeTitle)
                    .foregroundStyle(Color.primary)
                    .opacity(0.8)
            })
        }
        .padding(.horizontal)
    }
}

struct InsightsTitleAndDesc: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 15){
                Text("Insights")
                    .font(.system(size: 50))
                    .fontWeight(.regular)
                
                Text("Looks like you are achieving your goals consistantly. Great work!")
            }
            .padding(.leading)
            Spacer()
        }
    }
}



struct SectionView: View {
    let title: String
    let insight: String
    let color: Color
    
    var body: some View {
        HStack {
            
            
            VStack(alignment: .leading, spacing: 10) {
                HStack{
                    Text(title)
                        .font(.title2)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Text("\(insight) this week")
                    .font(.subheadline)
                    .foregroundStyle(Color.secondary)
            }
            Spacer()
            
            
            Circle()
                .frame(width: 10, height: 10)
                .foregroundColor(color)
        }
        .padding([.leading, .trailing])
    }
}
