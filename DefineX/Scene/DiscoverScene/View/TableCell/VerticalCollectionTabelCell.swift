//
//  VerticalCollectionTabelCell.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 30.07.2023.
//

import Foundation
import UIKit
import SnapKit


class VerticalCollectionTabelCell: UITableViewCell {
    
    static let identifier = "VerticalCollectionTabelCell"
    
    private let plantTypesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.5 , height: 172)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 1
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(VerticalCollectionCell.self, forCellWithReuseIdentifier: VerticalCollectionCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
//    var plantList = [Plant](){
//        didSet{
//            DispatchQueue.main.async {
//                self.plantTypesCollectionView.reloadData()
//            }
//        }
//
//    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(plantTypesCollectionView)
        plantTypesCollectionView.delegate = self
        plantTypesCollectionView.dataSource = self
        setUI()
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24))
       }

    func setUI() {
        plantTypesCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing)
            make.height.equalTo(800)
        }
    }
    
//    func setData(list:[Plant]){
//        self.plantList = list
//        DispatchQueue.main.async {
//            self.plantTypesCollectionView.reloadData()
//        }
//        rebuildCollectionView(plantCount: plantList.count)
//    }
    
    func rebuildCollectionView(plantCount: Int){
        plantTypesCollectionView.snp.removeConstraints()
        plantTypesCollectionView.snp.makeConstraints { make in
            make.height.equalTo(plantCount * 100)
            make.leading.equalTo(contentView.snp.leading)
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension VerticalCollectionTabelCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return plantList.count
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionCell.identifier, for: indexPath) as? VerticalCollectionCell else {
            return UICollectionViewCell()
        }
        //let plant = plantList[indexPath.row]
//        if let url = URL(string: plant.image?.url ??  "https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2Fcard2.png?alt=media"){
//            cell.setData(title: plant.title ?? "Edible Plants", questionImageURL: url)
//            print(plant.title)
           
        //}
        return cell
       
    }
}
