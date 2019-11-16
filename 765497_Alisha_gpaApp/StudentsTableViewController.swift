//
//  StudentsTableViewController.swift
//  765497_Alisha_gpaApp
//
//  Created by MacStudent on 2019-11-14.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentsTableViewController: UITableViewController,UISearchResultsUpdating
{
    
//    Array for filtered Data
    var filItem = [Student]()
    var searchCont = UISearchController(searchResultsController: nil)
    var studentIndex = -1
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        searchCont.searchResultsUpdater = self
        searchCont.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchCont.searchBar
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchCont.isActive && searchCont.searchBar.text != ""
        {
            return filItem.count
        }
        return Student.Students.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        
        let st: Student
        
         if searchCont.isActive && searchCont.searchBar.text != ""
        {
           st =  filItem[indexPath.row]
        }
        else
        {
           st = Student.Students[indexPath.row]
        }
        // Configure the cell...
        cell.textLabel?.text = "\(st.Firstname + " " + "\(st.Lastname)")"

        return cell
    }
    
    func searchBarEditing(_ searchBar: UISearchBar)
    {
        self.searchBar.showsCancelButton = true
    }
    
    func updateSearchResults(for searchController: UISearchController)
     {
    filterItem(for: searchCont.searchBar.text ?? "")
     }
    
    
    
    func filterItem(for text: String)
    {
        filItem = Student.Students.filter({(Stud) -> Bool in Stud.Firstname.lowercased().contains(text.lowercased())
        })
        tableView.reloadData()
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if  let detailView = segue.destination as? ViewController{
        detailView.StuDelegate = self
            
            if let Semes = segue.destination as? SemTableViewController{
                Semes.stusemesterindex = self
                
            }
            if let cell = sender as? UITableViewCell{
                
                studentIndex = tableView.indexPath(for: cell)!.row
            }
    
        }
    
    
    }
    
   
    


}
