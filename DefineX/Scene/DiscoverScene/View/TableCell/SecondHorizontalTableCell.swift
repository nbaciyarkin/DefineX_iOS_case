//
//  SecondHorizontalTableCell.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 28.07.2023.
//

import Foundation
//
//  GetStartedCollectionCell.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 28.07.2023.
//

import Foundation
import UIKit
import SnapKit

//protocol SecondHorizontalTableCell: AnyObject {
//    func didTappedGetStartedCell(_ cell: GetStartedTableCell ,indexPath:IndexPath)
//}

class SecondHorizontalTableCell: UITableViewCell {
    
    static let identifier = "SecondHorizontalTableCell"
    
    //weak var delegate: GetStartedTableCellDelegate?
    
//    var questionList = [Question]() {
//        didSet{
//            DispatchQueue.main.async {
//                self.getStartedCollectionView.reloadData()
//            }
//        }
//    }
    
    private let horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3.2 , height: 180)
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
           contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2))
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
//    func sentData(list:[Question]){
//        self.questionList = list
//        DispatchQueue.main.async {
//            self.getStartedCollectionView.reloadData()
//        }
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondHorizontalTableCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return questionList.count
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionCell.identifier, for: indexPath) as? HorizontalCollectionCell else {
            return UICollectionViewCell()
           
        }
//        let question = questionList[indexPath.row]
//        if let url = URL(string: question.image_uri ??  "https://firebasestorage.googleapis.com/v0/b/flora---plant-identifier.appspot.com/o/public%2Fcard2.png?alt=media"){
//            let title = question.title
//            cell.setData(title: title ?? "How to plant identify?", questionImageURL: url)
//            print(question)
//           return cell
//        }
        cell.imageView.image = UIImage(named: "second_horizontal_image")
        cell.convertsecondHorizontalCell()
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        delegate?.didTappedGetStartedCell(self, indexPath: indexPath)
//    }
}
