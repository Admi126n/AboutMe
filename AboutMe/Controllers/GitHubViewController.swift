//
//  GitHubViewController.swift
//  AboutMe
//
//  Created by Adam on 16/03/2023.
//

import UIKit

class GitHubViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
	
	var repositories: [Repository] = [
		Repository(name: "test", language: "test"),
		Repository(name: "test1", language: "Admi126n")
	]
    
    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.dataSource = self
		tableView.register(UINib(nibName: K.repoCellName, bundle: nil), forCellReuseIdentifier: K.repoCellIdentifier)
    }

}

//MARK: - UITableViewDataSource

extension GitHubViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return repositories.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let repository = repositories[indexPath.row]
		
		let cell = tableView.dequeueReusableCell(withIdentifier: K.repoCellIdentifier, for: indexPath) as! RepositoryCell
		cell.repositoryName.text = repository.name
		cell.languageLabel.text = repository.language
		
		if let safeImage = UIImage(named: repository.language) {
			cell.languageLogo.image = safeImage
		} else {
			
		}
	
		return cell
	}
}
