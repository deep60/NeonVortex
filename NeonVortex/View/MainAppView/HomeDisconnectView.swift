//
//  HomeDisconnectView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 23/03/25.
//

import SwiftUI

struct HomeDisconnectView: View {
    @State var showSideMenu: Bool = false
    var  body: some View {
        ZStack {
            Color.disBg
                .ignoresSafeArea()
            VStack {
                TopMenuView(showSideMenu: $showSideMenu)
                
                CountryCarousal(regions: Data.regions)
                
                Text("Not Connected")
                    .font(.system(size: 28, weight: .bold))
                
                CountryDisButtonView()
            }
        }
    }
}

#Preview {
    HomeDisconnectView()
}

struct CountryCarousal: View {
    let regions: [Region]
    @State private var selectedRegion: Region
    @State private var showCountryView = false
    
    init(regions: [Region]) {
        self.regions = regions
        // Initialize with Canada (index 3)
        _selectedRegion = State(initialValue: regions[0])
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // Selected flag display
            ZStack {
                Circle()
                    .fill(Color.appPrimary)
                    .frame(width: 130, height: 130)
                    .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 5)
                
                // Carousel scroll view
                ScrollViewReader { scrollView in
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 25) {
                            ForEach(regions) { region in
                                FlagItem(country: region, isSelected: region.id == selectedRegion.id)
                                    .id(region.id)
                                    .onTapGesture {
                                        withAnimation {
                                            selectedRegion = region
                                        }
                                    }
                            }
                        }
                        .padding(.horizontal, UIScreen.main.bounds.width / 2 - 60)
                    }
                    .onAppear {
                        // Scroll to initial selected country on appear
                        scrollView.scrollTo(selectedRegion.id, anchor: .center)
                    }
                }
            }
            
            // Display the selected country name
            Text(selectedRegion.name)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 10)
        }
    }
}

// Individual flag item component
struct FlagItem: View {
    let country: Region
    let isSelected: Bool
    
    var body: some View {
        ZStack {
            // Flag image
            Image(country.flag)
                .resizable()
                .scaledToFit()
                .frame(width: isSelected ? 70 : 50, height: isSelected ? 70 : 50)
                .clipShape(Circle())
            
            // Blue highlight circle for selected item
            if isSelected {
                Circle()
                    .stroke(Color(red: 0.3, green: 0.7, blue: 0.9), lineWidth: 3)
                    .frame(width: 85, height: 85)
            }
        }
        .frame(width: 85, height: 85)
    }
}

struct CountryDisButtonView: View {
    var body: some View {
        Button(action: {
            // Action here
        }) {
            ZStack {
                // Main rectangle with gradient background
                RoundedRectangle(cornerRadius: 24)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.viewTop, Color.viewBottom]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )
                    .frame(width: 315, height: 80)
                
                // Stroke layer
                RoundedRectangle(cornerRadius: 24)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ),
                        lineWidth: 1.5
                    )
                    .frame(width: 315, height: 80)
                
                // Content
                HStack {
                    Text("Select Country")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, 30)
                .frame(width: 315)
            }
            .shadow(color: Color.blue.opacity(0.3), radius: 10, x: 0, y: 5)
        }
    }
}

