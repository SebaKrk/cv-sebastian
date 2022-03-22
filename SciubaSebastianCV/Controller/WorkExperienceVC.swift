//
//  WorkExperienceVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 15/03/2022.
//

import UIKit

class WorkExperienceVC : UIViewController {
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        configureTableView()
    }
    
//    MARK: - SetupView
    
    private func setupView() {
        view.backgroundColor = .white
        title = "Work Experience"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //    MARK: - SetupTableView
    
    private func setupTableView() {
        tableView.register(ExperienceCell.self, forCellReuseIdentifier: ExperienceCell.expIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 75
        tableView.reloadData()
    }
    
//    MARK: - Constraints
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension WorkExperienceVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceCell.expIdentifier) as! ExperienceCell
        cell.startDateLabel.text =  "2021-01"
        cell.endDateLabel.text = "2022-03"
        cell.positionLabel.text = "iOS Developer"
        cell.companyLabel.text = "Freelance"
        cell.locationLabel.text = "Krakow"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let desVC = ResponsibilitiesDetailsVC()
        desVC.modalPresentationStyle = .overFullScreen
        present(desVC,animated: false)
    }
}
