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
    
    private let verticalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.1 , height: 330)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(VerticalCollectionCell.self, forCellWithReuseIdentifier: VerticalCollectionCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    private var products = [Product](){
        didSet{
            DispatchQueue.main.async {
                self.verticalCollectionView.reloadData()
            }
        }

    }


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(verticalCollectionView)
        verticalCollectionView.delegate = self
        verticalCollectionView.dataSource = self
        setUI()
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1))
       }

    func setUI() {
        verticalCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing)
            make.height.equalTo(800)
        }
    }
    
    func sendData(list:[Product]){
        self.products = list
        DispatchQueue.main.async {
            self.verticalCollectionView.reloadData()
        }
        print("ZIP")
        rebuildCollectionView(plantCount: products.count)
    }
    
    func rebuildCollectionView(plantCount: Int){
        verticalCollectionView.snp.removeConstraints()
        verticalCollectionView.snp.makeConstraints { make in
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
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VerticalCollectionCell.identifier, for: indexPath) as? VerticalCollectionCell else {
            return UICollectionViewCell()
        }
        let product = products[indexPath.row]
        print("asd")
//        if let url = URL(string: plant.image?.url ??  "https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2Fcard2.png?alt=media"){
//            cell.setData(title: plant.title ?? "Edible Plants", questionImageURL: url)
//            print(plant.title)
           
        //}
        return cell
       
    }
}
