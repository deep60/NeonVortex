//
//  DownloadUploadView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import SwiftUI

struct DownloadUploadView: View {
    var body: some View {
        HStack {
            Image(systemName: "arrow.down")
                .foregroundStyle(.red.opacity(1))
            
            VStack {
                Text("Download")
                    .font(.system(size: 12, weight: .regular))
                    .offset(x: -24)
                Text("348.3 Mbp/s")
                    .font(.system(size: 18, weight: .bold))
            }
            
            Divider()
                .frame(width: 2 , height: 50)
                .foregroundStyle(.white)
            
            Image(systemName: "arrow.up")
                .foregroundStyle(.green)
            
            VStack {
                Text("Upload")
                    .font(.system(size: 12, weight: .regular))
                    .offset(x: -38)
                Text("348.3 Mbp/s")
                    .font(.system(size: 20, weight: .bold))
            }
            
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    DownloadUploadView()
}
