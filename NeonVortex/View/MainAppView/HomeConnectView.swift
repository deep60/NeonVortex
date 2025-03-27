//
//  HomeConnectView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 21/03/25.
//

import SwiftUI

struct HomeConnectView: View {
    @State private var isConnected = false
    @State var showSideMenu: Bool = false
    
    var body: some View {
        ZStack {
            Color.appPrimary
                .ignoresSafeArea()
            
            VStack {
                TopMenuView(showSideMenu: $showSideMenu)
                
                Spacer()
                
                ConnectingTimeView(isConnected: isConnected)
                
                DownloadUploadView()
                
                CountryButtonView(region: Data.regions[0])
                
                Spacer()
                
                StartStopButtonView(isConnected: $isConnected)
                
                Spacer()
            }
            .foregroundStyle(.white)
            //.padding(.horizontal)
            
            if showSideMenu {
                SideMenuView(showSideMenu: $showSideMenu)
            }
        }
    }
}

#Preview {
    HomeConnectView()
}

struct TopMenuView: View {
    @Binding var showSideMenu: Bool
    var body: some View {
        HStack {
            Button(action: {
                showSideMenu = true
            }, label: {
                VStack {
                    HStack {
                        Circle()
                            .frame(width: 6, height: 6)
                        
                        Circle()
                            .frame(width: 6, height: 6)
                    }
                    
                    HStack {
                        Circle()
                            .frame(width: 6, height: 6)
                        
                        Circle()
                            .frame(width: 6, height: 6)
                    }
                }
                .padding()
            })
            
            Text("NeonVortex")
                .font(.system(size: 18, weight: .black))
            
            Text("VPN")
                .font(.system(size: 18, weight: .regular))
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.darkPurple)
                    .frame(width: 135, height: 40)
                
                HStack {
                    Image(systemName: "crown")
                    Text("PREMIUM")
                        .font(.system(size: 12, weight: .regular))
                }
            }
        }
        .foregroundStyle(.white)
        
        // Side Menu
        if showSideMenu {
            SideMenuView(showSideMenu: $showSideMenu)
                .transition(.move(edge: .leading))
                .animation(.spring(response: 0.3, dampingFraction: 0.8), value: showSideMenu)
        }
    }
}

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

struct DownloadUploadView: View {
    var body: some View {
        HStack {
            Image(systemName: "arrow.down")
                .foregroundStyle(.red.opacity(1))
            
            VStack {
                Text("Download")
                    .font(.system(size: 12, weight: .regular))
                    .offset(x: -28)
                Text("348.3 Mbp/s")
                    .font(.system(size: 18, weight: .bold))
            }
            .padding(.horizontal)
            
            Rectangle()
                .frame(width: 2, height: 60)
            
            Image(systemName: "arrow.up")
                .foregroundStyle(.green)
            
            VStack {
                Text("Upload")
                    .font(.system(size: 12, weight: .regular))
                    .offset(x: -38)
                Text("348.3 Mbp/s")
                    .font(.system(size: 20, weight: .bold))
            }
            .padding()
            
        }
        .padding()
    }
}

struct CountryButtonView: View {
    let region: Region
    @State private var isExpanded = false
    
    var body: some View {
        VStack(spacing: 0) {
            Button(action: {
                print("Button tapped")
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
            }) {
                ZStack {
                    Rectangle()
                        .frame(width: 315, height: 80)
                        .cornerRadius(24)
                        .foregroundStyle(Color.powerButton)
                    
                    Text(region.flag)
                        .font(.system(size: 32))
                        .frame(width: 44, height: 44)
                        .background(Circle().fill(Color.black))
                        .shadow(radius: 5)
                        .offset(x: -125)

                    VStack {
                        Text(region.name)
                            .font(.system(size: 24, weight: .bold))
                        Text(region.ipAddress)
                            .font(.system(size: 16, weight: .regular))
                    }
                    
                    Image(systemName: "chevron.right")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 44, height: 44)
                        .background(Circle().fill(Color.black))
                        .shadow(radius: 5)
                        .rotationEffect(.degrees(isExpanded ? 90 : 0))
                        .offset(x: 125)
                }
            }
            .buttonStyle(PlainButtonStyle())
            
            if isExpanded {
                VStack(spacing: 12) {
                    ForEach(region.servers) { server in
                        ServerRow(server: server)
                    }
                }
                .padding(.top, 12)
                .padding(.horizontal, 20)
            }
        }
    }
}

struct ServerRow: View {
    let server: VPNServer
    //let region: Region
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(server.city)
                    .font(.system(size: 18, weight: .semibold))
                Text(server.ipAddress)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            if server.isRecommended {
                Text("Recommended")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.green)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(8)
            }
            
            Text("\(server.load)%")
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(server.load < 50 ? .green : .orange)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

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



