//
//  AboutViewController.swift
//  AboutMe
//
//  Created by Adam Tokarski on 18/09/2023.
//

import UIKit

class AboutViewController: UIViewController {

	private let appDescription: String = """
In this app I wanted to play with a few things I've learnt during my Udemy courses. \
So there are my GitHub repositories fetched by GitHub's API, WebView with GitHub and \
YouTube pages some segues and app apearance settings which uses user defaults.

I wanted to make this app much bigger but then I focused on another apps, courses, \
SwiftUI and my thesis. So I'm done here. See you later in another apps. I hope they \
will be bigger and better :).
"""
	
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

		descriptionLabel.text = appDescription
    }

}
