//
//  CountryCrousal.swift
//  NeonVortex
//
//  Created by P Deepanshu on 21/03/25.
//

import SwiftUI

struct CountryCrousal: View {
    let regions: [Region]
    @State private var currentIndex = 0
    
    var body: some View {
        VStack(spacing: 30) {
            // Main flag display
            ZStack {
                // Background circle
                Circle()
                    .fill(Color.powerButton.opacity(0.2))
                    .frame(width: 130, height: 130)
                
                // Outer ring
                Circle()
                    .stroke(Color.blue.opacity(0.3), lineWidth: 2)
                    .frame(width: 140, height: 140)
                
                // Selected flag
                Text(regions[currentIndex].flag)
                    .font(.system(size: 60))
            }
            
            Text(regions[currentIndex].name)
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
            
            // Horizontal flag slider
            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(Array(regions.enumerated()), id: \.element.id) { index, region in
                            Button(action: {
                                withAnimation {
                                    currentIndex = index
                                }
                            }) {
                                ZStack {
                                    Circle()
                                        .fill(currentIndex == index ? Color.blue.opacity(0.3) : Color.powerButton.opacity(0.2))
                                        .frame(width: 60, height: 60)
                                    
                                    Circle()
                                        .stroke(currentIndex == index ? Color.blue : Color.clear, lineWidth: 2)
                                        .frame(width: 60, height: 60)
                                    
                                    Text(region.flag)
                                        .font(.system(size: 30))
                                }
                            }
                            .id(index)
                        }
                    }
                    .padding(.horizontal)
                }
                .onChange(of: currentIndex) { newIndex in
                    withAnimation {
                        proxy.scrollTo(newIndex, anchor: .center)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ZStack {
        Color.appPrimary.ignoresSafeArea()
        CountryCrousal(regions: Data.regions)
    }
}
