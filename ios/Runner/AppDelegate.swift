import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController

    let channel = FlutterMethodChannel(name: "mychannel", binaryMessenger: flutterViewController.binaryMessenger)

    // Register your plugins here
    let flutterEngine = flutterViewController.engine

    // Example registration for a camera plugin
    let cameraPlugin = CameraPlugin()
    cameraPlugin.register(with: flutterEngine)

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
