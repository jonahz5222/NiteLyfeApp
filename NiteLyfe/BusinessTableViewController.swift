//
//  BusinessTableViewController.swift
//  NiteLyfe
//
//  Created by Jonah Zukosky on 10/13/17.
//  Copyright © 2017 Jonah Zukosky. All rights reserved.
//

import UIKit

class BusinessTableViewController: UITableViewController {

    let reuseIdentifier = "eventCell"
    var numCells = 5 //Later Change to be dynamic, should be an integer array of all events, pulled from database
    var items = ["1","2","3","4","5"]
    let sections = ["Current Events","Past Events"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    //Initializes each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! BEventsTableViewCell
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
    //Sets Number of Rows in Each Section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numCells
    }
    
    //Sets Number of Sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
    //Sets Section Headers
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.sections[section]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //performSegue(withIdentifier: "cellToDetail", sender: self)
        
        let destination = BusCellDetailViewController()
        destination.title = items[indexPath.row]
        
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! BusCellDetailViewController
        
        
     }*/
    // MARK: - Table view data source

   /* override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }*/

    /*override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }*/

    
   /* override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }*/
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
