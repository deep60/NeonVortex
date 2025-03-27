//
//  SpeedTestView.swift
//  NeonVortex
//
//  Created by P Deepanshu on 24/03/25.
//

import SwiftUI

struct SpeedTestView: View {
    @State var ntwrkSpeed: CGFloat = 0.5
    var body: some View {
        ZStack {
            Color.speedTestbg.ignoresSafeArea()
            
            VStack {
                SpeedHeading()
                
                DownloadUploadView()
                
                SpeedTestButtonView()
            }
            //.padding(.bottom, 250)
        }
    }
}

#Preview {
    SpeedTestView()
}

struct SpeedHeading: View {
    var body: some View {
        HStack {
            Button(action: {
                
            }, label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 44, height: 44)
                    .background(Circle().fill(Color.speedTestbg.opacity(4.5)))
                    .shadow(radius: 2)
                    .offset(x: -105)
            })

            Text("Speed Test")
                .font(.system(size: 16, weight: .black))
        }
    }
}

//struct simulateButtonView: View {
//    @State private var ntwrkSpeed: CGFloat = 0.5
//    @State private var showSpeedMeter = false
//    
//    var body: some View {
//        VStack {
//            if !showSpeedMeter {
//                SpeedTestButtonView(action: {
//                    withAnimation {
//                        showSpeedMeter = true
//                        simulateNetworkSpeedTest()
//                    }
//                })
//            } else {
//                NtwrkSpeedMeterView(ntwrkSpeed: $ntwrkSpeed)
//                
//                Button("Close") {
//                    withAnimation {
//                        showSpeedMeter = false
//                        ntwrkSpeed = 0.6
//                    }
//                }
//                .padding()
//            }
//        }
//    }
//    
//    func simulateNetworkSpeedTest() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            withAnimation {
//                ntwrkSpeed = 0.7
//            }
//        }
//        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            withAnimation {
//                ntwrkSpeed = 0.9
//            }
//        }
//    }
//}

struct SpeedTestButtonView: View {
    @State private var showSpeedMeter = false
    @State private var ntwrkSpeed: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            ZStack {
                if !showSpeedMeter {
                    Button(action: {
                        withAnimation {
                            showSpeedMeter = true
                            // Simulate network speed test
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                withAnimation {
                                    ntwrkSpeed = 0.7
                                }
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                withAnimation {
                                    ntwrkSpeed = 0.9
                                }
                            }
                        }
                    }) {
                        ZStack {
                            // Outer gradient background
                            LinearGradient(
                                gradient: Gradient(colors: [Color.red, Color.blue]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .frame(width: 300, height: 300)
                            
                            // Inner circle with green
                            Circle()
                                .fill(.green)
                                .frame(width: 260, height: 260)
                            
                            // GO Text
                            Text("GO")
                                .font(.system(size: 80, weight: .bold))
                                .foregroundColor(.white)
                        }
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                } else {
                    VStack {
                        NtwrkSpeedMeterView(ntwrkSpeed: $ntwrkSpeed)
                        
                        Button("Close") {
                            withAnimation {
                                showSpeedMeter = false
                                ntwrkSpeed = 0.5
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}


struct NtwrkSpeedMeterView: View {
    @Binding var ntwrkSpeed: CGFloat
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            
            ZStack {
                ForEach(1...60, id: \.self) { index in
                    let deg = CGFloat(index) * 3
                    
                    Capsule()
                        .fill(.gray.opacity(0.25))
                        .frame(width: 40, height: 4)
                        .offset(x: -(size.width - 40) / 2)
                        .rotationEffect(.init(degrees: deg))
                }
            }
            .frame(width: size.width, height: size.height, alignment: .bottom)
            
            ZStack {
                ForEach(1...60, id: \.self) { index in
                    let deg = CGFloat(index) * 3
                    
                    Capsule()
                        .fill(deg < 60 ? Color.stopColor : (deg >= 60 && deg < 120 ? Color.viewTop : Color.viewBottom))
                        .frame(width: 40, height: 4)
                        .offset(x: -(size.width - 40) / 2)
                        .rotationEffect(.init(degrees: deg))
                }
            }
            .frame(width: size.width, height: size.height, alignment: .bottom)
            
            .mask {
                Circle()
                    .trim(from: 0, to: (ntwrkSpeed / 2) + 0.002)
                    .stroke(.white, lineWidth: 40)
                    .frame(width: size.width - 40, height: size.width - 40)
                    .offset(y: -(size.height) / 2)
                    .rotationEffect(.init(degrees: 180))
            }
        }
        .overlay(alignment: .bottom, content: {
            HStack {
                Text("0 Mb/s")
                    .font(.system(size: 15, weight: .semibold))
                    .offset(x: 10)
                
                Spacer()
                
                Text("\(Int(ntwrkSpeed * 200))Mb/s")
                    .font(.system(size: 15, weight: .semibold))
            }
            .offset(y: 35)
        })
        .overlay(alignment: .bottom, content: {
            IndicatorShape()
                .fill(Color.white)
                .overlay(alignment: .bottom, content: {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 30, height: 30)
                        .overlay {
                            Circle()
                                .fill(Color.black)
                                .padding(6)
                        }
                        .offset(y: 10)
                })
                .frame(width: 25)
                .padding(.top, 190)
                .rotationEffect(.init(degrees: -90), anchor: .bottom)
                .rotationEffect(.init(degrees: ntwrkSpeed * 180), anchor: .bottom)
                .offset(y: -5)
        })
        .padding(.top)
        .padding(10)
    }
}

struct IndicatorShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            let width = rect.width
            let height = rect.height
            
            path.move(to: CGPoint(x: width / 2, y: 0))
            path.addLine(to: CGPoint(x: 0, y: height))
            path.addLine(to: CGPoint(x: width, y: height))
        }
    }
}

