//
//  StartStopButtonView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import SwiftUI

struct StartStopButtonView: View {
    @Binding var isConnected: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.spring()) {
                isConnected.toggle()
            }
        }) {
            ZStack {
                // Outer circle with gradient
                Circle()
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color.progressBackground, Color.blue]), startPoint: .top, endPoint: .bottom), lineWidth: 3)
                    .opacity(0.5)
                    .frame(width: 340, height: 340)
                    .rotationEffect(.degrees(isConnected ? 360 : 0))
                    .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: isConnected)
                
                // Middle circle with gradient
                Circle()
                    .stroke(
                        LinearGradient(gradient: Gradient(colors: [Color.progressBackground, Color.blue]), startPoint: .top, endPoint: .bottom), lineWidth: 10)
                    .frame(width: 300, height: 300)
                    .rotationEffect(.degrees(isConnected ? -360 : 0))
                    .animation(.linear(duration: 3).repeatForever(autoreverses: false), value: isConnected)
                
                // Inner circle
                Circle()
                    .frame(width: 250, height: 250)
                    .foregroundStyle(Color.powerButton)
                    .scaleEffect(isConnected ? 1.1 : 1.0)
                    .animation(.spring(response: 0.3), value: isConnected)
                
                // Permanent power icon
                Image(systemName: "power")
                    .font(.system(size: 108, weight: .bold))
                    .foregroundStyle(.white)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding()
    }
}

#Preview {
    StartStopButtonView(isConnected: .constant(false))
}
