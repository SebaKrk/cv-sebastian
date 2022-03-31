//
//  GitHubPublicRepoTableView.swift
//  SciubaSebastianCV
//
//  Created by akra on 28/03/2022.
//
import UIKit

protocol GitHubPublicRepoDelegate : AnyObject {
    func didSelectPublicRepoCell(urlString: String)
}

class GitHubPublicRepoTableView : UITableView {
    
    var gitHubRepos = [GitHubRepos]()
    
    weak var publicRepoDelegate: GitHubPublicRepoDelegate?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - TableView
    
    private func setupTableView() {
        register(PublicRepoCell.self, forCellReuseIdentifier: PublicRepoCell.publicRepoIdentifier)
        rowHeight = 50
        delegate = self
        dataSource = self
    }
    
//    MARK: - UI Elements
    
    func setuData(repos: [GitHubRepos]) {
        gitHubRepos = repos
        reloadData()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension GitHubPublicRepoTableView : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitHubRepos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: PublicRepoCell.publicRepoIdentifier) as! PublicRepoCell
        let data = gitHubRepos[indexPath.row]
        
        cell.repoNameLabel.text = data.name
        cell.repoCreatedLabel.text = data.created_at
        cell.languageIMG.image = UIImage(named: data.language)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deselectRow(at: indexPath, animated: true)
        let cell = gitHubRepos[indexPath.row]
        let urlString = cell.html_url
        publicRepoDelegate?.didSelectPublicRepoCell(urlString: urlString)
    }
}
