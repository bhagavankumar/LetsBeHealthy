//
//  RewardsView.swift
//  LetsBeHealthy
//
//  Created by Bhagavan Kumar V on 2025-01-12.
//

import SwiftUI

struct RewardsView: View {
    @State private var rewards: Int = 0
    @State private var stepCount: Double = 0.0

    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.8)]),
                           startPoint: .top,
                           endPoint: .bottom
                           )
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Your Rewards")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                Text("\(Int(stepCount)) Points")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.white)
                    .padding()
                
                StepCountView(stepCount: $stepCount)
            }
            .padding()
            
        }
    }
}
