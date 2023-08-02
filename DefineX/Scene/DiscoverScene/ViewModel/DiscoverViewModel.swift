//
//  DiscoverViewModel.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 27.07.2023.
//

import Foundation
import Combine
import UIKit

class DiscoverViewModel {
    private(set) var isLoading = Bindable<Bool>()
    private(set) var error = Bindable<Error>()

    private(set) var firstHorizontalProducts = Bindable<[Product]>()
    private(set) var secondHorizontalProducts = Bindable<[Product]>()
    private(set) var verticalProducts = Bindable<[Product]>()

    private var firstHorizontalProductList = [Product]()
    private var secondHorizontalProductList = [Product]()
    private var verticalProductList = [Product]()

    var hasMore = true
    var shouldDisplayLoading = false
    var sectionList = [HomeSectionItem]()

    func getFirstHorizontalData(noLoading: Bool = false, shouldRefresh: Bool = false) {
        if shouldRefresh {
            self.firstHorizontalProductList.removeAll()
            isLoading.value = true
        }
        guard hasMore else { return }
        Service.getFirstHorizontalList {  [weak self] page in
            guard let self = self else {return}
            self.isLoading.value = false
            if let products = page?.list {
                self.firstHorizontalProductList.append(contentsOf: products)
                self.firstHorizontalProducts.value = self.firstHorizontalProductList
                self.shouldDisplayLoading = false
                print(self.firstHorizontalProducts.value)
            }

            self.shouldDisplayLoading = false
        }onError: { [weak self] error in
            guard let self = self else { return }
            self.isLoading.value = false
            self.shouldDisplayLoading = false
            self.error.value = error
        }
    }

    func getSecondHorizontalData(noLoading: Bool = false, shouldRefresh: Bool = false) {
        if shouldRefresh {
            self.verticalProductList.removeAll()
            isLoading.value = true
        }
        guard hasMore else { return }
        Service.getSecondHorizontalList {  [weak self] page in
            guard let self = self else {return}
            self.isLoading.value = false
            if let products = page?.list {
                self.secondHorizontalProductList.append(contentsOf: products)
                self.secondHorizontalProducts.value = self.firstHorizontalProductList
                self.shouldDisplayLoading = false
            }

            self.shouldDisplayLoading = false
        }onError: { [weak self] error in
            guard let self = self else { return }
            self.isLoading.value = false
            self.shouldDisplayLoading = false
            self.error.value = error
        }
    }

    func getVerticalData(noLoading: Bool = false, shouldRefresh: Bool = false) {
        if shouldRefresh {
            self.verticalProductList.removeAll()
            isLoading.value = true
        }
        guard hasMore else { return }
        Service.getThirthTwoColumnList {  [weak self] page in
            guard let self = self else {return}
            self.isLoading.value = false
            if let products = page?.list {
                self.verticalProductList.append(contentsOf: products)
                self.verticalProducts.value = self.verticalProductList
                self.shouldDisplayLoading = false
                print(self.verticalProducts.value)
            }

            self.shouldDisplayLoading = false
        }onError: { [weak self] error in
            guard let self = self else { return }
            self.isLoading.value = false
            self.shouldDisplayLoading = false
            self.error.value = error
            print(error.localizedDescription)
        }
    }

}

enum HomeSectionCellType {
    case FirstHorizontal, SecondHorizontal, VerticlalCollection
}

enum HomneSectionItemType {
    case FirstHorizontal, SecondHorizontal, VerticlalCollection
}

class HomeCellItem {
    var cellIdentifier: String?
    var cellType: HomeSectionCellType?
}

class HomeSectionItem {
    var cellList = [HomeCellItem]()
    var sectionType: HomneSectionItemType?
}

// MARK: - TableView SET UP
extension DiscoverViewModel {

    enum CellType: String {
        case UpgradeAccount = "UpgradeAccount"
        case GetStarted = "GetStarted"
        case  VerticlalCollection = " VerticlalCollection"
    }

    func registerCell(tableView: UITableView) {
        tableView.register(FirstHorizontalTabelCell.self, forCellReuseIdentifier: FirstHorizontalTabelCell.identifier)
        tableView.register(SecondHorizontalTableCell.self, forCellReuseIdentifier: SecondHorizontalTableCell.identifier)
        tableView.register(VerticalCollectionTabelCell.self, forCellReuseIdentifier: VerticalCollectionTabelCell.identifier)
    }

    func createFirstHorizontalCell(firstHorizontalCell: [Product], tableView: UITableView, indexPath: IndexPath) -> FirstHorizontalTabelCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FirstHorizontalTabelCell.identifier, for: indexPath) as! FirstHorizontalTabelCell
        cell.sentData(list: firstHorizontalCell)
        return cell
    }

    func createSecondHorizontalCell(secondHorizontalCell: [Product], tableView: UITableView, indexPath: IndexPath) -> SecondHorizontalTableCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondHorizontalTableCell.identifier, for: indexPath) as! SecondHorizontalTableCell
        cell.sendData(list: secondHorizontalCell)
        return cell
    }

    func createVerticalCollectionCell(thirdVerticalCell: [Product], tableView: UITableView, indexPath: IndexPath) -> VerticalCollectionTabelCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: VerticalCollectionTabelCell.identifier, for: indexPath) as! VerticalCollectionTabelCell
        cell.sendData(list: thirdVerticalCell)

        return cell
    }

    func createSectionList() {
        self.sectionList.removeAll()
        let getstartedSection = HomeSectionItem()
        getstartedSection.sectionType = .FirstHorizontal
        getstartedSection.cellList = createFirstHorizontalSectionCellList()
        sectionList.append(getstartedSection)

        let featuresSection = HomeSectionItem()
        featuresSection.sectionType = .SecondHorizontal
        featuresSection.cellList = createSecondHorizontalSectionCellList()
        sectionList.append(featuresSection)

        let verticalCollectionSection = HomeSectionItem()
        verticalCollectionSection.sectionType = .VerticlalCollection
        verticalCollectionSection.cellList = createVerticalCollectionCellList()
        sectionList.append(verticalCollectionSection)
    }

    func createSecondHorizontalSectionCellList() -> [HomeCellItem] {
        var list = [HomeCellItem]()
        let secondHorizontalCards = HomeCellItem()
        secondHorizontalCards.cellType = .SecondHorizontal
        secondHorizontalCards.cellIdentifier = SecondHorizontalTableCell.identifier
        list.append(secondHorizontalCards)
        return list
    }

    func createFirstHorizontalSectionCellList() -> [HomeCellItem] {
        var list = [HomeCellItem]()
        let firstHorizontalCards = HomeCellItem()
        firstHorizontalCards.cellType = .FirstHorizontal
        firstHorizontalCards.cellIdentifier = FirstHorizontalTabelCell.identifier
        list.append(firstHorizontalCards)
        return list
    }

    func createVerticalCollectionCellList() -> [HomeCellItem] {
        var list = [HomeCellItem]()
        let verticalCollectionCellCards = HomeCellItem()
        verticalCollectionCellCards.cellType = .VerticlalCollection
        verticalCollectionCellCards.cellIdentifier = VerticalCollectionTabelCell.identifier
        list.append(verticalCollectionCellCards)
        return list
    }

    func createTableViewCell(firstHorizontalList: [Product], _ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let sectionItem = sectionList[indexPath.section]
        if sectionItem.sectionType == .FirstHorizontal {
            return createFirstHorizontalCell(firstHorizontalCell: firstHorizontalProductList, tableView: tableView, indexPath: indexPath)
        } else if sectionItem.sectionType == .SecondHorizontal {
            return createSecondHorizontalCell(secondHorizontalCell: secondHorizontalProductList, tableView: tableView, indexPath: indexPath)
        } else if sectionItem.sectionType == .VerticlalCollection {
            return createVerticalCollectionCell(thirdVerticalCell: verticalProductList, tableView: tableView, indexPath: indexPath)
        }
        return UITableViewCell()
    }

    func getCellHeight(_ tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        let sectionItem = sectionList[indexPath.section]
        if sectionItem.sectionType == .FirstHorizontal {
            if sectionItem.cellList[indexPath.row].cellType == .FirstHorizontal {
                return 280
            }
        } else if sectionItem.sectionType == .SecondHorizontal {
           return 200
        } else if sectionItem.sectionType == .VerticlalCollection {
            if sectionItem.cellList[indexPath.row].cellType == .VerticlalCollection {
                return  170 * CGFloat(verticalProductList.count)
            }
        }
        return 100
    }
}
