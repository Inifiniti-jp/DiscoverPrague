//
//  TypingTextView.swift
//  DiscoverPrague
//
//  Created by Jakub Plachy on 01.02.2025.
//

import SwiftUI

struct TypingTextView: View {
    @State private var textToDisplay = "Hello, this is a test for text animation"
    @State private var currentText = ""
    @State private var timerIsRunning = false
    let typingSpeed = 0.3
    
    var body: some View {
        Text(textToDisplay)
            .onAppear {
                startTypingAnimation()
            }
    }
    
    private func startTypingAnimation() {
        currentText = ""
        
        if !timerIsRunning {
            timerIsRunning = true
            var index = 0
            Timer.scheduledTimer(withTimeInterval: typingSpeed, repeats: true) { timer in
                guard index < textToDisplay.count else {
                    timer.invalidate()
                    timerIsRunning = false
                    return
                }
                
                // Append one character at a time
                currentText += String(textToDisplay[textToDisplay.index(textToDisplay.startIndex, offsetBy: index)])
                index += 1
            }
        }
    }
}


//#Preview {
//    TypingTextView(city: city)
//}
