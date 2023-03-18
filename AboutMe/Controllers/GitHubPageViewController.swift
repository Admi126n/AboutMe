//
//  GitHubPageViewController.swift
//  AboutMe
//
//  Created by Adam on 18/03/2023.
//

import UIKit
import WebKit

class GitHubPageViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
	private let baseURL: String = "https://github.com/Admi126n/"
	var repoName: String?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		performURLRequest()
    }
	
	func performURLRequest() {
		if let safeRepoName = repoName {
			if let safeURL = URL(string: baseURL + safeRepoName) {
				let myRequest = URLRequest(url: safeURL)
				webView.load(myRequest)
			}
		}
		
	}
}
