# NeonVortex

A high-performance, secure, and private VPN application built using Swift/Rust.

## Features

- 🔒 **End-to-End Encryption** – Ensures secure communication
- ⚡ **Blazing Fast Speeds** – Optimized for low latency and high throughput
- 🛡️ **No Logs Policy** – Your privacy is our priority
- 🌍 **Global Server Network** – Connect from anywhere
- 📱 **Cross-Platform Support** – iOS (Swift) / Multi-platform (Rust)

## Technologies Used

- **Swift** (for iOS/macOS)
- **Rust** (for multi-platform security & performance)
- **WireGuard/OpenVPN** Protocol
- **TLS Encryption**
- **SwiftUI for UI Design** (iOS)
- **Tokio & async handling** (Rust)

## Installation

### For Swift (iOS/macOS)

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/VPNApp.git
   cd VPNApp
   ```
2. Install dependencies using CocoaPods or Swift Package Manager (SPM):
   ```bash
   pod install  # or use Swift Package Manager (SPM)
   ```
3. Open the `.xcworkspace` file in Xcode:
   ```bash
   open VPNApp.xcworkspace
   ```
4. Build and run the project in Xcode.

### For Rust (Multi-Platform)

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/VPNApp.git
   cd VPNApp
   ```
2. Install Rust dependencies:
   ```bash
   cargo build --release
   ```
3. Run the VPN service:
   ```bash
   cargo run
   ```

## Configuration

- Modify `Config.swift` or `config.rs` to add server credentials and security settings.
- API keys and server addresses must be configured before deployment.

## Contributing

Contributions are welcome! Please submit a pull request or open an issue.

## License

This project is licensed under the MIT License.
