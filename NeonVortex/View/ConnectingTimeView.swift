//
//  ConnectingTimeView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import SwiftUI

struct ConnectingTimeView: View {
    var body: some View {
        VStack {
            Text("Connecting Time")
                .font(.system(size: 18, weight: .regular))
            
            Text("00:34:29")
                .font(.system(size: 48, weight: .black))
        }
    }
}

#Preview {
    ConnectingTimeView()
}
