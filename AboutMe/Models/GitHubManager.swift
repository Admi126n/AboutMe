//
//  GitHubManager.swift
//  AboutMe
//
//  Created by Adam on 16/03/2023.
//

import Foundation

protocol GitHubManagerDelegate {
	func didFetchRepoData(repositories: [Repository])
	func didFailWithError(error: Error)
}

struct GitHubManager {
	private let baseURL = "https://api.github.com/users/admi126n/repos?sort=updated?direction=asc"
	var delegate: GitHubManagerDelegate?
	
	func getAvailableRepos() {
		performRequest(with: baseURL)
	}
	
	private func performRequest(with urlString: String) {
		if let safeUrl = URL(string: urlString) {
			let session = URLSession(configuration: .default)
			let task = session.dataTask(with: safeUrl) { data, response, error in
				if error != nil {
					self.delegate?.didFailWithError(error: error!)
					return
				}
				if let safeData = data {
					if let repoData =  self.parseJson(safeData) {
						self.delegate?.didFetchRepoData(repositories: repoData)
					}
				}
			}
			task.resume()
		}
	}
	
	func parseJson(_ data: Data) -> [Repository]? {
		var repositories: [Repository] = []
		let decoder = JSONDecoder()
		do {
			let decodedData = try decoder.decode([RepositoryData].self, from: data)
			
			for el in decodedData {
				let repoName = el.name
				let repoLang = el.language
				
				repositories.append(Repository(name: repoName, language: repoLang))
			}
		
			return repositories
		} catch {
			self.delegate?.didFailWithError(error: error)
			return nil
		}
	}
}
