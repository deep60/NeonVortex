//
//  HomeConnectView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 21/03/25.
//

import SwiftUI

struct HomeConnectView: View {
    @State private var isConnected = false
    
    var body: some View {
        ZStack {
            Color.appPrimary
                .ignoresSafeArea()
            
            VStack {
                TopMenuView()
                
                Spacer()
                
                ConnectingTimeView(isConnected: isConnected)
                
                DownloadUploadView()
                
                CountryView(region: Data.regions[0])
                
                Spacer()
                
                StartStopButtonView(isConnected: $isConnected)
                
                Spacer()
            }
            .foregroundStyle(.white)
            //.padding(.horizontal)
        }
    }
}

struct HomeDisconnectView: View {
    var  body: some View {
        ZStack {
            Color.disBg
                .ignoresSafeArea()
            TopMenuView()
        }
    }
}

