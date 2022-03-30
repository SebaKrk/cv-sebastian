//
//  WorkExperienceVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 15/03/2022.
//

import UIKit

class WorkExperienceVC : UIViewController {
    
    var tableView = UITableView()
    
    var expDataViewModel = ExperianceViewModel()
    var expArray = [Experience]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTableView()
        configureTableView()
        getData()
   
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
    
    func getData() {
        expArray = expDataViewModel.setExpData()
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
        
        return expArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ExperienceCell.expIdentifier) as! ExperienceCell
        let data = expArray[indexPath.row]
        
        cell.startDateLabel.text = data.startDate
        cell.endDateLabel.text = data.endDate
        cell.positionLabel.text = data.position
        cell.companyLabel.text = data.company
        cell.locationLabel.text = data.location
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let data = expArray[indexPath.row]
        
        let desVC = ResponsibilitiesDetailsVC()
        desVC.modalPresentationStyle = .overFullScreen
        
        desVC.firstResp.text = data.responsibilities.first
        desVC.secondResp.text = data.responsibilities.second
        desVC.thirdResp.text = data.responsibilities.third
        
        present(desVC,animated: false)
    }
}
