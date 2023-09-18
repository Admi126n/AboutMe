//
//  YouTubeViewController.swift
//  AboutMe
//
//  Created by Adam Tokarski on 18/09/2023.
//

import UIKit
import WebKit

class YouTubeViewController: UIViewController {
	
	@IBOutlet weak var webView: WKWebView!
	
	private let youTubeURL: String = "https://youtube.com/@admi126n?si=t7d3DjjraI91C43P"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		performURLRequest()
	}
	
	func performURLRequest() {
		if let safeURL = URL(string: youTubeURL) {
			let myRequest = URLRequest(url: safeURL)
			webView.load(myRequest)
		}
		
	}
	
}
