//
//  SceneDelegate.swift
//  MaybellineJsonParse
//
//  Created on 09.04.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?

	func scene(
			_ scene: UIScene,
			willConnectTo session: UISceneSession,
			options connectionOptions: UIScene.ConnectionOptions
	) {
		// swiftlint:disable unused_optional_binding
		guard let _ = (scene as? UIWindowScene) else { return }
		// swiftlint:enable unused_optional_binding
	}

	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}
}
