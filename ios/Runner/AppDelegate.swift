import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let flutterViewController: FlutterViewController = window?.rootViewController as! FlutterViewController
        GeneratedPluginRegistrant.register(with: self)

        // Your additional setup code...

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
