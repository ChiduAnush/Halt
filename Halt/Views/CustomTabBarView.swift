//
//  CustomTabBarView.swift
//  Halt
//
//  Created by trial on 03/02/24.
//

import SwiftUI


enum Tab:String, CaseIterable {
    case house
    case gearshape
    case archivebox
}


struct CustomTabBarView: View {
    @Binding var selectedTab: Tab
    
    private var fillImage:String {
        selectedTab.rawValue + ".fill"
    }
    
    var body: some View {
        VStack{
            HStack{
                ForEach(Tab.allCases, id: \.rawValue) {tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundStyle(Color(selectedTab == tab ? .systemIndigo : .systemGray2))
                        .font(.system(size: 21))
                        .onTapGesture{
                            withAnimation(.easeIn(duration: 0.2)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding()
        }
    }}

#Preview {
    CustomTabBarView(selectedTab: .constant(.house))
}
