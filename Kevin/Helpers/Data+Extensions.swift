// Created by Julian Dunskus

import Foundation

extension Data {
	func hexEncodedString() -> String {
		return self
			.map { String(format: "%02x", $0) } // best way to get 0-padded hex string
			.joined()
	}
}
