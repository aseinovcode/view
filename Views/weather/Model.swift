//
//  Model.swift
//  Views
//
//  Created by Zalkar on 16/9/21.
//

import Foundation

class Model {
    var data: String
    var celcius: String
    var urlImage: String
    
    init(data: String, celcius: String, urlImage: String) {
        self.data = data
        self.celcius = celcius
        self.urlImage = urlImage
    }
}
