//
//  ConnectingTimeView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import SwiftUI

struct ConnectingTimeView: View {
    @State private var elapsedTime: TimeInterval = 0
    @State private var timer: Timer?
    let isConnected: Bool
    
    var formattedTime: String {
        let hours = Int(elapsedTime) / 3600
        let minutes = Int(elapsedTime) / 60 % 60
        let seconds = Int(elapsedTime) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    var body: some View {
        VStack {
            Text("Connecting Time")
                .font(.system(size: 18, weight: .regular))
            
            Text(formattedTime)
                .font(.system(size: 48, weight: .black))
        }
        .onChange(of: isConnected) { newValue in
            if newValue {
                startTimer()
            } else {
                stopTimer()
            }
        }
    }
    
    private func startTimer() {
        elapsedTime = 0
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            elapsedTime += 1
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    ConnectingTimeView(isConnected: false)
}
