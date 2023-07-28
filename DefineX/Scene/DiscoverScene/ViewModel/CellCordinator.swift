//
//  CellCordinator.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 28.07.2023.
//

import Foundation
import UIKit

enum HomeSectionCellType {
    case FirstHorizontal, SecondHorizontal,Plants
}

enum HomneSectionItemType {
    case FirstHorizontal, SecondHorizontal,  Plants
}

class HomeCellItem {
    var cellIdentifier: String?
    var cellType: HomeSectionCellType?
}

class HomeSectionItem {
    var cellList = [HomeCellItem]()
    var sectionType: HomneSectionItemType?
}

protocol HomeInteractorDelegate: AnyObject {
    func reloadData()
    func presentWebView(indexPath: IndexPath)
}
class CellCordinator {

    enum CellType: String {
        case UpgradeAccount = "UpgradeAccount"
        case GetStarted = "GetStarted"
        case Feature = "Plants"
    }

//    private(set) var questionList = [Question]()
//    private(set) var plantList = [Plant]()
//
    weak var delegate: HomeInteractorDelegate?
    var sectionList = [HomeSectionItem]()



    func registerCell(tableView: UITableView){
        //tableView.register(UpgradeAccountTableViewCell.self, forCellReuseIdentifier: UpgradeAccountTableViewCell.identifier)
        tableView.register(GetStartedTableCell.self, forCellReuseIdentifier: GetStartedTableCell.identifier)
        tableView.register(SecondHorizontalTableCell.self, forCellReuseIdentifier: SecondHorizontalTableCell.identifier)
    }
    

//    func createUpgradeAccountCell(tableView: UITableView, indexPath: IndexPath) -> UpgradeAccountTableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: UpgradeAccountTableViewCell.identifier, for: indexPath) as! UpgradeAccountTableViewCell
//        let sectionItem = sectionList[indexPath.section]
//        if sectionItem.sectionType == .UpgradeAccount {
//            cell.setTContent(headerText: "FREE Premium Available", infoText: "Tap to upgrade your account!", leftIcon: Constants.badged_mail_icon!, goIcon: Constants.right_arrow!)
//        cell.backgroundColor = .clear
//        }
//        return cell
//    }

    func createFirstHorizontalCell(tableView: UITableView, indexPath: IndexPath) -> GetStartedTableCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GetStartedTableCell.identifier, for: indexPath) as! GetStartedTableCell
        //cell.delegate = self
        //cell.sentData(list: self.questionList)
        //cell.backgroundColor = .red
        return cell
    }

    func createSecondHorizontalCell(tableView: UITableView, indexPath: IndexPath) -> SecondHorizontalTableCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SecondHorizontalTableCell.identifier, for: indexPath) as! SecondHorizontalTableCell
        //cell.backgroundColor = .brown
        //cell.setData(list: self.plantList)
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

//        let getPlants = HomeSectionItem()
//        getPlants.sectionType = .Plants
//        getPlants.cellList = createPlantsSectionCellList()
//        sectionList.append(getPlants)
        delegate?.reloadData()
    }

    func createSecondHorizontalSectionCellList() -> [HomeCellItem]{
        var list = [HomeCellItem]()
        let upgradeAccountInfo = HomeCellItem()
        upgradeAccountInfo.cellType = .SecondHorizontal
        upgradeAccountInfo.cellIdentifier = GetStartedTableCell.identifier
        list.append(upgradeAccountInfo)
        return list
    }

    func createFirstHorizontalSectionCellList() -> [HomeCellItem]{
        var list = [HomeCellItem]()
        let getStartedCards = HomeCellItem()
        getStartedCards.cellType = .FirstHorizontal
        getStartedCards.cellIdentifier = GetStartedTableCell.identifier
        list.append(getStartedCards)
        return list
    }

//    func createPlantsSectionCellList() -> [HomeCellItem]{
//        var list = [HomeCellItem]()
//        let getPlantCards = HomeCellItem()
//        getPlantCards.cellType = .Plants
//        getPlantCards.cellIdentifier = PlantTypeCollectionTableCell.identifier
//        list.append(getPlantCards)
//        return list
//    }
}

//MARK: - Table View
extension CellCordinator {
    func createTableViewCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let sectionItem = sectionList[indexPath.section]
        if sectionItem.sectionType == .FirstHorizontal {
            return createFirstHorizontalCell(tableView: tableView, indexPath: indexPath)
        }
        else if sectionItem.sectionType == .SecondHorizontal {
            return createSecondHorizontalCell(tableView: tableView, indexPath: indexPath)
        }
//        else if sectionItem.sectionType == .Plants {
//            //return createPlantsCell(tableView: tableView, indexPath: indexPath)
//        }
        return UITableViewCell()
    }

    func getCellHeight(_ tableView: UITableView, indexPath: IndexPath) -> CGFloat {
        let sectionItem = sectionList[indexPath.section]
        if sectionItem.sectionType == .FirstHorizontal  {
            if sectionItem.cellList[indexPath.row].cellType == .FirstHorizontal {
                return 280
            }
        }
        else if sectionItem.sectionType == .SecondHorizontal {
           return 200
        }
        
//        else if sectionItem.sectionType == .Plants {
//            if sectionItem.cellList[indexPath.row].cellType == .Plants {
//                return  100 * CGFloat(plantList.count)
//            }
//        }
        return 100
    }

//    func createHeaderView(_ tableView: UITableView, section: Int) -> UIView? {
//        let sectionItem = sectionList[section]
//        if sectionItem.sectionType == .GetStarted {
//            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
//            let label = UILabel()
//            label.text = "Get Started"
//            label.textColor = UIColor.black // Set the text color
//            label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
//            headerView.addSubview(label)
//            label.snp.makeConstraints { make in
//                make.leading.equalToSuperview().offset(24)
//                make.height.equalToSuperview()
//            }
//            return headerView
//        }
//        else {
//            return nil
//        }
//    }

//    func showWebView(nav: UINavigationController, indexPath: IndexPath) {
//        let vc = WebViewInteractor(nav: nav)
//        vc.showDetail(URL:questionList[indexPath.row].uri ?? "https://plantapp.app/blog/differences-between-species-and-varieties/")
//    }
}

// fetch how to use it
//extension HomeInteractor {
//    func getQuestions() {
//        Service.getQuestions { [weak self] response in
//            print(response)
//            guard let self = self else {return}
//            self.questionList.removeAll()
//            self.questionList.append(contentsOf: response)
//            self.delegate?.reloadData()
//        } onError: { error in
//            print(error)
//        }
//    }
//}

extension CellCordinator: GetStartedTableCellDelegate {
    func didTappedGetStartedCell(_ cell: GetStartedTableCell, indexPath: IndexPath) {
        delegate?.presentWebView(indexPath: indexPath)
    }
}

//// fetch plants
//extension HomeInteractor {
//    func getPlants(){
//        Service.getPlants { [weak self] response in
//            guard let self = self else {return}
//            self.plantList.removeAll()
//            self.plantList = response.data
//            self.delegate?.reloadData()
//        } onError: { error in
//            print(error)
//        }
//    }
//}

