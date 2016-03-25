//
//  SecondViewController.swift
//  To Do List
//
//  Created by Randhir Kumar on 2/20/16.
//  Copyright © 2016 @Randhir Kumar. All rights reserved.
//

import UIKit



class SecondViewController: UIViewController,UIPickerViewDataSource,UITextFieldDelegate,UIPickerViewDelegate{
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    @IBOutlet weak var ItemForTodoList: UITextField!
    
    @IBOutlet weak var dataUpdateLabel: UILabel!
    
    let pickerData = ["High","Medium","Low"]
    
    @IBAction func addCalendar(sender: AnyObject) {
        
        datePicker.hidden = false
    }
    @IBAction func addPriority(sender: AnyObject) {
        myPicker.hidden = false

        
    }
    @IBAction func addItem(sender: AnyObject) {
        
        toDoList.append(ToDoItem(text: ItemForTodoList.text!))
        
        let aStr = String(format: "%@%@", "ToDoList Updated: ", ItemForTodoList.text!)
        
      //  dataUpdateLabel.text = aStr
        
        ItemForTodoList.text = ""
        
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let encodedData = NSKeyedArchiver.archivedDataWithRootObject(toDoList)
        userDefaults.setObject(encodedData, forKey: "toDoListData")
        userDefaults.synchronize()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib. 
        myPicker.delegate = self
        myPicker.delegate = self
        myPicker.hidden = true
        datePicker.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        ItemForTodoList.resignFirstResponder()
        return true
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       // myLabel.text = pickerData[row]
    
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1;
        
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return pickerData.count;
    }

}

