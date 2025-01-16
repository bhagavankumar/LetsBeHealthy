//
//  LeaderboardView.swift
//  LetsBeHealthy
//
//  Created by Bhagavan Kumar V on 2025-01-12.
//


import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.8)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .edgesIgnoringSafeArea(.all) // Covers the entire screen
            
            VStack {
                Text("Leaderboard")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                List {
                    Text("1. Alice - 15,000 steps")
                    Text("2. Bob - 12,500 steps")
                    Text("3. Charlie - 10,000 steps")
                }
                .foregroundColor(.white)
                .listStyle(PlainListStyle()) // Ensures a basic list style
            }
            .padding() // Add padding for the text and list
                
        }
    }
}
