//
//  CurrenLocationViewController.swift
//  MyLocations
//
//  Created by RainGu on 15/8/19.
//  Copyright © 2015年 RainGu. All rights reserved.
//

import UIKit
import CoreData

class CurrenLocationViewController: UITableViewController {
    
    
    var timer: NSTimer?
    
    var myID:NSNumber?
    
    var managedObjectContext: NSManagedObjectContext!
    
    let cellidentifier = "dailyCell"
    
    
    @IBOutlet weak var searchBar: UISearchBar!

    @IBAction func logout(sender: AnyObject) {
        NSUserDefaults.standardUserDefaults().setBool(false, forKey: "Login")
        performSegueWithIdentifier("BackToLogin", sender: nil)
        
    }
   
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
    
    /// MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("dddddddddddddd4\(myID)")
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        print("\(paths[0])")
        
        
        
        //NSFetchrequestController
        
        let fetchRequsetC:NSFetchRequest = NSFetchRequest(entityName: "MyDaily")
        let sorter:NSSortDescriptor = NSSortDescriptor(key: "myDate", ascending: true)
        fetchRequsetC.sortDescriptors = [sorter]

        fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequsetC, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        do{
            try fetchedResultsController.performFetch()
        }catch{
            fatalError()
        }
       fetchedResultsController.delegate = self
       tableView.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "BackToLogin"{
            
            NSUserDefaults.standardUserDefaults().setBool(false, forKey: "Login")
            
            let firstVC = segue.destinationViewController as! FirstViewController
            
            firstVC.managementObject = managedObjectContext
 
        }
    }

}
extension CurrenLocationViewController{
    
}
extension CurrenLocationViewController{
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return fetchedResultsController.sections!.count
        return 2
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let fetchedResultsInfo = fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
        
        return fetchedResultsInfo.numberOfObjects
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellidentifier) as! DailyTableViewCell
        
        let mydaily = fetchedResultsController.objectAtIndexPath(indexPath) as! MyDaily
        
        cell.showDetail(mydaily)
        
        return cell
    }
   override  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
            let dai = fetchedResultsController.objectAtIndexPath(indexPath) as! MyDaily
            managedObjectContext.deleteObject(dai)
            do{
                try managedObjectContext.save()
            }catch{
                fatalError()
            }
        }
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
     }
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let info = fetchedResultsController.sections![section]
        
        // 大写字母显示section名字
        return info.name.uppercaseString
    }
   override  func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleLabel = UILabel(frame: CGRect(x: 15, y: 2, width: tableView.bounds.width - 30, height: 22))
        titleLabel.font = UIFont.systemFontOfSize(14)
        titleLabel.textColor = UIColor(white: 1, alpha: 0.5)
        titleLabel.text = tableView.dataSource?.tableView!(tableView, titleForHeaderInSection: section)
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 22))
        
        headerView.backgroundColor = UIColor(white: 1, alpha: 0.2)
        
        headerView.addSubview(titleLabel)
        
        return headerView
    }
    
   override  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}
extension CurrenLocationViewController:NSFetchedResultsControllerDelegate{
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        print("** Table View Begin Update **")
        self.tableView.beginUpdates()
    }
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type{
        case NSFetchedResultsChangeType.Insert:
            print("NSFetchedResultsChangeType insert (object)")
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
        case NSFetchedResultsChangeType.Delete:
            print("NSFetchedResultsChangeType delete (object)")
            tableView.deleteRowsAtIndexPaths([newIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
        case NSFetchedResultsChangeType.Update:
            print("NSFetchedResultsChangeType update (object)")
            let dai = fetchedResultsController.objectAtIndexPath(indexPath!) as! MyDaily
            let cell = tableView.cellForRowAtIndexPath(indexPath!) as! DailyTableViewCell
            cell.showDetail(dai)
        case NSFetchedResultsChangeType.Move:
            print("NSFetchedResultsChangeType move (object)")
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
    }
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case NSFetchedResultsChangeType.Insert:
            print("NSFetchedResultsChangeType insert (section)")
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: UITableViewRowAnimation.Fade)
            
        case NSFetchedResultsChangeType.Delete:
            print("NSFetchedResultsChangeType delete (section)")
            
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: UITableViewRowAnimation.Fade)
            
        case NSFetchedResultsChangeType.Update:
            print("NSFetchedResultsChangeType update (section)")
            
        case NSFetchedResultsChangeType.Move:
            print("NSFetchedResultsChangeType move (section)")
        }
    }

    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        self.tableView.endUpdates()
        self.tableView.reloadData()
    }
}
}