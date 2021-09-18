//
//  TravelViewCell.swift
//  Views
//
//  Created by Zalkar on 18/9/21.
//

import Foundation
import UIKit
import Kingfisher

class TravelViewCell: UICollectionViewCell {
    
    private lazy var itemTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 24)
        return label
    }()
    
    private lazy var itemImage: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var blackView = UIView()
    
    func setGradientBackground() {
        blackView.layerGradient()
    }
    
    func loadTravelData(model: Model3){
        itemImage.kf.setImage(with: URL(string: model.urlImage))
        itemTitle.text = model.city
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setGradientBackground()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        addSubview(itemImage)
        addSubview(itemTitle)
        addSubview(blackView)
        itemImage.snp.makeConstraints{ (make) in
            make.edges.equalToSuperview()
        }
        
        bringSubviewToFront(blackView)
        bringSubviewToFront(itemTitle)
        
        blackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        itemTitle.snp.makeConstraints{ (make) in
            make.top.equalToSuperview().offset(37)
            make.centerX.equalToSuperview()
            make.height.equalTo(32)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UIView {
    func layerGradient() {
        let layer : CAGradientLayer = CAGradientLayer()
        layer.frame.size = self.frame.size
        layer.frame.origin = .init(x: 0, y: 0)
        layer.cornerRadius = CGFloat(frame.width / 20)

        let color0 = UIColor.black.withAlphaComponent(0.49).cgColor
        let color1 = UIColor.clear.cgColor
        layer.colors = [color0,color1]
        self.layer.insertSublayer(layer, at: 0)
    }
}
