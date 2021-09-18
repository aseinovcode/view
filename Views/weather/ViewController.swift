//
//  ViewController.swift
//  Views
//
//  Created by Zalkar on 13/9/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    private lazy var layer: CAGradientLayer = {
        let grad = CAGradientLayer()
        grad.frame = view.bounds
        grad.colors = [
            UIColor(red: 0.278, green: 0.749, blue: 0.875, alpha: 1).cgColor,
            UIColor(red: 0.291, green: 0.569, blue: 1, alpha: 1).cgColor
          ]
        return grad
    }()
    
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Прогноз на неделю   ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: -2.0, height: 2.0)
        button.layer.shadowOpacity = 10.0
        button.layer.shadowRadius = 5.0
        button.layer.masksToBounds = false
        button.layer.cornerRadius = 18
        let btbimage = UIImage(named: "vector")
        button.setImage(btbimage, for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.sizeToFit()
        button.addTarget(self, action: #selector(weekTapped), for: .touchUpInside)
        return button
    }()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3).cgColor
        label.layer.cornerRadius = 20
        label.layer.borderWidth = 4
        label.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3).cgColor
        return label
    }()
    
    private lazy var celciusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 100)
        label.frame = CGRect(x: 0, y: 0, width: 123, height: 153)
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2.0, height: 3.0)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "22"
        label.layer.masksToBounds = false
        return label
    }()
    
    private lazy var celciusZeroLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 72)
        label.frame = CGRect(x: 0, y: 0, width: 123, height: 153)
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2.0, height: 3.0)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "°"
        label.layer.masksToBounds = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var todayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 0, y: 0, width: 123, height: 153)
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Солнечно"
        label.layer.masksToBounds = false
        return label
    }()
    
    private lazy var dataLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 123, height: 153)
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Сегодня, 26 Апрель"
        label.layer.masksToBounds = false
        return label
    }()
    
    private let customView: UILabel = {
        let view = UILabel()
        view.text = "Бишкек"
        view.textAlignment = .left
        view.font = UIFont.boldSystemFont(ofSize: 24)
        view.frame = CGRect(x: 0, y: 0, width: 90, height: 37)
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 1
        view.layer.shadowOffset = CGSize(width: -2, height: 3)
        view.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.masksToBounds = false
        return view
    }()
    
//    private lazy var location: UIImageView = {
//        let img = UIImage(named: "location")
//        let image = UIImageView(image: img)
//        return image
//    }()
    
//    private lazy var sunny: UIImageView = {
//        let img = UIImage(named: "sunny")
//        let image = UIImageView(image: img)
//        image.backgroundColor = .clear
//        return image
//    }()
    
    private lazy var eclipse: UIImageView = {
        let img = UIImage(named: "eclipse")
        let image = UIImageView(image: img)
        image.backgroundColor = .clear
        return image
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(layer)
        setupUI()
    
    }


    func setupUI(){
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.prefersLargeTitles = true

        navigationItem.leftBarButtonItems = [
            UIBarButtonItem(
                image: UIImage(named: "location"),
                style: .plain,
                target: self,
                action: nil
            ),
            UIBarButtonItem(customView: customView),
            UIBarButtonItem(
                image: UIImage(named: "arrowdown"),
                style: .done,
                target: self,
                action: nil)
        ]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "notify"),
            style: .done,
            target: self,
            action: #selector(notifyTap))
        
        view.addSubview(button)
        button.snp.makeConstraints{ (make) in
            make.width.equalTo(249)
            make.height.equalTo(64)
            make.bottom.equalTo(view).offset(-36)
            make.left.equalTo(view).offset(83)
        }
        
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints{ (make) in
            make.width.equalTo(353)
            make.height.equalTo(335)
            make.bottom.equalTo(view).offset(-200)
            make.left.equalTo(view).offset(31)
        }
        
        view.addSubview(celciusLabel)
        celciusLabel.snp.makeConstraints{ (make) in
            make.width.equalTo(123)
            make.height.equalTo(153)
            make.top.equalTo(mainLabel.snp.top).offset(31)
            make.left.equalTo(mainLabel.snp.left).offset(107)
        }
        
        view.addSubview(celciusZeroLabel)
        celciusZeroLabel.snp.makeConstraints{ (make) in
            make.width.equalTo(30)
            make.height.equalTo(110)
            make.top.equalTo(mainLabel.snp.top).offset(42)
            make.left.equalTo(celciusLabel.snp.right).offset(6)
        }
        
        view.addSubview(todayLabel)
        todayLabel.snp.makeConstraints{ (make) in
            make.width.equalTo(123)
            make.height.equalTo(37)
            make.top.equalTo(mainLabel.snp.top).offset(168)
            make.left.equalTo(mainLabel.snp.left).offset(114)
        }
        
        view.addSubview(dataLabel)
        dataLabel.snp.makeConstraints{ (make) in
            make.width.equalTo(175)
            make.height.equalTo(28)
            make.top.equalTo(mainLabel.snp.top).offset(17)
            make.left.equalTo(mainLabel.snp.left).offset(93)
        }
        
        view.addSubview(eclipse)
        eclipse.snp.makeConstraints{ (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(mainLabel.snp.top).offset(-72)
            make.width.equalTo(195)
            make.height.equalTo(195)
        }
        
//        view.addSubview(sunny)
//        sunny.snp.makeConstraints{ (make) in
//            make.right.equalTo(eclipse.snp.right).offset(-10)
//            make.left.equalTo(eclipse.snp.left).offset(10)
//            make.top.equalTo(eclipse.snp.top).offset(10)
//            make.bottom.equalTo(eclipse.snp.top).offset(-10)
//            make.width.equalTo(96)
//            make.height.equalTo(96)
//        }
        
//        view.addSubview(location)
//        location.snp.makeConstraints{ (make) in
//            make.width.equalTo(18)
//            make.height.equalTo(21)
//            make.top.equalToSuperview().offset(21)
//            make.left.equalToSuperview().offset(34)
//        }
    }
    
    @objc func weekTapped() {
        navigationController?.pushViewController(WeatherViewController(), animated: true)
    }
    
    @objc func notifyTap(){
        navigationController?.pushViewController(TravelViewController(), animated: true)
    }
}




