//
//  TableViewCell.swift
//  QuotePro
//
//  Created by Carl Udren on 2/17/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
//    var totalSteps: Int = 0 {
//        willSet(newTotalSteps) {
//            print("About to set totalSteps to \(newTotalSteps)")
//        }
//        didSet {
//            if totalSteps > oldValue  {
//                print("Added \(totalSteps - oldValue) steps")
//            }
//        }
//    }
    
//    init?(coder aDecoder: NSCoder) {
//        
//    }
    
    var quoteObject: QuoteObject? {
        didSet(newQuote) {
            authorLabel.text = newQuote!.author
            quoteLabel.text = newQuote!.quote
        }
    }
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
