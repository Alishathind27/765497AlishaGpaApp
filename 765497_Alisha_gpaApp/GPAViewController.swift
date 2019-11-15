//
//  GPAViewController.swift
//  765497_Alisha_gpaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class GPAViewController: UIViewController {

    
    
    @IBOutlet weak var txtFieldC1: UITextField!
    @IBOutlet weak var txtFieldC2: UITextField!
    @IBOutlet weak var txtFieldC3: UITextField!
    @IBOutlet weak var txtFieldC4: UITextField!
    @IBOutlet weak var txtFieldC5: UITextField!
   @IBOutlet weak var GPALabel: UILabel!
    var GradePoint: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    

    @IBAction func Calculate(_ sender: UIButton)
    {
        let course1 = GPA(mar: Int(txtFieldC1.text!)!)
        let course2 = GPA(mar: Int(txtFieldC2.text!)!)
        let course3 = GPA(mar: Int(txtFieldC3.text!)!)
        let course4 = GPA(mar: Int(txtFieldC4.text!)!)
        let course5 = GPA(mar: Int(txtFieldC5.text!)!)

        
        let g = (course1 * 4) + (course2 * 3) + (course3 * 3) + (course4 * 5) + (course5 * 5)/20.0
        
        GPALabel.text = "GPA: \(g)"
    }
    
    func GPA(mar: Int) -> (Double)
    {
        switch mar
        {
        case 0...49:
            GradePoint = 0.0
        case 50...59:
            GradePoint = 1.0
        case 60...62:
            GradePoint = 1.7
        case 63...66:
            GradePoint = 2.0
        case 67...69:
            GradePoint = 2.3
        case 70...72:
            GradePoint = 2.7
        case 73...76:
            GradePoint = 3.0
        case 77...79:
            GradePoint = 3.2
        case 80...86:
            GradePoint = 3.5
        case 87...93:
            GradePoint = 3.7
        case 49...100:
            GradePoint = 4.0
        default:
            break
        }
        return GradePoint!
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
