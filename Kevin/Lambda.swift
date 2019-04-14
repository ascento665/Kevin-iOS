// Created by Julian Dunskus

import Foundation

let provider = AWSStaticCredentialsProvider(accessKey: "AKIAYKU5HU3YAZF6JHUS", secretKey: "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")
let configuration = AWSServiceConfiguration(region: .EUWest1, credentialsProvider: provider)

enum Lambda {
	fileprivate static func invoke(_ request: AWSLambdaInvokerInvocationRequest) {
		AWSServiceManager.default()!.defaultServiceConfiguration = configuration
		
		let task = AWSLambdaInvoker.default().invoke(request)
		task.continueWith { task in
			dump(task.result)
		}
	}
	
	static func request(_ scene: Scene) {
		let request = AWSLambdaInvokerInvocationRequest()! <- {
			$0.functionName = "environmentHandler"
			$0.invocationType = .requestResponse
			$0.payload = ["event": scene.id]
		}
		
		invoke(request)
	}

	static func overrideAlert() {
		let request = AWSLambdaInvokerInvocationRequest()! <- {
			$0.functionName = "overrideFunction"
			$0.invocationType = .requestResponse
		}
		
		invoke(request)
	}
}
