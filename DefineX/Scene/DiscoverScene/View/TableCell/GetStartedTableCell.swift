//
//  GetStartedTableCell.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 28.07.2023.
//

import Foundation
//
//  GetStartedTableCell.swift
//  HUBX
//
//  Created by Yarkın Gazibaba on 18.07.2023.
//

import UIKit
import SnapKit
// import SDWebImage

class FirstHorizontalTabelCell: UITableViewCell {

    static let identifier = "FirstHorizontalTabelCell"

    var products = [Product]() {
        didSet {
            DispatchQueue.main.async {
                self.horizontalCollectionView.reloadData()
            }
        }
    }

    private let horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2.1, height: 250)
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 4
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(HorizontalCollectionCell.self, forCellWithReuseIdentifier: HorizontalCollectionCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(horizontalCollectionView)
        horizontalCollectionView.delegate = self
        horizontalCollectionView.dataSource = self
        selectionStyle = .none
        setUI()
    }

    override func layoutSubviews() {
           super.layoutSubviews()
           contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 1, bottom: 0, right: 1))
       }

    func setUI() {
        horizontalCollectionView.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading)
            make.top.equalTo(contentView.snp.top)
            make.trailing.equalTo(contentView.snp.trailing)
            make.height.equalToSuperview()
        }
    }
//
    func sentData(list: [Product]) {
        self.products = list
        DispatchQueue.main.async {
            self.horizontalCollectionView.reloadData()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FirstHorizontalTabelCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionCell.identifier, for: indexPath) as? HorizontalCollectionCell else {
            return UICollectionViewCell()

        }
        let product = products[indexPath.row]
        cell.setFirstHorizontalData(title: product.description, currentPrice: product.price, discount: product.discount, oldPrice: product.oldPrice, image: product.imageUrl)
        cell.setFirstHorizontalUI()
        return cell
    }

}
