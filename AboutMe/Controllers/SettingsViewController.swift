//
//  SettingsViewController.swift
//  AboutMe
//
//  Created by Adam on 19/03/2023.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var appearanceLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var appearanceControl: UISegmentedControl!
    @IBOutlet weak var languageControl: UISegmentedControl!
	
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeAppearance(_ sender: UISegmentedControl) {
		// TODO change appearance in whole app
		switch sender.selectedSegmentIndex {
        case 0:
            overrideUserInterfaceStyle = .dark
        case 1:
            overrideUserInterfaceStyle = .light
        default:
            overrideUserInterfaceStyle = .unspecified
        }
    }

    @IBAction func changeLanguage(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
		case 0:
			doneButton.titleLabel?.text = "Done"
		case 1:
			doneButton.titleLabel?.text = "Hecho"
		default:
			doneButton.titleLabel?.text = "Gotowe"
		}
		doneButton.sizeToFit()
		doneButton.titleLabel?.numberOfLines = 0
    }
}
