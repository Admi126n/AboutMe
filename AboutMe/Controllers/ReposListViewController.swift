//
//  GitHubViewController.swift
//  AboutMe
//
//  Created by Adam on 16/03/2023.
//

import UIKit

class ReposListViewController: UIViewController {

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
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == K.gitHubPageSegue {
			let destinationVC = segue.destination as! GitHubPageViewController
			destinationVC.url = ""
		}
	}
}

//MARK: - UITableViewDataSource

extension ReposListViewController: UITableViewDataSource {
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

extension ReposListViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		performSegue(withIdentifier: K.gitHubPageSegue, sender: self)
		// go to next screen with github website
	}
}

//MARK: - GitHubManagerDelegate

extension ReposListViewController: GitHubManagerDelegate {
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
