//
//  WeatherCollectionViewCell.swift
//  Views
//
//  Created by Zalkar on 17/9/21.
//

import UIKit
import Kingfisher

class WeatherCollectionViewCell: UICollectionViewCell {
    
    private lazy var hours: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 123, height: 153)
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2.0, height: 3.0)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.layer.masksToBounds = false
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var celcius: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 123, height: 153)
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2.0, height: 3.0)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.layer.masksToBounds = false
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    private lazy var weatherImage: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
       
        return view
    }()
    
    func loadData(model: Model2){
        weatherImage.kf.setImage(with: URL(string: model.urlImage))
        celcius.text = model.celcius
        hours.text = model.hour
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    func setupUI() {
        
        addSubview(hours)
        hours.snp.makeConstraints{ (make) in
            make.bottom.equalToSuperview().offset(-5)
            make.centerX.equalToSuperview()
            make.width.equalTo(45)
            make.height.equalTo(28)
        }
        
        addSubview(weatherImage)
        weatherImage.snp.makeConstraints{ (make) in
            make.centerY.centerX.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        addSubview(celcius)
        celcius.snp.makeConstraints{ (make) in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview()
            make.width.equalTo(45)
            make.height.equalTo(28)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UICollectionView {
    func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError("Couldn`t find UICollectioinViewCell for \(String(describing: name)), make sure the cell is registered with collectionView")
        }
        return cell
    }
}
