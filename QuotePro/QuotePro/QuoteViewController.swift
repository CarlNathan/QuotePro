//
//  QuoteViewController.swift
//  QuotePro
//
//  Created by Carl Udren on 2/17/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

import UIKit

class QuoteViewController: UIView {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    var quoteObject: QuoteObject?
    

    required init?(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        NSBundle.mainBundle().loadNibNamed("QuoteViewController", owner: self, options: nil)
        self.addSubview(self);
        self.setUp()
    }
    
    init() {
        super.init(frame: UIScreen.mainScreen().bounds)
        self.setUp()
        
    }

    func setUp() {
        if let object = quoteObject {
            Downloads.sharedInstance.getImage(object.imageURLString ) { image in
                if let newImage = image {
                    self.imageView.image = newImage
                    object.image = newImage
                    
                }
            }
            Downloads.sharedInstance.getQuote(object.imageURLString, completion: { (quote, author) -> Void in
                self.quoteLabel.text = quote
                object.quote = quote
                self.authorLabel.text = author
                object.author = author
            })
            
        }

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
