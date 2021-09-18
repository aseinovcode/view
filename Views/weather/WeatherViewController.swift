//
//  WeatherViewController.swift
//  Views
//
//  Created by Zalkar on 16/9/21.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {
    
    private lazy var layer: CAGradientLayer = {
        let grad = CAGradientLayer()
        grad.frame = view.bounds
        grad.colors = [
            UIColor(red: 0.278, green: 0.749, blue: 0.875, alpha: 1).cgColor,
            UIColor(red: 0.291, green: 0.569, blue: 1, alpha: 1).cgColor
          ]
        return grad
    }()
    
    private lazy var thisWeek: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 0, y: 0, width: 123, height: 153)
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "На этой неделе"
        label.layer.masksToBounds = false
        label.textAlignment = .left
        return label
    }()
    
    private lazy var today: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.frame = CGRect(x: 0, y: 0, width: 123, height: 153)
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Сегодня"
        label.layer.masksToBounds = false
        label.textAlignment = .left
        return label
    }()
    
    private lazy var april: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 123, height: 153)
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "Апр, 26"
        label.layer.masksToBounds = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var accu: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.frame = CGRect(x: 0, y: 0, width: 123, height: 153)
        label.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
        label.layer.shadowOpacity = 1
        label.layer.shadowRadius = 1
        label.layer.shadowOffset = CGSize(width: -2, height: 3)
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.text = "AccuWeather"
        label.layer.masksToBounds = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var image: UIImageView = {
        let img = UIImage(named: "sun")
        let image = UIImageView(image: img)
        return image
    }()
    
    private lazy var calendar: UIImageView = {
        let img = UIImage(named: "calendar")
        let image = UIImageView(image: img)
        return image
    }()
    
    
    
    private lazy var tbView: UITableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .clear
        view.register(cellWithClass: WeatherCollectionViewCell.self)
        view.layer.cornerRadius = 5
        return view
    }()

    var table: [Model] = []
    
    var collData: [Model2] = []
    
    
    func loadTableView() {
        table.append(Model(data: "Апр, 7", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        table.append(Model(data: "Апр, 7", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        table.append(Model(data: "Апр, 7", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        table.append(Model(data: "Апр, 7", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        table.append(Model(data: "Апр, 7", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        table.append(Model(data: "Апр, 7", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        table.append(Model(data: "Апр, 7", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
    }
    
    func loadCollView() {
        collData.append(Model2(data: "15.00", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        
        collData.append(Model2(data: "15.00", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        
        collData.append(Model2(data: "15.00", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        
        collData.append(Model2(data: "15.00", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        
        collData.append(Model2(data: "15.00", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        
        collData.append(Model2(data: "15.00", celcius: "21°", urlImage: "https://e7.pngegg.com/pngimages/72/265/png-clipart-cloud-icon-sun-clouds-weather-icon-text-camera-icon.png"))
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }
    
    
    func setupUI() {
        
        view.layer.addSublayer(layer)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "setting"),
            style: .done,
            target: self,
            action: nil)
        
        loadTableView()
        loadCollView()
        
        view.addSubview(thisWeek)
        thisWeek.snp.makeConstraints{ (make) in
            make.bottom.equalTo(view).offset(-446)
            make.width.equalTo(193)
            make.height.equalTo(37)
            make.left.equalTo(view).offset(30)
        }
        
        
        view.addSubview(tbView)
        tbView.snp.makeConstraints{ (make) in
            make.top.equalTo(thisWeek.snp.bottom).offset(10)
            make.right.equalTo(view).offset(-30)
            make.left.equalTo(view).offset(30)
            make.bottom.equalTo(view).offset(-110)
        }
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints{ (make) in
            make.bottom.equalTo(thisWeek.snp.top).offset(-51)
            make.width.equalTo(330)
            make.height.equalTo(155)
            make.centerX.equalTo(view)
            make.right.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(10)
        }
        
        view.addSubview(today)
        today.snp.makeConstraints{(make) in
            make.left.equalToSuperview().offset(30)
            make.bottom.equalTo(collectionView.snp.top).offset(-45)
            make.width.equalTo(102)
            make.height.equalTo(37)
        }
        
        view.addSubview(april)
        april.snp.makeConstraints{(make) in
            make.right.equalToSuperview().offset(-23)
            make.bottom.equalTo(collectionView.snp.top).offset(-48)
            make.width.equalTo(64)
            make.height.equalTo(28)
        }
        
        view.addSubview(accu)
        accu.snp.makeConstraints{ (make) in
            make.bottom.equalToSuperview().offset(-27)
            make.right.equalToSuperview().offset(-133)
            make.left.equalToSuperview().offset(173)
            make.width.equalTo(108)
            make.height.equalTo(28)
        }
        
        view.addSubview(image)
        image.snp.makeConstraints{ (make) in
            make.bottom.equalToSuperview().offset(-30)
            make.right.equalTo(accu.snp.left).offset(-17)
            make.width.equalTo(22)
            make.height.equalTo(22)
        }
        
        view.addSubview(calendar)
        calendar.snp.makeConstraints{ (make) in
            make.bottom.equalTo(view).offset(-455)
            make.right.equalToSuperview().offset(-32)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        

    }

}

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let load = self.table[indexPath.row]
        let cell = WeatherTableViewCell()
        cell.fill(model: load)
        tableView.backgroundColor = .clear
        cell.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    
}



extension WeatherViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 70, height: 155)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let load = self.collData[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withClass: WeatherCollectionViewCell.self, for: indexPath)
        
        cell.loadData(model: load)
        
        collectionView.backgroundColor = .clear
        cell.backgroundColor = .clear
        
        return cell
    }
    
    
    

    

    
    
}
