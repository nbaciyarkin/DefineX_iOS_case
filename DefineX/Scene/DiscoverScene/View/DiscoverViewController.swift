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
    private let headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = .orange
        return headerView
    }()
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizationKeys.headerLabelTitle
        label.font = UIFont(name: "Roboto-Medium", size: 20)
        return label
    }()

    private let tableView = UITableView()
    private var refreshControl = UIRefreshControl()

    let customButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("N/A", for: .normal)
        btn.titleLabel?.font = UIFont(name: "Roboto-Italic", size: 20)
        // btn.addTarget(self, action: #selector(customButtonTapped), for: .touchUpInside)
        btn.backgroundColor = .red
        return btn
    }()

    let viewModel = DiscoverViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        viewModel.getFirstHorizontalData()
        viewModel.getSecondHorizontalData()
        viewModel.getVerticalData(noLoading: false, shouldRefresh: true)
        view.backgroundColor = .white
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        setUI()
        viewModel.createSectionList()
        viewModel.registerCell(tableView: tableView)
        initObservers()
        trackScreen()
    }

    private func initObservers() {
        viewModel.firstHorizontalProducts.bind { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
        }

        viewModel.secondHorizontalProducts.bind { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
        }

        viewModel.verticalProducts.bind { [weak self] _ in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
        
//        viewModel.isLoading.bind { isLoading in
//            isLoading ?? false ? refreshControl.isRefreshing = true : refreshControl.isRefreshing = false
//        }
    }

    func setTabBar() {
        let leftBarButtonItem = UIBarButtonItem(customView: customButton)
        customButton.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(40)
        }
        navigationItem.leftBarButtonItem = leftBarButtonItem
        let leftHeaderItem = UIBarButtonItem(customView: headerLabel)
        navigationItem.leftBarButtonItems = [leftBarButtonItem, leftHeaderItem]
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        customButton.applyGradient(colors: [Asset.barItemColorFirst.color.cgColor, Asset.barItemColorSecond.color.cgColor], startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 0))
        customButton.layer.cornerRadius = customButton.frame.size.width / 2
        customButton.clipsToBounds = true
    }

    @objc func customButtonTapped() {
        Alert.warning(title: LocalizationKeys.generalComingSoonTitle, text: LocalizationKeys.generalComingSoonTitle)
    }

    @objc private func refreshTableView(_ sender: Any) {
        fetchDataFromDataSource()
    }

    private func fetchDataFromDataSource() {
        // Fetch new data from your data source/API here

        viewModel.removeProducts()
        viewModel.getFirstHorizontalData()
        viewModel.getSecondHorizontalData()
        viewModel.getVerticalData(noLoading: false, shouldRefresh: true)
        tableView.reloadData()
        refreshControl.endRefreshing()
    }

    private func trackScreen() {
        let params: Parameters = [
            "User": UserDefaults.standard.getUserMail(),
            "VisitedVievController": "DiscoveryViewController"
        ]
        FirebaseManager.shared.trackScreen(viewController: "DiscoveryViewController", params: params)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        trackScreen()
    }

    func setUI() {
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
         viewModel.sectionList[section].cellList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.createTableViewCell(tableView, indexPath)
    }
}

extension DiscoverViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel.getCellHeight(tableView, indexPath: indexPath)
    }
}
