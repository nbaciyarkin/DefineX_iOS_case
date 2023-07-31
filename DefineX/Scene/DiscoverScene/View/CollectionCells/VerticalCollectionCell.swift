//
//  VerticalCollectionCell.swift
//  DefineX
//
//  Created by Yarkın Gazibaba on 30.07.2023.
//

import Foundation
import SnapKit
import UIKit

class VerticalCollectionCell: UICollectionViewCell {
    static let identifier = "VerticalCollectionCell"
    
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
    
    private let rateIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "rate_icon")
        return imageView
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
        containerView.backgroundColor = .clear
        //setUIWithOldPrice()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setData() {
        
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
        imageView.sd_setImage(with: questionImageURL, completed: nil)
        infoLabel.text = title
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 2, bottom: 0, right: 2))
       }
    
    func setUI() {
        contentView.snp.removeConstraints()
        imageView.snp.removeConstraints()
        containerView.snp.removeConstraints()
        infoLabel.snp.removeConstraints()
        currentPriceLabel.snp.removeConstraints()
        bottomStackView.snp.removeConstraints()
        rateIconView.snp.removeConstraints()
        
        contentView.addSubview(imageView)
        self.contentView.sendSubviewToBack(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.leading.equalTo(contentView.snp.leading).offset(8)
            make.height.equalTo(196)
            make.trailing.equalTo(contentView.snp.trailing).offset(-8)
        }
        
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.width.equalTo(imageView.snp.width)
            make.leading.equalTo(imageView.snp.leading).offset(1)
        }
        
        containerView.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.width.equalTo(containerView.snp.width)
            make.height.equalTo(40)
        }
        containerView.addSubview(rateIconView)
        rateIconView.snp.makeConstraints { make in
            make.leading.equalTo(infoLabel.snp.leading).offset(1)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.bottom.equalTo(containerView.snp.bottom)
            make.height.equalTo(16)
        }
        
        self.currentPriceLabel.font = UIFont(name: "Roboto-Medium", size: 20)
        containerView.addSubview(currentPriceLabel)
        currentPriceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(rateIconView.snp.top)
            make.width.equalTo(containerView.snp.width)
            make.height.equalTo(26)
        }
    }
    
    func setUIWithOldPrice(){
        contentView.snp.removeConstraints()
        imageView.snp.removeConstraints()
        containerView.snp.removeConstraints()
        infoLabel.snp.removeConstraints()
        currentPriceLabel.snp.removeConstraints()
        bottomStackView.snp.removeConstraints()
        rateIconView.snp.removeConstraints()
        
        contentView.addSubview(imageView)
        self.contentView.sendSubviewToBack(imageView)
        imageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(8)
            make.leading.equalTo(contentView.snp.leading).offset(8)
            make.height.equalTo(116)
            make.trailing.equalTo(contentView.snp.trailing).offset(-8)
        }
        
        contentView.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.width.equalTo(imageView.snp.width)
            make.leading.equalTo(imageView.snp.leading).offset(1)
        }
        
        containerView.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.top)
            make.width.equalTo(containerView.snp.width)
            make.height.equalTo(40)
        }
        
        containerView.addSubview(currentPriceLabel)
        currentPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(infoLabel.snp.bottom).offset(8)
            make.width.equalTo(containerView.snp.width)
            make.height.equalTo(18)
        }
        
        containerView.addSubview(bottomStackView)
        bottomStackView.snp.makeConstraints { make in
            make.leading.equalTo(currentPriceLabel.snp.leading).offset(1)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.top.equalTo(currentPriceLabel.snp.bottom)
            make.height.equalTo(16)
        }
        
        containerView.addSubview(rateIconView)
        rateIconView.snp.makeConstraints { make in
            make.leading.equalTo(infoLabel.snp.leading).offset(1)
            make.width.equalToSuperview().multipliedBy(0.7)
            make.bottom.equalTo(containerView.snp.bottom)
            make.height.equalTo(16)
        }
    }
}
