//
//  Downloads.swift
//  QuotePro
//
//  Created by Carl Udren on 2/17/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

import Foundation
import Nuke

class Downloads {
    
    static let sharedInstance = Downloads()
    
    func getImage(URLString: String, completion: (image: UIImage?)-> Void) {
        var request = ImageRequest(URL: NSURL(string: URLString)!)
        request.targetSize = CGSize(width: 200, height: 200)
        
        Nuke.taskWith(request) { response in
            let image = response.image
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(image: image)

            })
            }.resume()
        
    }
    
    func getQuote(URLString: String, completion: (quote: String?, author: String?) -> Void) {
        let session = NSURLSession.sharedSession()
        let URL = NSURL(string: URLString)!
        let request = NSURLRequest(URL: URL)
        session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            var result = [String:String]()
            do {
                result = try NSJSONSerialization.JSONObjectWithData(data! , options: [] ) as! [String:String]
            }
            catch _ { }
            let quote = result["quoteText"]
            let author = result["quoteAuthor"]
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                completion(quote: quote, author: author)
            })
        }
    }
    
    }


