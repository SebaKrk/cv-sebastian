//
//  WorkExpTableView.swift
//  SciubaSebastianCV
//
//  Created by akra on 04/04/2022.
//

import UIKit

class WorkExpTabeView : UITableView {
    
    var expArray = [Experience]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - UI Elements
    
    func setuData(experience: [Experience]) {
        print("reload")
        expArray = experience
        reloadData()
    }
    
    //    MARK: - Setup TableView
    
    private func setupTableView() {
        register(ExperienceCell.self, forCellReuseIdentifier: ExperienceCell.expIdentifier)
        rowHeight = 70
        dataSource = self
        delegate = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension WorkExpTabeView : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: ExperienceCell.expIdentifier) as! ExperienceCell
        
        let data = expArray[indexPath.row]
        
        cell.startDateLabel.text = data.startDate
        cell.endDateLabel.text = data.endDate
        cell.positionLabel.text = data.position
        cell.companyLabel.text = data.company
        cell.locationLabel.text = data.location
        
        return  cell
    }
}


