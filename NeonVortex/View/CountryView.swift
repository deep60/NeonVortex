//
//  CountryView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import SwiftUI

struct CountryView: View {
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

#Preview {
    CountryView(region: Data.regions[0])
}
