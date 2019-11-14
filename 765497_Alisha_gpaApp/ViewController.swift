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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func SaveButton(_ sender: UIButton)
    {
        var firstName = FirstNameTF.text
        var lastName = LastNameTF.text
        var studentID = IDTextField.text
        
        let student = Student(Firstname: firstName!, Lastname: lastName!, StuID: studentID!)
        
        Student.Students.append(student)
        
        let alertController = UIAlertController(title: "Are you Sure", message: "", preferredStyle: <#T##UIAlertController.Style#>)
        
        
        
    }
    
}

