//
//  TravelViewController.swift
//  Views
//
//  Created by Zalkar on 18/9/21.
//

import UIKit

class TravelViewController: UIViewController {
    
    private lazy var title1: UILabel = {
        let view = UILabel()
        view.text = "Путешествуйте \n Почувствуйте прилив энергии"
        view.textColor = .black
        view.font = UIFont.boldSystemFont(ofSize: 24)
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()
    
    private lazy var subTitle: UILabel = {
        let view = UILabel()
        view.text = "Мы поможем вам исследовать, сравнить и \n забронировать впечатления - все в одном \n месте."
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 14)
        view.textAlignment = .center
        view.numberOfLines = 3
        return view
    }()
    
    private lazy var search: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.backgroundColor = .white
        return search
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collect = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collect.delegate = self
        collect.dataSource = self
        collect.register(cellWithClass: TravelViewCell.self)
        view.layer.cornerRadius = 5
        return collect
    }()
    
    var TravelModel: [Model3] = []
    
    func loadTravelData() {
        
        TravelModel.append(Model3(city: "Bishkek", urlImage: "https://upload.wikimedia.org/wikipedia/commons/4/47/New_york_times_square-terabass.jpg"))
        
        TravelModel.append(Model3(city: "Bishkek", urlImage: "https://upload.wikimedia.org/wikipedia/commons/4/47/New_york_times_square-terabass.jpg"))
        
        TravelModel.append(Model3(city: "Bishkek", urlImage: "https://upload.wikimedia.org/wikipedia/commons/4/47/New_york_times_square-terabass.jpg"))
        
        TravelModel.append(Model3(city: "Bishkek", urlImage: "https://upload.wikimedia.org/wikipedia/commons/4/47/New_york_times_square-terabass.jpg"))
        
        TravelModel.append(Model3(city: "Bishkek", urlImage: "https://upload.wikimedia.org/wikipedia/commons/4/47/New_york_times_square-terabass.jpg"))
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    func setupUI() {
        
        loadTravelData()
        
        view.backgroundColor = .systemGray6
        
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(title1)
        view.addSubview(subTitle)
        view.addSubview(search)
        view.addSubview(collectionView)
        
        title1.snp.makeConstraints{ (make) in
            make.width.equalTo(view.frame.width)
            make.height.equalTo(60)
            make.top.equalToSuperview().offset(58)
        }
        
        subTitle.snp.makeConstraints{ (make) in
            make.width.equalTo(view.frame.width)
            make.height.equalTo(60)
            make.top.equalTo(title1.snp.bottom).offset(11)
        }
        
        search.snp.makeConstraints {
            $0.top.equalTo(subTitle.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.height.equalTo(40)
        }
        
        collectionView.snp.makeConstraints{ (make) in
            make.top.equalTo(search.snp.bottom).offset(27)
            make.right.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
 

}

extension TravelViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let load = self.TravelModel[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withClass: TravelViewCell.self, for: indexPath)
        
        cell.loadTravelData(model: load)
        
        collectionView.backgroundColor = .clear
        cell.backgroundColor = .clear
        
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 354, height: 230)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TravelModel.count
    }



}
