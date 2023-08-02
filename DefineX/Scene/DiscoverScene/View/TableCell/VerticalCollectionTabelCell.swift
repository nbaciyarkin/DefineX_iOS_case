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
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.1, height: 330)
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

    private var products = [Product]() {
        didSet {
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

    func sendData(list: [Product]) {
        self.products = list
        DispatchQueue.main.async {
            self.verticalCollectionView.reloadData()
        }
        rebuildCollectionView(plantCount: products.count)
    }

    func rebuildCollectionView(plantCount: Int) {
        verticalCollectionView.snp.removeConstraints()
        verticalCollectionView.snp.makeConstraints { make in
            make.height.equalTo(plantCount * 250)
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

        if let rate = product.ratePercentage {
            let grenStarRate = starIconGenerator(rate: rate)
            cell.setStarsWithRate(rate: grenStarRate)
            cell.showRateView()
        } else {
            cell.hideRateView()
        }

        if let oldValue = product.oldPrice?.value {
            cell.setUIWithOldPrice()
            cell.setDataWithOldPrice(title: product.description, currentPrice: product.price, oldPrice: product.oldPrice, discount: product.discount, image: product.imageUrl, rate: product.ratePercentage)
            cell.setDiscount()
        } else {
            cell.setUI()
            cell.setDataWithPrice(title: product.description, currentPrice: product.price, image: product.imageUrl, rateImage: product.ratePercentage)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        guard let params = product.description as? [String: Any] else { return }
        FirebaseManager.shared.trackScreen(viewController: "DiscoverViewController", params: params)
    }
}

extension VerticalCollectionTabelCell: UICollectionViewDelegateFlowLayout {
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let product = products[indexPath.item]

         if let oldValue = product.oldPrice {
             return CGSize(width: UIScreen.main.bounds.width / 2.1, height: 248)
         } else {
             return CGSize(width: UIScreen.main.bounds.width / 2.1, height: 328)
         }
    }
}

extension VerticalCollectionTabelCell {
    func starIconGenerator(rate: Int) -> Int {
        switch rate {
        case 0..<21:
            return 1
        case 21..<41:
            return 2
        case 40..<61:
            return 3
        case 61..<81:
            return 4
        case 81..<101:
            return 5
            default:
               return 1
            }
    }
}
