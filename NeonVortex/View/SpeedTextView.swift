//
//  SpeedTextView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import SwiftUI

struct SpeedTextView: View {
    var body: some View {
        VStack {
            Text("35.13")
                .font(.system(size: 40, weight: .semibold))
            
            Text("mb/s")
                .font(.system(size: 16, weight: .light))
        }
    }
}

#Preview {
    SpeedTextView()
}
