//
//  MasterViewController.swift
//  Stretch My Header
//
//  Created by Adam Goldberg on 2015-11-03.
//  Copyright © 2015 Adam Goldberg. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    
    @IBOutlet var picHeaderView: UIImageView!
    
    let kTableHeaderHeight:CGFloat = 215
    
    
//    var aNews = NewsItem()
    var detailViewController: DetailViewController? = nil
    var objects = [AnyObject]()
    var newsItems = [NewsItem]()

    var shortDate: String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        return dateFormatter.stringFromDate(NSDate())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
            
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 75
        
        
        let dateLabel = (UILabel.init(frame: CGRectMake(20, 20, 200, 100)))
        dateLabel.text = shortDate
        dateLabel.textColor = UIColor.whiteColor()
        
        tableView.tableHeaderView = nil
        
        tableView.contentInset = (UIEdgeInsetsMake(kTableHeaderHeight, 0, 0, 0))
        tableView.contentOffset.y = -kTableHeaderHeight
            
        picHeaderView.addSubview(dateLabel)
            
        tableView.addSubview(picHeaderView)
            
            
        updateHeaderView()
            
            

        let first = NewsItem(newCategory: .World, newHeadline: "Climate change protests, divestments meet fossil fuels realities")
            newsItems.append(first)
        let second = NewsItem(newCategory: .Europe, newHeadline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'")
            newsItems.append(second)
        let third = NewsItem(newCategory: .MiddleEast, newHeadline: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
            newsItems.append(third)
        let fourth = NewsItem(newCategory: .Africa, newHeadline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
            newsItems.append(fourth)
        let fifth = NewsItem(newCategory: .AsiaPacific, newHeadline: "Despite UN ruling, Japan seeks backing for whale hunting")
            newsItems.append(fifth)
        let sixth = NewsItem(newCategory: .Americas, newHeadline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
            newsItems.append(sixth)
        let seventh = NewsItem(newCategory: .World, newHeadline: "South Africa in $40 billion deal for Russian nuclear reactors")
            newsItems.append(seventh)
        let eighth = NewsItem(newCategory: .Europe, newHeadline: "'One million babies' created by EU student exchanges")
            newsItems.append(eighth)
        }
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func insertNewObject(sender: AnyObject) {
        objects.insert(NSDate(), atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    
    func updateHeaderView() {
       // print( tableView.contentOffset.y, picHeaderView.frame)
        picHeaderView.frame.origin.y = -kTableHeaderHeight
        picHeaderView.frame.size.height = kTableHeaderHeight
        
        
        let extraHeight = -tableView.contentOffset.y - kTableHeaderHeight - 20
        if (extraHeight > 0) {
            picHeaderView.frame.size.height = kTableHeaderHeight + extraHeight
            picHeaderView.frame.origin.y = -kTableHeaderHeight - extraHeight
        }
        //picHeaderView.frame.size.height = abs(tableView.contentOffset.y)
        
    }

    // MARK: - Segues

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showDetail" {
//            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let object = objects[indexPath.row] as! NSDate
//                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
//                controller.detailItem = object
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return newsItems.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> CustomCell {

        
        let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
        
        let newsItemAtRow = newsItems[indexPath.row]
        let color = newsItemAtRow.category.getColor()


        cell.categoryLabel.text = newsItemAtRow.category.rawValue
        cell.headlineLabel.text = newsItemAtRow.headline
        cell.categoryLabel.textColor = color
        
        return cell
        
    }
    

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

