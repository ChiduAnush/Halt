//
//  MeditationArticleView.swift
//  Halt
//
//  Created by user2 on 06/03/24.
//

import SwiftUI

struct MeditationArticleView: View {
    var body: some View {
        
        
        ScrollView {
            VStack(alignment: .leading) {
                Image("theTown") // Add your image here
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading){
                    Text("Guided Meditation")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
//                    Text("Here's a simple step-by-step guide for a 5 minute meditation.")
                    Text("Meditation is a practice where an individual uses a technique – such as focusing the mind on a particular object, thought, or activity.\n")
                    Text("This is done to train attention and awareness, and achieve a mentally clear and emotionally calm and stable state.")
                    
                    Text("Tips for a Good Meditation Session:")
                        .font(.headline)
                        .padding(.top, 20)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("1. Find a quiet and comfortable place.")
                        Text("2. Sit in a posture that is comfortable for you.")
                        Text("3. Try to meditate at the same time every day.")
                        Text("4. Don't worry about whether you're doing it right. Just focus on your breath.")
                        Text("5. Start with just a few minutes, and then you can increase the time.")
                    }
                    .font(.body)
                    .padding(.top, 10)
                }
                .padding()
            }

        }

        
        
    }
}

#Preview {
    MeditationArticleView()
}
