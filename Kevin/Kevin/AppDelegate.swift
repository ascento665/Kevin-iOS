// Created by Julian Dunskus

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		UIApplication.shared.registerForRemoteNotifications()
		
		let notificationCenter = UNUserNotificationCenter.current()
		notificationCenter.delegate = self
		notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (wasGranted, error) in
			// wasGranted is true if at least one option was granted
			print(wasGranted ? "granted" : "not granted")
			dump(error)
		}
		
		return true
	}
	
	func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
		print("registered as", deviceToken.hexEncodedString())
	}
	
	func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
		// can't think of a case where this would happen; airplane mode just causes it to wait indefinitely
		window!.rootViewController!.showAlert(titled: "Could Not Register for Push Notifications", message: error.localizedFailureReason)
		print("failed to register!")
		dump(error)
	}
	
	func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
		print("notification received!")
		dump(userInfo)
		completionHandler(.newData)
	}
}

extension AppDelegate: UNUserNotificationCenterDelegate {
	func userNotificationCenter(
		_ center: UNUserNotificationCenter,
		willPresent notification: UNNotification,
		withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
	) {
		completionHandler([.alert, .badge, .sound])
	}
	
	func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) {
		print("open settings")
	}
	
	func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
		switch response.actionIdentifier {
		case UNNotificationDefaultActionIdentifier:
			print("tapped")
		case UNNotificationDismissActionIdentifier:
			print("explicitly dismissed!")
		default:
			print("unknown action:", response.actionIdentifier)
		}
		completionHandler()
	}
}
