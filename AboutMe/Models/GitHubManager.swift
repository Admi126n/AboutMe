//
//  GitHubManager.swift
//  AboutMe
//
//  Created by Adam on 16/03/2023.
//

import Foundation

protocol GitHubManagerDelegate {
	func didFetchRepoData()
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
					print("There are some troubles...\n\(error as Any)")
					return
				}
				if let safeData = data {
					if let repoData =  self.parseJson(safeData) {
						print(repoData.name)
						print(repoData.language)
//						self.delegate?.didFetchRepoData()
					} else {
						print("ass")
					}
				}
			}
			task.resume()
		}
	}
	
	func parseJson(_ data: Data) -> Repository? {
		let decoder = JSONDecoder()
		do {
			let decodedData = try decoder.decode([RepositoryData].self, from: data)
			// TODO get all repos instead of getting first one :)
			let repoName = decodedData[0].name
			let repoLang = decodedData[0].language
			
			let repo = Repository(name: repoName, language: repoLang)
			
			return repo
		} catch {
			self.delegate?.didFailWithError(error: error)
			return nil
		}
	}
}
