//
//  SemestersView.swift
//  SciubaSebastianCV
//
//  Created by akra on 31/03/2022.
//

import Foundation
import UIKit

class SemestersTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        register(SemesterCell.self, forCellReuseIdentifier: SemesterCell.semesterReuseIdentifier)
        rowHeight = 100
        delegate = self
        dataSource = self
        reloadData()
    }
}

extension SemestersTableView: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: SemesterCell.semesterReuseIdentifier) as! SemesterCell
        
        return cell
    }
    
    
}
