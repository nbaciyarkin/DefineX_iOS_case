//
//  DiscoverViewController.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 27.07.2023.
//

import Foundation
import UIKit
import SnapKit
import Alamofire
import Combine

class DiscoverViewController: UIViewController {
    private let tableView = UITableView()
    private var refreshControl = UIRefreshControl()

    
    //let tableCoordinator = CellCordinator()
    let viewModel = DiscoverViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getFirstHorizontalData()
        viewModel.getSecondHorizontalData()
        viewModel.getVerticalData(noLoading: false, shouldRefresh: true)
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        setUI()
        viewModel.createSectionList()
        viewModel.registerCell(tableView: tableView)
        initObservers()
    }
    
    private func initObservers() {
        viewModel.firstHorizontalProducts.bind { [weak self] _ in
            guard let self = self else { return }
            //self.movieCounterLabel.isHidden = self.viewModel.currentMovieCount == 0
            self.tableView.reloadData()
            //print(viewModel.firstHorizontalProducts.value!)
        }

        viewModel.secondHorizontalProducts.bind { [weak self] _ in
            guard let self = self else { return }
            //self.movieCounterLabel.isHidden = self.viewModel.currentMovieCount == 0
            self.tableView.reloadData()
//            print(viewModel.secondHorizontalProducts.value!)
        }
        
        viewModel.verticalProducts.bind { [weak self] _ in
            guard let self = self else { return }
            //self.movieCounterLabel.isHidden = self.viewModel.currentMovieCount == 0
            self.tableView.reloadData()
            print(viewModel.verticalProducts.value!)
        }
    }
    
        
    
    @objc private func refreshTableView(_ sender: Any) {
        // Perform your data fetching or reloading operations here
        
        // For example, you could fetch new data from your data source/API and then reload the table view
        fetchDataFromDataSource()
    }

    private func fetchDataFromDataSource() {
        // Fetch new data from your data source/API here
        
        // Once the data is fetched, reload the table view and end the refreshing
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
//    private func getProducts(noLoading: Bool = false, shouldRefresh: Bool = false) {
//        viewModel
//    }
    
    
    func setUI(){
        tableView.addSubview(refreshControl)
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
       
        viewModel.sectionList.count
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sectionList[section].cellList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = [Product]()
        return viewModel.createTableViewCell(firstHorizontalList: viewModel.firstHorizontalProducts.value ?? list ,tableView, indexPath)
    }
}

extension DiscoverViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.getCellHeight(tableView, indexPath: indexPath)
    }

//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        //interactor.createHeaderView(tableView, section: section)
//    }
    
}


