//
//  scTableViewController.swift
//  xinde
//
//  Created by 李力 on 2018/5/16.
//  Copyright © 2018年 李力. All rights reserved.
//

import UIKit
import AVOSCloud
import LeanCloud

class scTableViewController: UITableViewController {
    
    var creas: [AVObject] = []
    var crea : AVObject!
    let currentuser = AVUser.current()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hflist()
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func hflist() {
        
        let query = AVQuery(className: "cs")
        
        query.findObjectsInBackground { (results,error) in
            
            if let results = results as? [AVObject] {
                
                self.creas = results
                
                OperationQueue.main.addOperation {
                    self.refreshControl?.endRefreshing()
                    self.tableView.reloadData()
                }
            }else{
                print(error,"error")
            }
            
        }
        
        
//        let aaa = AVObject(className: "cs", objectId: "5b178e4e7f6fd30063d112b5")
//
////        let bbb = AVObject(className: "_User", objectId: "5ad83ce19f54540044d9fce9")
//
//
//        let ccc = AVQuery(className: "sc")
//
//        ccc.whereKey("xqgl", equalTo: aaa)
//
//        ccc.includeKey("objectId")
//
////        ccc.whereKey("plgl", equalTo: bbb)
//
////        ccc.includeKey("Name")
//
//        ccc.order(byDescending: "createdAt")
//
//        ccc.findObjectsInBackground{ ( results ,error) in
//
//            if  let results = results as? [AVObject]{
//
//                print(results,"111")
//
//                self.creas = results
//
////                aaa.fetchInBackground(withKeys: ["plgl"], block: { (results, error) in
////                    let bbb = results?.object(forKey: "plgl") as? AVObject
////
////                    print(bbb?.objectId!,"ctmm")
////
////                    let crea = bbb?.objectId
////
////                    print(crea,"lll")
////
////
////                })
//
////                for i in self.creas {
////                    i.fetchInBackground{ (ttt,error) in
////                        print(ttt,"ttt")
////
////                        self.crea = ttt
////
////                        print(self.crea["xqgl"],"bbb")
////
////                    }
////                }
//                OperationQueue.main.addOperation {
//
//                    self.refreshControl?.endRefreshing()
//
//                    self.tableView.reloadData()
//                }
//            }else{
//                print(error ?? "error")
//            }
//
//        }
        
//        let ccc = AVQuery(className: "cs")
//
//        ccc.findObjectsInBackground { (results,error) in
//            if let results = results as? [AVObject]{
//                self.creas = results
//            }
//
//        }
        
        
//        let bbb = AVObject(className: "sc", objectId: "5b18d7dd2f301e0038a16ca6")
//
//        let aaa = AVObject(className: "cs", objectId: "5b178e4e7f6fd30063d112b5")
//
//        //        let bbb = AVObject(className: "_User", objectId: "5ad83ce19f54540044d9fce9")
//
//        let ccc = AVQuery(className: "sc")
//
//        ccc.whereKey("xqgl", equalTo: aaa)
//
//        ccc.includeKey("objectId")
//
//        //        ccc.whereKey("plgl", equalTo: bbb)
//
//        //        ccc.includeKey("Name")
//
//        ccc.order(byDescending: "createdAt")
//
//        ccc.findObjectsInBackground{ ( results ,error) in
//
//            if  let results = results as? [AVObject]{
//
//                print(results,"111")
//
//                self.creas = results
//
//
//                for i in results {
//                    print(i.objectId!,"iii")
//
//                    i.fetchInBackground(withKeys: ["xqgl"], block: { (mmm, error) in
//
//                        print(mmm as Any,"cscs")
//
//                    })
//
//
//                    i.fetchInBackground(withKeys: ["xqgl"], block: { (results, error) in
//                        let iii = results?.object(forKey: "xqgl") as? AVObject
//                        print(iii?.objectId,"obf")
//
//                        print(iii!["Name"] as? String,"ttt")
//
//
//
//
//
//                    })
//                }
//
//
//
//                bbb.fetchInBackground(withKeys: ["xqgl"], block: { (results, error) in
//                    let ttt = results?.object(forKey: "xqgl") as? AVObject
//
////                    print(ttt?.objectId!,"ctmm")
//
//                    print(ttt?.objectId,"321")
//
////                    if case self.creas = ttt as? [AVObject]  {
////                        print(self.creas,"...")
////                    }
//
////                    let crea = ttt?.objectId
//
////                    print(crea)
//
//
//
////                    cell.username.text = ttt!["Name"] as? String
//
//                })
//            }
//        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sc", for: indexPath) as! scTableViewCell

//        let crea = creas[indexPath.row]
//         Configure the cell...
//
//        print(crea["Name"],"666")
//
//      cell.username.text = crea["objectId"] as? String
        let crea = self.creas[indexPath.row]


//        let bbb = AVObject(className: "cs", objectId: self.crea.objectId!)
////
////        let aaa = AVObject(className: "cs", objectId: "5b178e4e7f6fd30063d112b5")
//
//        //        let bbb = AVObject(className: "_User", objectId: "5ad83ce19f54540044d9fce9")
//
//        let ccc = AVQuery(className: "sc")
//
////        ccc.whereKey("xqgl", equalTo: aaa)
////
////        ccc.includeKey("objectId")
////
////        //        ccc.whereKey("plgl", equalTo: bbb)
////
////        //        ccc.includeKey("Name")
////
////        ccc.order(byDescending: "createdAt")
//
//        ccc.findObjectsInBackground{ ( results ,error) in
//
//            if  let results = results as? [AVObject]{
//
//                print(results,"111")
//
//                self.creas = results
//
//
//
//
//                bbb.fetchInBackground(withKeys: ["usersc"], block: { (results, error) in
//                    let ttt = results?.object(forKey: "usersc") as? AVObject
//
//                    print(ttt?.objectId!,"ctmm")
//
//                    let userob = ttt?.objectId
//
//                    print(bbb)
//
////                    let usersc = self.currentuser?.objectId
////
////
////                    let crea = self.creas[indexPath.row]
////
////                    if let userob = usersc {
////                        cell.username.text = crea["Name"] as? String
////                    }
//
//                })
//            }
//        }

        
//        print(crea["objectId"] as? String,"ttt")
        
        let object = crea["objectId"] as? String
        
        let query = AVObject(className: "cs", objectId: object!)
        
        
        query.fetchInBackground(withKeys: ["usersc"], block: {(results,error) in
            let userob = results?.object(forKey: "usersc") as? AVObject
            
//            print(userob!,"userob")
            
//            let useruser = self.currentuser?.objectId
            
            
            if    userob?.objectId == self.currentuser?.objectId {
                cell.username.text = crea["Name"] as? String
            }else{
                cell.isHidden = true
            }
            
            
        })
        
//        query.fetchInBackground(withKeys: ["xqgl"]) { (results, error) in
//            let userob = results?.object(forKey: "xqgl") as? AVObject
//            print(userob,"userob")
//
//            if   let userob = crea["objectId"] as? String {
//                cell.username.text = crea["Name"] as? String
//            }else {
//                cell.username.text = nil
//            }
//
//        }
       
        
        
        
        
//        if let usersc = crea["usersc"] as? String {
//            cell.username.text = crea["Name"] as? String
//        }
        


        
        
        
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
        if segue.identifier == "scsc"{
            
            let dest = segue.destination as! xqTableViewController
            dest.crea = creas[tableView.indexPathForSelectedRow!.row]
            dest.creas = creas
        }
        
    }
 

}
