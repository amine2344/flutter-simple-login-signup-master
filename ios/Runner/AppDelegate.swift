import UIKit
import Flutter
import FirebaseCore
import FirebaseMessaging
import UserNotifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Request permission for notifications
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            // Handle the result of the request
            if granted {
                print("Notification authorization granted")
            } else {
                print("Notification authorization denied")
            }
        }
        
        application.registerForRemoteNotifications()
        
        // Configure Firebase
        FirebaseApp.configure()
        
        // Set FCM token refresh delegate
        Messaging.messaging().delegate = self
        
        // Add observer for handling FCM token refresh
        NotificationCenter.default.addObserver(self, selector: #selector(self.tokenRefreshNotification(_:)), name: NSNotification.Name.MessagingRegistrationTokenRefreshed, object: nil)
        
        // Initialize Flutter plugins
        GeneratedPluginRegistrant.register(with: self)
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
        // Connect to FCM for token refresh
        connectToFcm()
    }
    
    // Handle FCM token refresh
    @objc func tokenRefreshNotification(_ notification: NSNotification) {
        connectToFcm()
    }
    
    // Connect to FCM
    func connectToFcm() {
        // Disconnect if connected
        Messaging.messaging().shouldEstablishDirectChannel = true
    }
}

// Implement FCM delegate methods
extension AppDelegate: MessagingDelegate {
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        if let fcmToken = fcmToken {
            print("FCM Token: \(fcmToken)")
            // You can send the FCM token to your server for targeted push notifications
        }
    }
    
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print("Received data message: \(remoteMessage.appData)")
    }
}
