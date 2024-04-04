//
//  WaterArticleView.swift
//  Halt
//
//  Created by user2 on 04/04/24.
//

//import SwiftUI
//
//struct WaterArticleView: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//#Preview {
//    WaterArticleView()
//}


import SwiftUI

struct WaterArticleView: View {
    @State private var waterCount = 0
    private let maxWaterLevel: Int = 10
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                Image("water")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading){
                    Text("Time to bring nutrients to cell")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.top,10)
                    
                    Text("Water is vital for our health. It should always be your go-to beverage.")
                        .padding(.top,10)
                    Text("Hydrate yourself just like the cactus does in monsoon.")
                        .padding(.top,10)
                        .font(.headline)
                    
                    Text("It is necessary to have 8 glasses of water in a day. Now, it's your time to add a glass of water to your daily count.")
                        .padding(.top,10)
                    //                    Text("Water Intake")
                    //                        .font(.title)
                    //                        .padding(.top,10)
                    //                    ZStack{
                    //                        Rectangle()
                    //                            .frame(width: 50, height: 100)
                    //                            .foregroundColor(.gray.opacity(0.2))
                    //                        Rectangle()
                    //                            .frame(width: 50, height: calculateWaterHeight())
                    //                            .foregroundColor(.blue)
                    //                            .cornerRadius(10)
                    //
                    //                    }
                    //                    Text("Glasses of Water: \(waterCount)")
                    //                        .font(.headline)
                    //                    HStack {
                    //                        Button(action: {
                    //                            incrementWaterCount()
                    //                        }) {
                    //                            Text("Add Water")
                    //                                .padding()
                    //                                .background(Color.blue)
                    //                                .foregroundColor(.white)
                    //                                .cornerRadius(10)
                    //                        }
                    //
                    //                        Button(action: {
                    //                            decrementWaterCount()
                    //                        }) {
                    //                            Text("Remove Water")
                    //                                .padding()
                    //                                .background(Color.red)
                    //                                .foregroundColor(.white)
                    //                                .cornerRadius(10)
                    //                        }
                    //                    }
                    
                    
                }
                
            }
            
        }
    }
    
//    private func calculateWaterHeight() -> CGFloat {
//        let percentageFilled = CGFloat(waterCount) / CGFloat(maxWaterLevel)
//        return 200 * percentageFilled
//    }
//    private func incrementWaterCount() {
//        waterCount = min(waterCount + 1, maxWaterLevel)
//    }
//    private func decrementWaterCount() {
//        waterCount = max(waterCount - 1, 0)
//    }

}

#Preview {
    WaterArticleView()
}
