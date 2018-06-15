//
//  listTableViewController.swift
//  xinde
//
//  Created by 李力 on 2018/5/3.
//  Copyright © 2018年 李力. All rights reserved.
//

import UIKit
import AVOSCloud
import LeanCloud
import LeanCloudSocial


class listTableViewController: UITableViewController {
    let currretn = AVUser.current()

    var drea : AVObject!
    var dcea : [AVObject] = []
    var creas : [AVObject] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ccc = drea["username"] as? String
        
        let bbb = "的列表"
        
        title = ccc!+bbb
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        print(drea.objectId!,"wo")
        
        chaxun()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()


//        print(dcea,"wowo")
        
        // Dispose of any resources that can be recreated.
    }
    
    func chaxun() {
        let aaa = AVObject(className: "_User",objectId:drea.objectId!)
        
        let ccc = AVQuery(className: "cs")
        
        ccc.whereKey("plgl", equalTo: aaa)
        
        ccc.order(byDescending: "createdAt")
        
        ccc.findObjectsInBackground{ ( results ,error) in
            
            if  let results = results as? [AVObject]{
                
                print(results,"chuizi")
                
                self.creas = results
                
                OperationQueue.main.addOperation {
                    
                    self.refreshControl?.endRefreshing()
                    
                    self.tableView.reloadData()
                }
            }else{
                print(error ?? "error")
            }
            
        }
//        aaa.refresh()
        
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

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ccll", for: indexPath) as! listTableViewCell
        
        let crea = creas[indexPath.row]
        
        cell.Name.text = crea["Name"] as? String
        
        if let imageFile = crea["images"] as? AVFile {
            cell.images.image = UIImage(data:imageFile.getData()! )
        }

//         Configure the cell...

        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "kkxq"{
            
            let dest = segue.destination as! xqTableViewController
            dest.crea = creas[tableView.indexPathForSelectedRow!.row]
            dest.ccea = creas
        }
        
    }
 

}
