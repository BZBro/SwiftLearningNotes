//
//  MydailyViewController.swift
//  NoWait
//
//  Created by ZBin on 15/11/3.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit
import CoreData
class MydailyViewController: UITableViewController,UISearchBarDelegate{

    let lightBrown:UIColor = UIColor(red: 224.9/255, green: 207.4/255, blue: 149.4/255 , alpha: 0.57)
    let nightModeColor:UIColor = UIColor.blackColor()
    
        var searchResult = false
    
        var Dailys = [MyDaily]()
    
        var timer: NSTimer?
    
        var timer1:NSTimer?
        
        var myID:NSNumber?
        
        var managedObjectContext: NSManagedObjectContext!
        
        @IBAction func logout(sender: AnyObject) {
            insertBlurView(view, style: UIBlurEffectStyle.Light)
            let indivoView  = MAActivityIndicatorView()
            waitProcess(view, indicatorView: indivoView)
            timer1 = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(MydailyViewController.Perform), userInfo: nil, repeats: false)
        }
        func Perform(){
            timer1?.invalidate()
            performSegueWithIdentifier("BackToLogin", sender: nil)
        }
        @IBAction func nightMode(){
            let Day:Bool = NSUserDefaults.standardUserDefaults().boolForKey("NIGHT")
            if Day {
               NSUserDefaults.standardUserDefaults().setBool(false, forKey: "NIGHT")
               tableView.backgroundColor = nightModeColor
               UINavigationBar.appearance().barTintColor = UIColor.blackColor()
               UITabBar.appearance().barTintColor = UIColor.blackColor()
               self.navigationItem.leftBarButtonItem?.image = UIImage(named: "sun")
               navigationController?.setNeedsStatusBarAppearanceUpdate()
               self.performSegueWithIdentifier("JustNull", sender: nil)
            }else{
               self.DayMode()
               self.navigationItem.leftBarButtonItem?.image = UIImage(named: "MOON")
            }
        }
        func DayMode(){
            UITabBar.appearance().barTintColor = UIColor.whiteColor()
            UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "NIGHT")
            UITabBar.appearance().backgroundColor = UIColor(white: 0.8, alpha: 0.8)
            tableView.backgroundColor = lightBrown
            tableView.indicatorStyle = UIScrollViewIndicatorStyle.White
            self.performSegueWithIdentifier("JustNull", sender: nil)
        }
    
        var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
        
        /// MARK: - Life Cycle Methods
    
        override func viewDidLoad() {
            super.viewDidLoad()
            LoadMode()
            let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
            print("\(paths[0])")
            let nibCell = UINib(nibName: "DailyTableViewCell", bundle: nil)
            tableView.registerNib(nibCell, forCellReuseIdentifier: "DailyCell")
            //NSFetchrequestController
            let fetchRequsetC:NSFetchRequest = NSFetchRequest(entityName: "MyDaily")
            fetchRequsetC.predicate = NSPredicate(format: "myID == %@", myID!)
            let sorter:NSSortDescriptor = NSSortDescriptor(key: "myDate", ascending: false)
            fetchRequsetC.sortDescriptors = [sorter]
            
            fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequsetC, managedObjectContext: self.managedObjectContext, sectionNameKeyPath: "month", cacheName: nil)
            
            fetchedResultsController.delegate = self
            
            do{
                try fetchedResultsController.performFetch()
            }catch{
                fatalError()
            }
        }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            
        }
        override func viewWillAppear(animated: Bool) {
            
        }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        let fetch = NSFetchRequest(entityName: "MyDaily")
        fetch.predicate = NSPredicate(format: "myDaily == %@ || myDate == %@ || month == %@", searchBar.text!,searchBar.text!,searchBar.text!)
        do {
            let tempdaily = try managedObjectContext.executeFetchRequest(fetch) as! [MyDaily]
            if !tempdaily.isEmpty{
                searchResult = true
                Dailys = tempdaily
                tableView.reloadData()
                print("sdgsdgsdfsdfhsdfh")
            }
            
        } catch {
            fatalError()
        }
    }
        func LoadMode(){
            let Day:Bool = NSUserDefaults.standardUserDefaults().boolForKey("NIGHT")
            if Day {
                UITabBar.appearance().barTintColor = UIColor.whiteColor()
                UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
                NSUserDefaults.standardUserDefaults().setBool(true, forKey: "NIGHT")
                tableView.backgroundColor = lightBrown
                tableView.indicatorStyle = UIScrollViewIndicatorStyle.White
                view.setNeedsDisplay()
                view.setNeedsLayout()
                self.navigationItem.leftBarButtonItem?.image = UIImage(named: "MOON")
            }else{
                UITabBar.appearance().barTintColor = UIColor.blackColor()
                UINavigationBar.appearance().barTintColor = UIColor.blackColor()
                NSUserDefaults.standardUserDefaults().setBool(false, forKey: "NIGHT")
                tableView.backgroundColor = nightModeColor
                self.navigationItem.leftBarButtonItem?.image = UIImage(named: "sun")
                view.setNeedsDisplay()
                view.setNeedsLayout()
            }
        }
        // MARK: - Navigation
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
            if segue.identifier == "ToEDITVC"{
                
                let tempday:Bool = NSUserDefaults.standardUserDefaults().boolForKey("NIGHT")
                
                NSUserDefaults.standardUserDefaults().setBool(!tempday, forKey: "NIGHT")
            }
            
            
            if segue.identifier == "BackToLogin"{
                
                NSUserDefaults.standardUserDefaults().setBool(false, forKey: "Login")
                
                let firstVC = segue.destinationViewController as! FirstViewController
                
                firstVC.managementObject = managedObjectContext
                
            }
            if segue.identifier == "ToLookupVC"{
            
                let navController = segue.destinationViewController as! UINavigationController
                
                let dailyDetailVC = navController.viewControllers[0] as! LookupViewController
                let index = tableView.indexPathForSelectedRow
                
                let daily = fetchedResultsController.objectAtIndexPath(index!) as! MyDaily
                
                dailyDetailVC.currentDaily = daily 
            
            }
            if segue.identifier == "JustNull"{
                let nullVC = segue.destinationViewController as! JustNullViewController
                nullVC.myID = myID
                nullVC.managementObjectNull = managedObjectContext
            }
            
        }
    
        override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            if searchResult{
                return Dailys.count
            }else{
                return fetchedResultsController.sections!.count
            }
        }
    

        override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
            return 130
        }
    
        override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                let fetchedResultsInfo = fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
                
                return fetchedResultsInfo.numberOfObjects
        }
        
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("DailyCell") as! DailyTableViewCell
            
            let mydaily = fetchedResultsController.objectAtIndexPath(indexPath) as! MyDaily
            let textLeftContraint = NSLayoutConstraint(item: cell, attribute: NSLayoutAttribute.LeftMargin, relatedBy: NSLayoutRelation.Equal, toItem: cell.contentView, attribute: NSLayoutAttribute.LeftMargin, multiplier: 1.0, constant: 0.0)
            let textRightContraint = NSLayoutConstraint(item: cell, attribute: NSLayoutAttribute.RightMargin, relatedBy: NSLayoutRelation.Equal, toItem: cell.contentView, attribute: NSLayoutAttribute.RightMargin, multiplier: 1.0, constant: 0.0)
            cell.addConstraints([textLeftContraint,textRightContraint])
            let day = NSUserDefaults.standardUserDefaults().boolForKey("NIGHT")
            if day {
                cell.dateLabel.textColor = UIColor.blackColor()
                cell.BackGroundImage.image = UIImage(named: "BACKWARM")
                tableView.separatorColor = UIColor.blackColor()
            }else{
                cell.dateLabel.textColor = UIColor(white: 1, alpha: 0.8)
                cell.BackGroundImage.image = UIImage(named: "BACKNIGHT")
                tableView.separatorColor = UIColor(white: 1, alpha: 0.8)
            }
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
        
         override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
                let info = fetchedResultsController.sections![section]
                
                // 大写字母显示section名字
                return info.name.uppercaseString
         }
         override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
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
            
                performSegueWithIdentifier("ToLookupVC", sender: nil)
            
            
                tableView.deselectRowAtIndexPath(indexPath, animated: true)
        }

}
extension MydailyViewController:NSFetchedResultsControllerDelegate{
        
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        print("** Table View Begin Update **")
        tableView.beginUpdates()
    }
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch type {
        case NSFetchedResultsChangeType.Insert:
            print("NSFetchedResultsChangeType insert (object)")
            
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
            
        case NSFetchedResultsChangeType.Delete:
            print("NSFetchedResultsChangeType delete (object)")
            
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
            
        case NSFetchedResultsChangeType.Update:
            print("NSFetchedResultsChangeType update (object)")
            
            let location = fetchedResultsController.objectAtIndexPath(indexPath!) as! MyDaily
            let cell = tableView.cellForRowAtIndexPath(indexPath!) as! DailyTableViewCell
            
            cell.showDetail(location)
            
        case NSFetchedResultsChangeType.Move:
            print("NSFetchedResultsChangeType move (object)")
            
            tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
            tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: UITableViewRowAnimation.Fade)
            
        }
    }
    
    func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
        switch type {
        case NSFetchedResultsChangeType.Insert:
            print("NSFetchedResultsChangeType insert (section)")
            tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: UITableViewRowAnimation.Fade)
            
        case NSFetchedResultsChangeType.Delete:
            print("NSFetchedResultsChangeType delete (section)")
            
            tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: UITableViewRowAnimation.Automatic)
            
        case NSFetchedResultsChangeType.Update:
            print("NSFetchedResultsChangeType update (section)")
        case NSFetchedResultsChangeType.Move:
            print("NSFetchedResultsChangeType move (section)")
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        print("** Table View End Update **")
        
        tableView.endUpdates()
    }
    
    
}
