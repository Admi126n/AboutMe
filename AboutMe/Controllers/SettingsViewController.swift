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
	
	let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
		appearanceControl.selectedSegmentIndex = defaults.integer(forKey: "appAppearance")
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeAppearance(_ sender: UISegmentedControl) {
		switch sender.selectedSegmentIndex {
        case 0:
			defaults.set(UIUserInterfaceStyle.unspecified.rawValue, forKey: "appAppearance")
			view.window?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: defaults.integer(forKey: "appAppearance"))!
        case 1:
			defaults.set(UIUserInterfaceStyle.light.rawValue, forKey: "appAppearance")
			view.window?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: defaults.integer(forKey: "appAppearance"))!
        default:
			defaults.set(UIUserInterfaceStyle.dark.rawValue, forKey: "appAppearance")
			view.window?.overrideUserInterfaceStyle = UIUserInterfaceStyle(rawValue: defaults.integer(forKey: "appAppearance"))!
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
