//
//  NetworkSpeedView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import SwiftUI

struct NetworkSpeedView: View {
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color.progressBackground.opacity(0.5), Color.blue.opacity(0.01)]), startPoint: .top, endPoint: .bottom), lineWidth: 24)
                .frame(width: 340, height: 340)
            
            Circle()
                .frame(width: 280, height: 230)
            
            ForEach(Array(stride(from: 0, through: 10, by: 1)), id: \.self) { i in
                Text("\(i * 10)")
                    .rotationEffect(.degrees(-120 - Double(i * 30)))
                    .offset(x: 140)
                    .rotationEffect(.degrees(Double(i * 30)))
            }
            .rotationEffect(.degrees(120))
            
            Circle()
                .trim(from: 0.1, to: 0.5)
                .stroke(
                    LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue.opacity(0.01)]), startPoint: .leading, endPoint: .trailing), style: StrokeStyle(lineWidth: 24, lineCap: .round))
                .frame(width: 340, height: 340)
                .rotationEffect(.degrees(90))
        }
    }
}

#Preview {
    NetworkSpeedView()
}
