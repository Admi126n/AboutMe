//
//  AppearanceManager.swift
//  AboutMe
//
//  Created by Adam on 24/03/2023.
//

import Foundation
import UIKit

struct AppearanceManager {
	
	private static let defaults = UserDefaults.standard
	
	func setSettings() {
		
	}
	
	static func getSettings() -> UIUserInterfaceStyle {
		let interfaceStyle: Int = defaults.integer(forKey: K.appAppearanceDefaults)
		
		return UIUserInterfaceStyle(rawValue: interfaceStyle)!
	}
}
