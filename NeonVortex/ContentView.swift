//
//  ContentView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeDisconnectView()
    }
}



struct SideMenuView: View {
    var body: some View {
        ZStack {
        }
    }
}

#Preview {
    ContentView()
}

extension Color {
    static let appPrimary = Color.init(red: 40/255, green: 31/255, blue: 97/255).opacity(0.55)
    static let dropDown = Color.init(red: 28/255, green: 24/255, blue: 197/255)
    static let progressBackground = Color.init(red: 149/255, green: 112/255, blue: 250/255)
    static let progress = Color.init(red: 252/255, green: 229/255, blue: 96/255)
    static let darkPurple = Color.init(red: 169/255, green: 41/255, blue: 246/255)
    static let viewTop = Color.init(red: 187/255, green: 68/255, blue: 251/255)
    static let viewBottom = Color.init(red: 104/255, green: 36/255, blue: 242/255)
    static let stopColor = Color.init(red: 250/255, green: 140/255, blue: 82/255)
    static let powerButton = Color.init(red: 129/255, green: 108/255, blue: 255/255)
    static let disBg = Color.init(red: 47/255, green: 47/255, blue: 54/255)
}

extension UIScreen {
    static let screenWidth = UIScreen.main.bounds.size.width
    static let screenHeight = UIScreen.main.bounds.size.height
    static let screenSize = UIScreen.main.bounds.size
}
