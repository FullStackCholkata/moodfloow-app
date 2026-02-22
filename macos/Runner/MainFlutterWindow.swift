import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
    // Hide the maximize (zoom) button FIRST
    self.standardWindowButton(.zoomButton)?.isHidden = true
    
    // Make window fully transparent initially
    self.alphaValue = 0
    
    let flutterViewController = FlutterViewController()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: true)

    RegisterGeneratedPlugins(registry: flutterViewController)

    super.awakeFromNib()
  }
  
  // Keep window transparent when ordered front
  override func makeKeyAndOrderFront(_ sender: Any?) {
    super.makeKeyAndOrderFront(sender)
    self.standardWindowButton(.zoomButton)?.isHidden = true
  }
  
  override func orderFront(_ sender: Any?) {
    super.orderFront(sender)
    self.standardWindowButton(.zoomButton)?.isHidden = true
  }
  
  // Only restore opacity when explicitly shown by Flutter
  override func orderFrontRegardless() {
    super.orderFrontRegardless()
    self.alphaValue = 1
    self.standardWindowButton(.zoomButton)?.isHidden = true
  }
}
