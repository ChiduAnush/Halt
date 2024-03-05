//
//  UtilitiesView.swift
//  Halt
//
//  Created by user2 on 05/03/24.
//

import SwiftUI

struct UtilitiesView: View {
    
    @ObservedObject var viewModel: TwentyTwentyTwentyViewModel
    
    
    var body: some View {
        
        NavigationStack{
            
            
            ScrollView{
                Spacer()
                Spacer()
                Spacer()
                
                
                UtilitiesViewQuote()
                
                Divider()
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                
                
                UtilitiesSuccessInterruptsNumberView(numberOfSuccessfullInterrupts: 21)
                
                Divider()
                    .padding(.horizontal)
                    .padding(.vertical, 10)
                
                
                UtilitiestwentytwentySection(viewModel: viewModel)
                
                
                Spacer()
            }
        }

        
        
    }
}

#Preview {
    UtilitiesView(viewModel: TwentyTwentyTwentyViewModel())
}


struct UtilitiesViewQuote: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                
                Text("Time saved,")
                    .font(.system(size: 30))
                    .fontWeight(.light)
                HStack{
                    Text("is")
                        .font(.system(size: 30))
                        .fontWeight(.light)
                    Text("time")
                        .font(.system(size: 30))
                    Text("earned.")
                        .font(.system(size: 30))
                        .foregroundStyle(Color(uiColor: .systemIndigo))
                }
                .padding(.leading, 2)
            }
            .padding(.leading)
            Spacer()
        }
    }
}

struct UtilitiesSuccessInterruptsNumberView: View {
    let numberOfSuccessfullInterrupts: Int
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                VStack(alignment: .leading, spacing: -5){
                    Text("Successfull Interrupts")
                        .foregroundStyle(Color.secondary)
                    Text("\(numberOfSuccessfullInterrupts)")
                        .font(.system(size: 70))
                }
                
                Text("Bravo! You have added around ") + Text("\(5 * numberOfSuccessfullInterrupts) mins").foregroundColor(Color(uiColor: .systemIndigo)).font(.system(size: 18)) + Text(" back into your life's clock.")
                
                
                NavigationLink(destination: ReadView()) {
                    HStack {
                        Text("What all can I do with the extra time?")
                        Image(systemName: "chevron.forward")
                    }
                }
                .padding(.top)
                .fontWeight(.light)
                .foregroundStyle(Color(uiColor: .systemIndigo))
            }
            .padding()
            Spacer()
        }
        
        
        
    }
}

struct UtilitiestwentytwentySection: View {
    
    @ObservedObject var viewModel: TwentyTwentyTwentyViewModel
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Eye Health")
                    .foregroundStyle(Color.secondary)
                NavigationLink(destination: twentytwentyView(viewModel: viewModel)) {
                    HStack{
                        Text("20:20:20")
                            .font(.body)
                            .foregroundColor(.secondary)
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .font(.callout)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundStyle(Color(.systemFill).opacity(0.5)))
                }
                
                Text("If enabled, we will send a notification every 20 minutes, as a reminder for you.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.top, 10)
                
            }
            .padding()
            Spacer()
        }
    }
}
