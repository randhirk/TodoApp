//
//  FirstViewController.swift
//  To Do List
//
//  Created by Randhir Kumar on 2/20/16.
//  Copyright © 2016 @Randhir Kumar. All rights reserved.
//

import UIKit

var toDoList = [ToDoItem]()


class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, TableViewCellDelegate {

   
    
    @IBOutlet weak var toDoListTableView: UITableView!
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! TableViewCell
            //            cell.textLabel?.backgroundColor = UIColor.clearColor()
            
            cell.selectionStyle = .None
            let item = toDoList[indexPath.row]
            //            cell.textLabel?.text = item.text
            cell.delegate = self
            cell.toDoItem = item
            return cell
    
    }
    
    
    func toDoItemDeleted(toDoItem: ToDoItem) {
        // could use this to get index when Swift Array indexOfObject works
        // let index = toDoItems.indexOfObject(toDoItem)
        // in the meantime, scan the array to find index of item to delete
        var index = 0
        for i in 0..<toDoList.count {
            if toDoList[i] === toDoItem {  // note: === not ==
                index = i
                break
            }
        }
        // could removeAtIndex in the loop but keep it here for when indexOfObject works
        toDoList.removeAtIndex(index)
        let toDoListData = NSKeyedArchiver.archivedDataWithRootObject(toDoList)
        NSUserDefaults.standardUserDefaults().setObject(toDoListData, forKey: "toDoListData")

      //  NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList1")
        // use the UITableView to animate the removal of this row
        toDoListTableView.beginUpdates()
        let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
        toDoListTableView.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
        toDoListTableView.endUpdates()
    }
    
    // MARK: - Table view delegate
    
    func colorForIndex(index: Int) -> UIColor {
        let itemCount = toDoList.count - 1
        let val = (CGFloat(index) / CGFloat(itemCount)) * 0.6
        return UIColor(red: 1.0, green: val, blue: 0.0, alpha: 1.0)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) {
            cell.backgroundColor = colorForIndex(indexPath.row)
    }
    
    // support for versions of iOS prior to iOS 8
    func tableView(tableView: UITableView, heightForRowAtIndexPath
        indexPath: NSIndexPath) -> CGFloat {
            return tableView.rowHeight;
    }


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoListTableView.dataSource = self
        toDoListTableView.delegate = self
        toDoListTableView.registerClass(TableViewCell.self, forCellReuseIdentifier: "cell")
        toDoListTableView.separatorStyle = .None
        toDoListTableView.backgroundColor = UIColor.blackColor()
        toDoListTableView.rowHeight = 50;
        
        if toDoList.count > 0 {
            let toDoListData  = NSUserDefaults.standardUserDefaults().objectForKey("toDoListData") as? NSData
            
            let toDoArray  =     NSKeyedUnarchiver.unarchiveObjectWithData(toDoListData!) as? [ToDoItem]!
            
            
            if toDoArray != nil  {
                toDoList = toDoArray!

        }

        
        if toDoList.count < 0 {
            
            let toDoListData  = NSUserDefaults.standardUserDefaults().objectForKey("toDoListData") as? NSData

            let toDoArray  =     NSKeyedUnarchiver.unarchiveObjectWithData(toDoListData!) as? [ToDoItem]!
            
            
            if toDoArray != nil  {
                toDoList = toDoArray!
                
            }


        }
        else{
            
        }
        }

        
       
//        if NSUserDefaults.standardUserDefaults().objectForKey("toDoList1") != nil{
//        toDoList = NSUserDefaults.standardUserDefaults().objectForKey("toDoList1") as! [Arr]
//        }
    }
    
    override func viewDidAppear(animated: Bool) {
        self.toDoListTableView .reloadData()
    }
    
    

   

}

