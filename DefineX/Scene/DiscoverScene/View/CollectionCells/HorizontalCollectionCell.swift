//
//  GetStartedCollectionCell.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 28.07.2023.
//

import Foundation
import UIKit
import SnapKit

class HorizontalCollectionCell: UICollectionViewCell {
    static let identifier = "HorizontalCollectionCell"
    
    private var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
     var imageView: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "first_horizontal_image")
        img.layer.cornerRadius = 3
        img.backgroundColor = .green
        img.layer.masksToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private var infoLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Little Black Book For Perfect Reading"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Roboto-Regular", size: 16)
        lbl.numberOfLines = 2
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        return lbl
    }()
    
    private var currentPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "19,99 $US"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Roboto-Medium", size: 14)
        lbl.numberOfLines = 3
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        return lbl
    }()
    
    private var lineView = UIView()
    
    private var oldValueLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "39,99 $US"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Roboto-Regular", size: 12)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        return lbl
    }()
    
    private var discountLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "48%OFF"
        lbl.textAlignment = .left
        lbl.font = UIFont(name: "Roboto-Regular", size: 12)
        lbl.textColor = UIColor(named: "discount_color")?.withAlphaComponent(0.87)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let  circularBlackView = CircularBlackView()
    
    
    private let bottomStackView: UIStackView = {
        let stackV = UIStackView()
        stackV.axis = .horizontal
        stackV.backgroundColor = .clear
        stackV.distribution = .fillProportionally
        stackV.spacing = 0
        stackV.alignment = .center
        return stackV
    }()
    
     func addShadow() {
        super.layoutSubviews()
         self.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 3
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //contentView.layer.cornerRadius = 14
        setStackView()
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 3
//        contentView.layer.borderWidth = 0.5
//        contentView.layer.borderColor = UIColor(named: "login_selectedColor")?.cgColor
        oldValueLabel.setMiddleLineView(label: oldValueLabel)
        addShadow()
       
        
        
//        let blurEffect = UIBlurEffect(style: .dark)
//        let blurView = UIVisualEffectView(effect: blurEffect)
//        blurView.frame = contentView.bounds
        //containerView.addSubview(blurView)
        containerView.backgroundColor = .clear
        setUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        imageView.image = nil
//        infoLabel.text = ""
//    }

    func setStackView() {
        bottomStackView.addArrangedSubview(oldValueLabel)
        bottomStackView.addArrangedSubview(discountLabel)
//        bottomStackView.addArrangedSubview(circularBlackView)
    }
    
    func convertsecondHorizontalCell() {
        self.discountLabel.isHidden = true
        self.infoLabel.font = UIFont(name: "Roboto-Regular", size: 12)
    }
    

    func setData(title: String, questionImageURL: URL) {
        //imageView.sd_setImage(with: questionImageURL, completed: nil)
        infoLabel.text = title
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2))
       }
    
    func setUI() {
        contentView.addSubview(imageView)
        self.contentView.sendSubviewToBack(imageView)
       
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.leading.equalTo(contentView.snp.leading).offset(8)
            make.height.equalTo(contentView.snp.height).multipliedBy(0.5)
            make.trailing.equalTo(contentView.snp.trailing).offset(-8)
        }
        
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
        }
        
        containerView.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.width.equalTo(containerView.snp.width)
            make.height.equalTo(containerView.snp.height).multipliedBy(0.5)
        }
        
        containerView.addSubview(currentPriceLabel)
        currentPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(8)
            make.width.equalTo(containerView.snp.width)
            make.height.equalTo(infoLabel.snp.height).multipliedBy(0.4)
        }
        
        
//        containerView.addSubview(oldValueLabel)
//        oldValueLabel.snp.makeConstraints { make in
//            make.leading.equalTo(infoLabel.snp.leading)
//            make.width.equalTo(infoLabel.snp.width).multipliedBy(0.5)
//            make.height.equalTo(currentPriceLabel.snp.height)
//            make.top.equalTo(currentPriceLabel.snp.bottom)
//        }
//
//        containerView.addSubview(discountLabel)
//        discountLabel.snp.makeConstraints { make in
//            make.leading.equalTo(oldValueLabel.snp.trailing).offset(2)
//            make.width.equalTo(infoLabel.snp.width)
//            make.height.equalTo(currentPriceLabel.snp.height)
//            make.top.equalTo(currentPriceLabel.snp.bottom)
//        }
        
        containerView.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.leading.equalTo(currentPriceLabel.snp.leading)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.top.equalTo(currentPriceLabel.snp.bottom)
            make.height.equalTo(infoLabel.snp.height).multipliedBy(0.4)
        }
        
    }
}
