//
//  MainView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import SwiftUI

struct MainView: View {
    @State private var isConnected = false
    
    var body: some View {
        VStack(spacing: 40) {
            ConnectingTimeView(isConnected: isConnected)
            
            StartStopButtonView(isConnected: $isConnected)
        }
        .padding()
    }
}

#Preview {
    MainView()
} 
