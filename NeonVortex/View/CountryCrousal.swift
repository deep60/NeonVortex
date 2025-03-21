//
//  CountryCrousal.swift
//  NeonVortex
//
//  Created by P Deepanshu on 21/03/25.
//

import SwiftUI

struct CountryCrousal: View {
    let regions: [Region]
    @State private var selectedRegion: Region
    @State private var currentIndex = 0
    
    init(regions: [Region]) {
        self.regions = regions
        _selectedRegion = State(initialValue: regions[0])
    }
    
    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(Array(regions.enumerated()), id: \.1.id) { index, region in
                VStack(spacing: 20) {
                    ZStack {
                        Circle()
                            .fill(Color.powerButton.opacity(0.2))
                            .frame(width: 130, height: 130)
                        
                        Circle()
                            .stroke(Color.blue.opacity(0.3), lineWidth: 2)
                            .frame(width: 140, height: 140)
                        
                        Text(region.flag)
                            .font(.system(size: 60))
                    }
                    
                    Text(region.name)
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(.white)
                }
                .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(height: 250)
        .onChange(of: currentIndex) { newIndex in
            withAnimation(.spring()) {
                selectedRegion = regions[newIndex]
            }
        }
    }
}

#Preview {
    ZStack {
        CountryCrousal(regions: Data.regions)
    }
}
