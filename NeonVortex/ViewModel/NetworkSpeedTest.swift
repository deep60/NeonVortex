//
//  NetworkSpeedTest.swift
//  NeonVortex
//
//  Created by P Deepanshu on 27/03/25.
//

import Foundation
import Network

class NetworkSpeedTest {
    static let shared = NetworkSpeedTest()
    private init() {}
    
    func testDownloadSpeed(completion: @escaping (Double) -> Void) {
        guard let url = URL(string: "") else {
            completion(0.0)
            return
        }
        
        let expectedFileSize: Double = 100 * 1024 * 1024  // 100 MB
        let startTime = Date()
        let task = URLSession.shared.downloadTask(with: url) { (tempLocalUrl, response, error) in
            let endTime = Date()
            let duration = endTime.timeIntervalSince(startTime)
            let speed = duration > 0 ? (expectedFileSize / (duration * 1024 * 1024)) : 0.0
            DispatchQueue.main.async {
                completion(speed)
            }
        }
        
        task.resume()
    }
    
    func checkNetworkType(completion: @escaping (String) -> Void) {
            let monitor = NWPathMonitor()
            let queue = DispatchQueue(label: "NetworkMonitor")
            
            monitor.pathUpdateHandler = { path in
                var networkType = "Unknown"
                
                if path.status == .satisfied {
                    if path.usesInterfaceType(.wifi) {
                        networkType = "WiFi"
                    } else if path.usesInterfaceType(.wiredEthernet) {
                        networkType = "Wired Ethernet"
                    } else if path.usesInterfaceType(.cellular) {
                        networkType = "Cellular"
                    }
                }
                
                DispatchQueue.main.async {
                    completion(networkType)
                    monitor.cancel()
                }
            }
            
            monitor.start(queue: queue)
        }
        
        // Estimate speed based on network type
        func estimateNetworkSpeed(completion: @escaping (Double) -> Void) {
            checkNetworkType { networkType in
                switch networkType {
                case "WiFi":
                    completion(100.0) // Typical home WiFi
                case "Wired Ethernet":
                    completion(500.0) // Wired connection
                case "Cellular":
                    completion(50.0)  // 4G/5G speeds
                default:
                    completion(10.0)  // Fallback for unknown connections
                }
            }
        }
}
