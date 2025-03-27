//
//  Data.swift
//  NeonVortex
//
//  Created by P Deepanshu on 20/03/25.
//

import Foundation

enum ConnectionStatus: String, Codable {
    case disconnected
    case connected
    case connecting
    case error
}

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct Region: Identifiable, Codable {
    var id = UUID()
    var name: String
    var flag: String
    var strength: Int
    var servers: [VPNServer]
    var ipAddress: String
}

struct VPNServer: Identifiable, Codable {
    var id = UUID()
    var ipAddress: String
    var city: String
    var load: Int
    var isRecommended: Bool
}

struct UserSettings: Codable {
    var selectedRegion: Region?
    var autoConnect: Bool
    var useWireGuard: Bool
}

class DropdownManager: ObservableObject {
    @Published var regions = Data.regions
    @Published var expanded = false
    var selectedIndex = 0
    
    func expandCollapseView() {
        expanded.toggle()
    }
    
    func selectItem(region: Region) {
        if let index = regions.firstIndex(where: { $0.id == region.id }) {
            selectedIndex = index
        }
    }
}

struct Data {
    static let regions = [
        Region(name: "Singapore", flag: "🇸🇬", strength: 10, servers: [
            VPNServer(ipAddress: "103.108.10.10", city: "Singapore", load: 5, isRecommended: true),
            VPNServer(ipAddress: "103.108.10.11", city: "Singapore", load: 3, isRecommended: false),
        ], ipAddress: "103.108.10.10"),
        Region(name: "United States", flag: "🇺🇸", strength: 10, servers: [
            VPNServer(ipAddress: "192.168.1.10", city: "New York", load: 7, isRecommended: true),
            VPNServer(ipAddress: "192.168.1.11", city: "Los Angeles", load: 4, isRecommended: false),
        ], ipAddress: "192.168.1.10"),
        Region(name: "United Kingdom", flag: "🇬🇧", strength: 10, servers: [
            VPNServer(ipAddress: "10.0.0.10", city: "London", load: 6, isRecommended: true),
            VPNServer(ipAddress: "10.0.0.11", city: "Manchester", load: 2, isRecommended: false),
        ], ipAddress: "10.0.0.10"),
        Region(name: "Canada", flag: "🇨🇦", strength: 10, servers: [
            VPNServer(ipAddress: "172.16.0.10", city: "Toronto", load: 5, isRecommended: true),
            VPNServer(ipAddress: "172.16.0.11", city: "Vancouver", load: 3, isRecommended: false),
        ], ipAddress: "172.16.0.10"),
    ]
    
    static let menus = [
        MenuItem(name: "Apps using VPN", imageName: "icloud.and.arrow.down"),
        MenuItem(name: "Rate us", imageName: "star"),
        MenuItem(name: "Support", imageName: "questionmark.circle"),
        MenuItem(name: "Settings", imageName: "gearshape")
        
    ]
}
