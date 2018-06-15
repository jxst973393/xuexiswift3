//
//  follwTableViewController.swift
//  xinde
//
//  Created by 李力 on 2018/4/3.
//  Copyright © 2018年 李力. All rights reserved.
//

import UIKit
import AVOSCloud
import LeanCloud
import LeanCloudSocial

class follwTableViewController: UITableViewController {
    let currretn = AVUser.current()
    var creas: [AVObject] = []
    var crreas : [AVObject] = []

    @IBAction func remo(_ sender: Any) {
        let ccc = currretn?.followeeQuery()
        
        ccc?.findObjectsInBackground({ (object, error) in
            if   let object = object as? [AVObject] {
               self.crreas = object
                
                for i in self.crreas {
                    
                    self.currretn?.unfollow(i.objectId!, andCallback: { (succeed, error) in
                        if succeed {
                            print("yes")
                        }else{
                            print("no")
                        }
                    })
                }
            }
            
        })
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.tableFooterView = UIView(frame: CGRect.zero)

        list()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func list() {
        let ccc = currretn?.followeeQuery()
        
        ccc?.findObjectsInBackground({ (object, error) in
            if let object = object as? [AVObject] {
                self.creas = object
                
                print(self.creas,"creas")
                OperationQueue.main.addOperation {
                    
                    self.refreshControl?.endRefreshing()
                    
                    self.tableView.reloadData()
                }
            }
            
          
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return creas.count
    }

//
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Calll", for: indexPath) as! follwTableViewCell
    
        let crea = creas[indexPath.row]
//        cell.frame.size.width = 356
//
//        cell.frame.size.height = 79
        
        cell.username.text = crea["username"] as? String
        
        if let imgfile = crea["images"] as? AVFile {
            cell.useravt.image = UIImage(data: imgfile.getData()!)
        }
       
        
        // Configure the cell...

        return cell
    }
//

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



//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "follew"{
            
            let dest = segue.destination as! listTableViewController
            dest.drea = creas[tableView.indexPathForSelectedRow!.row]
        }
    }
 

}
