//
//  GitHubViewController.swift
//  AboutMe
//
//  Created by Adam on 16/03/2023.
//

import UIKit

class GitHubViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
	
	var gitHubManager: GitHubManager = GitHubManager()
	var repositories: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

		tableView.dataSource = self
		tableView.delegate = self
		gitHubManager.delegate = self
		
		tableView.register(UINib(nibName: K.repoCellName, bundle: nil), forCellReuseIdentifier: K.repoCellIdentifier)
		gitHubManager.getAvailableRepos()
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
			cell.langLogoImageView.image = safeImage
		} else {
			cell.langLogoImageView.image = UIImage(systemName: K.defaultLangLogo)!
		}
	
		return cell
	}
}

//MARK: - UITableViewDelegate

extension GitHubViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		// go to next screen with github website
	}
}

//MARK: - GitHubManagerDelegate

extension GitHubViewController: GitHubManagerDelegate {
	func didFetchRepoData(repositories: [Repository]) {
		self.repositories = repositories
		
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
	
	func didFailWithError(error: Error) {
		print("Fail")
	}
}
