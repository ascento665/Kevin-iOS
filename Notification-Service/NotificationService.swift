// Created by Julian Dunskus

import UserNotifications

class NotificationService: UNNotificationServiceExtension {
	var contentHandler: ((UNNotificationContent) -> Void)!
	var bestAttemptContent: UNMutableNotificationContent!
	
	override func didReceive(_ request: UNNotificationRequest, withContentHandler contentHandler: @escaping (UNNotificationContent) -> Void) {
		self.contentHandler = contentHandler
		bestAttemptContent = (request.content.mutableCopy() as! UNMutableNotificationContent)
		
		if let bestAttemptContent = bestAttemptContent {
			// Modify the notification content here...
			bestAttemptContent.title = "Unrecognized Person Detected"
			bestAttemptContent.body = "Decide whether or not this person is welcome in the app."
			dump(bestAttemptContent.userInfo)
			
			contentHandler(bestAttemptContent)
		}
	}
	
	override func serviceExtensionTimeWillExpire() {
		// Called just before the extension will be terminated by the system.
		// Use this as an opportunity to deliver your "best attempt" at modified content, otherwise the original push payload will be used.
		contentHandler(bestAttemptContent)
	}
}
