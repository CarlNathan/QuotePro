//
//  ViewController.swift
//  QuotePro
//
//  Created by Carl Udren on 2/17/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    let quoteList = [QuoteObject]()

     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newButtonPressed(sender: AnyObject) {
        if let detailView = NSBundle.mainBundle().loadNibNamed("QuoteViewController", owner: self, options: nil).first as? QuoteViewController {
            detailView.frame = self.view.frame
            self.view.addSubview(detailView)
        }

    }
        //Mark TableView DataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quoteList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TableViewCell
        cell.quoteObject = quoteList[indexPath.row]
        return cell
    }

        //MARK TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let detailView = NSBundle.mainBundle().loadNibNamed("QuoteViewController", owner: self, options: nil).first as? QuoteViewController {
            detailView.frame = self.view.frame
            self.view.addSubview(detailView)
        }
    }

}

