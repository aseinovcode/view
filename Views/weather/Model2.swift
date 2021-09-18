//
//  Model2.swift
//  Views
//
//  Created by Zalkar on 17/9/21.
//

import Foundation

class Model2 {
    var hour: String
    var celcius: String
    var urlImage: String
    
    init(data: String, celcius: String, urlImage: String) {
        self.hour = data
        self.celcius = celcius
        self.urlImage = urlImage
    }
}
