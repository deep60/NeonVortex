//
//  SideMenuView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 22/03/25.
//

import SwiftUI

struct SideMenuView: View {
    @State private var showAnimation: Bool = false
    @Binding var showSideMenu: Bool
   
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.black.opacity(0.2))
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.darkPurple.opacity(0.5))
                .rotationEffect(showAnimation ? .degrees(15) : .zero, anchor: .bottomTrailing)
                .offset(x: showAnimation ? -UIScreen.screenWidth/2 : -UIScreen.screenWidth/2, y: 20)
                .scaleEffect(0.85)
            
            RoundedRectangle(cornerRadius: 40)
                .fill(Color.darkPurple.opacity(0.5))
                .rotationEffect(showAnimation ? .degrees(10) : .zero, anchor: .bottomTrailing)
                .offset(x: showAnimation ? -UIScreen.screenWidth/2 : -UIScreen.screenWidth/2, y: 20)
                .scaleEffect(0.95)
                .shadow(color: .black, radius: 50)
            
            VStack(alignment: .leading) {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            showAnimation.toggle()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                self.showSideMenu = false
                            }
                        }
                        showSideMenu = false
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                    })
                }
                .offset(x: -UIScreen.screenWidth/4)
                
                UserView()
                
                Spacer()
                
                MenuListView()
                
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
                
                Spacer(minLength: 180)
            }
            .padding(.horizontal)
            .offset(x: showAnimation ? 0.0 : -UIScreen.screenWidth)
            .animation(.easeIn(duration: 0.3))
        }
        .onAppear {
            withAnimation {
                showAnimation.toggle()
            }
        }
    }
}

struct UserView: View {
    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 70, height: 70)
            
            Text("Hello,")
            Text("P Deepanshu")
                .bold()
        }
    }
}

struct MenuListView: View {
    var body: some View {
        ForEach(Data.menus) { menu in
            MenuItemView(menu: menu)
                .padding(.vertical, 8)
        }
    }
}

struct MenuItemView: View {
    let menu: MenuItem
    var body: some View {
        HStack(spacing: 14) {
            Image(systemName: menu.imageName)
                .fixedSize(horizontal: true, vertical: true)
                .frame(width: 20)
            Text(menu.name)
                .font(.system(size: 14, weight: .bold))
        }
    }
}

#Preview {
    SideMenuView(showSideMenu: .constant(true))
}
