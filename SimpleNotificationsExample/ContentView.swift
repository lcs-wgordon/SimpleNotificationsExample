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
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            
            Stepper("Schedule notification in \(secondsFromNow) seconds", value: $secondsFromNow, in: 0...Int.max)
            
            Button("Schedule") {
                let content = UNMutableNotificationContent()
                content.title = "Feed Piper"
                content.subtitle = "She's always hungry"
                content.sound = UNNotificationSound.default

                // show this notification "x" seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(
                    timeInterval: Double(secondsFromNow),
                    repeats: false
                )

                // choose a random identifier
                let request = UNNotificationRequest(
                    identifier: UUID().uuidString,
                    content: content,
                    trigger: trigger
                )

                // add our notification request
                UNUserNotificationCenter.current().add(request)
            }
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
