//
//  ViewController.swift
//  765497_Alisha_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var FirstNameTF: UITextField!
    @IBOutlet weak var LastNameTF: UITextField!
    @IBOutlet weak var IDTextField: UITextField!
    var StuDelegate: StudentsTableViewController?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func SaveButton(_ sender: UIButton)
    {
       
        let alertController = UIAlertController(title: "Alert", message: "Are you Sure", preferredStyle: .alert)
        let NoAction = UIAlertAction(title: "No", style: .cancel, handler: nil)
        let YesAction = UIAlertAction(title: "Yes", style: .default) {(action) in
            
            
            
            let alert = UIAlertController(title: "New Contact saved", message: "\(self.FirstNameTF.text) is now a Student ", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
                
                
                var firstName = self.FirstNameTF.text
                var lastName = self.LastNameTF.text
                var studentID = self.IDTextField.text
                       
                       let student = Student(Firstname: firstName!, Lastname: lastName!, StuID: studentID!)
                       
                       Student.Students.append(student)
                       
                self.FirstNameTF.text = ""
                self.LastNameTF.text = ""
                self.IDTextField.text = ""
                
                
            }
            alert.addAction(okAction)
            self.present(alert,animated: true, completion: nil)
//            let OkAction = UIAlertAction(title: "ok", style: .default, handler: nil)
           
        }
        
            alertController.addAction(NoAction)
            alertController.addAction(YesAction)
        self.present(alertController,animated: true, completion: nil)
       
        
        
        
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        StuDelegate?.tableView.reloadData()
    }
}


