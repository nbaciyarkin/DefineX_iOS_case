//
//  DiscoverViewController.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 27.07.2023.
//

import Foundation
import UIKit
import SnapKit

class DiscoverViewController: UIViewController {
    
    
    let tableView = UITableView()
    
    
    
    let tableCoordinator = CellCordinator()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
                setUI()
        tableCoordinator.createSectionList()
        tableCoordinator.registerCell(tableView: tableView)
    }
    
    
    
    func setUI(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalToSuperview().offset(7)
            make.trailing.equalToSuperview().offset(-7)
            
        }
    }
}

extension DiscoverViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
       
        tableCoordinator.sectionList.count
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableCoordinator.sectionList[section].cellList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableCoordinator.createTableViewCell(tableView, indexPath)
    }
}

extension DiscoverViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableCoordinator.getCellHeight(tableView, indexPath: indexPath)
    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        //interactor.createHeaderView(tableView, section: section)
//    }
    
}


