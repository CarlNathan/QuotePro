//
//  QuoteObject.swift
//  QuotePro
//
//  Created by Carl Udren on 2/17/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

import Foundation
import RealmSwift

class QuoteObject: Object {
    
    var quote: String!
    var author: String!
    var imageURLString: String!
    var image: UIImage?
    
    init(imageString: String, author: String, quote: String) {
        super.init()
        self.imageURLString = imageString
        self.author = author
        self.quote = quote
    }

    required init() {
        fatalError("init() has not been implemented")
    }

    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
}
