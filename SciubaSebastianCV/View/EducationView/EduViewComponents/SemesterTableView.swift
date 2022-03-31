//
//  SemestersView.swift
//  SciubaSebastianCV
//
//  Created by akra on 31/03/2022.
//

import Foundation
import UIKit

class SemesterTableView: UITableView {
    
    var educationDataViewModel = EducationViewModel()
    var educationArray = [Education]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - setupTableView
    
    private func setupTableView() {
        register(SemesterCell.self, forCellReuseIdentifier: SemesterCell.semesterReuseIdentifier)
        rowHeight = 100
        delegate = self
        dataSource = self
        reloadData()
    }
    //    MARK: - UI Elements
        
        func setuData(eduData: [Education]) {
            educationArray = eduData
            reloadData()
        }
}

// MARK: - UITableViewDelegate,UITableViewDataSource

extension SemesterTableView: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return educationArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: SemesterCell.semesterReuseIdentifier) as! SemesterCell
        let data = educationArray[indexPath.row]
        
        cell.subNummberLabel.text = "\(data.semester.subNummber)"
        cell.scoreLabel.text = "\(data.semester.score)"
        cell.academicYersLabel.text = data.semester.academic_year
        cell.semDataLabel.text = data.semester.sem_from
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deselectRow(at: indexPath, animated: true)
    }
}
