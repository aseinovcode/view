//
//  WeatherTableViewCell.swift
//  Views
//
//  Created by Zalkar on 16/9/21.
//

import UIKit
import Kingfisher

class WeatherTableViewCell: BaseCell {

    private lazy var date: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 123, height: 153)
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2.0, height: 3.0)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.layer.masksToBounds = false
        label.textColor = UIColor.white
        label.textAlignment = .left
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
        label.textAlignment = .left
        return label
    }()
    
    private lazy var weatherImage: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = true
        view.backgroundColor = .clear
       
        return view
    }()
    
    override func addSubViews() {
        
        addSubview(date)
        date.snp.makeConstraints{ (make) in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(65)
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
            make.right.equalToSuperview().offset(-10)
            make.centerY.equalToSuperview()
            make.width.equalTo(27)
            make.height.equalTo(28)
        }
    }
    
    func fill(model: Model){
        date.text = model.data
        celcius.text = model.celcius
        weatherImage.kf.setImage(with: URL(string: model.urlImage))
    }


}
