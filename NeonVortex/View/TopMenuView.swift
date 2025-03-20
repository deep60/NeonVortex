//
//  TopMenuView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import SwiftUI

struct TopMenuView: View {
    var body: some View {
        HStack {
            Button(action: {
                
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
    }
}

#Preview {
    TopMenuView()
}
