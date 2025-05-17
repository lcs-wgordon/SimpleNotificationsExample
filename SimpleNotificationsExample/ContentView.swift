//
//  ContentView.swift
//  SimpleNotificationsExample
//
//  Created by Russell Gordon on 2025-05-17.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    @State private var secondsFromNow = 0
    
    // MARK: Computed properties
    
    // The user interface
    var body: some View {
        VStack(spacing: 30) {
            
            Button("Request Permission") {
                // first
            }
            .buttonStyle(.borderedProminent)
            
            Stepper("Schedule notification in \(secondsFromNow) seconds", value: $secondsFromNow, in: 0...Int.max)
            
            Button("Schedule") {
                // second
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
