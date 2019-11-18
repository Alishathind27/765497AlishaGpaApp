//
//  GPAViewController.swift
//  765497_Alisha_gpaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation

class GPAViewController: UIViewController {

    
    @IBOutlet var CoursesCollection: [UILabel]!
    @IBOutlet var TextFieldCollection: [UITextField]!
    var SemesterDelegate: SemTableViewController?
    
  
   @IBOutlet weak var GPALabel: UILabel!
    var GradePoint: Double?
    var audio: AVAudioPlayer!
    let music = ["Win"]
    var marks: Double?
    var gpa = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    
        for i in CoursesCollection.indices
        {
         CoursesCollection[i].text = Semester.courses[(SemesterDelegate?.semIndex)!][i]
            TextFieldCollection[i].text = String(Student.Students[(SemesterDelegate?.semstuindx)!].marks[(SemesterDelegate?.semIndex)!][i])
//            TextFieldCollection[i].text = String(Student.Students[(SemesterDelegate?.semstuindx)!].marks
//              [(SemesterDelegate?.semIndex)!][i])
        }
    }
    

    @IBAction func Calculate(_ sender: UIButton)
    {
       
        for i in TextFieldCollection.indices{
            marks = GPA(mar: Int(TextFieldCollection[i].text!)!)
            Student.Students[SemesterDelegate!.semstuindx].marks[SemesterDelegate!.semIndex][i] = Int(TextFieldCollection[i].text!)!
            let credits = CoursesCollection[i].text!
            gpa += (marks! * Double(String(credits[credits.index(before: credits.endIndex)]))!)
        }
        
        let sgpa = gpa / 2.0
        Student.Students[SemesterDelegate!.semstuindx].GPA[SemesterDelegate!.semIndex] = sgpa
        
        GPALabel.text = String(format: "GPA: %2F/4", sgpa)
        
        if gpa > 2.8{
                   let selectedButton = music[sender.tag]
                   let soundURL = Bundle.main.url(forResource: selectedButton, withExtension: "wav")
                   audio = try! AVAudioPlayer(contentsOf: soundURL!)
                   audio.play()
               }
               
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
