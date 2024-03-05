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
            //                .padding(.top, 20)
            
            
            InsightsTitleAndDesc()
            
            Divider()
                .padding()
                .padding(.vertical, 10)
            
            
            SectionView(title: "Screen time", insight: "6% decrease", color: .systemPurple, completion: 0.6)
            
            Divider()
                .padding()
                .padding(.vertical, 10)
            
            
            SectionView(title: "Time Earned", insight: "4% decrease", color: .systemIndigo, completion: 0.4)
            
            Divider()
                .padding()
                .padding(.vertical, 10)
            
            
            SectionView(title: "bruh", insight: "7.5% decrease", color: .systemYellow, completion: 0.75)
            
            Divider()
                .padding()
                .padding(.vertical, 10)
            
//            twentytwentyView(viewModel: viewModel)
//                .padding()
//                .padding(.bottom, 100)
            
        }
            
//        if viewModel.showToast {
//            ToastView()
//                .offset(y: UIScreen.main.bounds.height/4)
//                .animation(.default)
//                .transition(.move(edge: .bottom))
//        }

        
        
        
        
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
    let color: UIColor
    let completion: CGFloat
    
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
            
            
            
            ZStack{
                Circle()
                    .stroke(Color(uiColor: color).opacity(0.3), lineWidth: 10)
                    .frame(width: 60, height: 60)
                    .foregroundStyle(Color(uiColor: color))
                
                Circle()
                    .trim(from: 0.0, to: completion)
                    .stroke(Color(uiColor: color).opacity(1), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 60, height: 60)
                    .foregroundStyle(Color(uiColor: color))
                    .rotationEffect(.degrees(-90))
                    
            }
            
        }
        .padding(.horizontal)
    }
}


