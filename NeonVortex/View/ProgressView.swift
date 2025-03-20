//
//  ProgressView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import SwiftUI

struct ProgressView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color.progressBackground, Color.blue]), startPoint: .top, endPoint: .bottom), lineWidth: 3).opacity(0.5)
                .frame(width: 340, height: 340)
            
            Circle()
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color.progressBackground, Color.blue]), startPoint: .top, endPoint: .bottom), lineWidth: 10 )
                .frame(width: 300, height: 300)
            
            Button(action: {
                
            }, label: {
                ZStack {
                    Circle()
                        .frame(width: 270, height: 270)
                        .foregroundStyle(Color.powerButton)
                    
                    Image(systemName: "power")
                        .font(.system(size: 108, weight: .bold))
                        .foregroundStyle(.white)
                }
            })
        }
        .padding()
    }
}

#Preview {
    ProgressView()
}
