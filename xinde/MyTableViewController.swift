//
//  MyTableViewController.swift
//  xinde
//
//  Created by 李力 on 2017/9/12.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import AVOSCloud

class MyTableViewController: UITableViewController {

    var crea: AVObject!
    var creas : [AVObject] = []
    var current = AVUser.current()
    
    @IBAction func out(segue:UIStoryboardSegue){
        
    }

    //    @IBAction func dlout(_ sender: Any) {
//        AVUser.logOut()
//
//        let current = AVUser.current()
//
//
//        AVUser.changeCurrentUser(current, save: false)
//
//        print(current?.username!)
//
//        _ = AreaTableViewController()
//        self.navigationController?.popViewController(animated: true)
//
//    }
    @IBOutlet weak var usernamedl: UILabel!
    
    @IBOutlet weak var myuserimages: UIImageView!
    var currentUser = AVUser.current()
    @IBAction func backSegue(segue : UIStoryboardSegue){
        if segue.identifier == "backMainForP1"{
            //获取返回的控制器
            let backVC = segue.source as! dlTableViewController
//            usernamedl.text = backVC.backSting//获取返回值
            backVC.crea = current
//            self.tableView.reloadData(viewDidLoad())
//            return viewDidLoad()
            print(backVC.denglu(),"fff")
            self.tableView.reloadData(czwk())
            return czwk()
        }
    }
    
    @IBOutlet weak var wode: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
//        czwk1()
        czwk()
                
        let queyr = AVQuery(className: "_User")
        
        queyr.cachePolicy = .cacheThenNetwork

        usernamedl.text = currentUser?.username
        
        kankan()

        
//        refreshControl = UIRefreshControl()
//        
//        refreshControl?.addTarget(self, action: #selector(self.refreshData), for:.valueChanged)

//        usernamedl.text = currentUser?.username
        
//        title = currentUser?.username
        
        
//        if let imgFile = currentUser!["images"] as? AVFile{
//                           self.myuserimages.image = UIImage(data: imgFile.getData()!)
//        }
        
      
//        let query = AVQuery(className : "_User")
//
//        query.order(byDescending: "createdAt")

//        query.clearCachedResult()
        
        czwk()
        self.tableView.reloadData(czwk())
        return czwk()
        
//        let leftBarbtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: nil)
//        self.navigationItem.leftBarButtonItem = leftBarbtn
//
//        let backbar = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
//
//        self.navigationItem.backBarButtonItem = backbar
        
//                self.navigationController?.interactivePopGestureRecognizer!.delegate = self

        self.navigationController?.interactivePopGestureRecognizer!.delegate = self as! UIGestureRecognizerDelegate
        
//        userout()
        }
    
//        czwk()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func close1(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func ghtx1(segue : UIStoryboardSegue){
        if segue.identifier == "ghtx1"{
            //获取返回的控制器
            let ghtx1 = segue.source as! userxqTableViewController
            
            current = ghtx1.back
            
            
            if let  img = current!["images"] as? AVFile {
                myuserimages.image = UIImage(data: img.getData()!)
                print(img.url,"img")
            }
            
            }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //传值到P1
        if segue.identifier == "goP1Segue"{//判断是哪个segue被触发
            //设置目标控制器
            let dest = segue.destination as! dlTableViewController
            dest.lrea = current

        
        }
        
    }
    
//    func refreshData() {
//        czwk(needUpdate: true)
//    }
//
//    func czwk(needUpdate : Bool = false){
//
//        if currentUser != nil{
//            currentUser?.username = usernamedl.text
//
//            if let imgFile = currentUser!["images"] as? AVFile{
//                myuserimages.image = UIImage(data: imgFile.getData()!)
//            }
//        }else{
//            usernamedl.text = currentUser?.username
//
//            title = currentUser?.username
//
//            myuserimages.image = #imageLiteral(resourceName: "Simulator Screen Shot 2017年9月14日 下午4.39.04")
//
//        }
//
//        currentUser?.username = usernamedl.text
//
////        if let imgFile = currentUser!["images"] as? AVFile{
////            myuserimages.image = UIImage(data: imgFile.getData()!)
////        }
//
//
//        let query = AVQuery(className : "_User")
//
//        query.order(byDescending: "createdAt")
//
//        query.whereKey("username", equalTo: currentUser?.username!)
//////
//        if needUpdate{
//            query.cachePolicy = .ignoreCache
//        }else{
//            query.cachePolicy = .ignoreCache
//
////            query.maxCacheAge  = 60 * 2
////            if query.hasCachedResult(){
////                print("yes")
////            }
//        }
//        for chakanuser in query.findObjects()! {
//            print((chakanuser as AnyObject).username,"123")
//            if currentUser != nil{
//                currentUser?.username = usernamedl.text
//
//                if let imgFile = currentUser!["images"] as? AVFile{
//                    myuserimages.image = UIImage(data: imgFile.getData()!)
//                }
//            }else{
//                usernamedl.text = currentUser?.username
//
//                title = currentUser?.username
//
//                myuserimages.image = #imageLiteral(resourceName: "Simulator Screen Shot 2017年9月14日 下午4.39.04")
//
//            }
//
////    }
//        query.findObjectsInBackground{ (results,error) in
//
//            if  (results as? [AVObject]) != nil{
//
////                self.creas = results
//
//
//                OperationQueue.main.addOperation {
//
//                    self.refreshControl?.endRefreshing()
//
//                    self.tableView.reloadData()
//                }
//            }else{
//                print(error ?? "123")
//            }
//            for chakanuser in results! {
//
//                print((chakanuser as AnyObject).username)
//                    self.currentUser?.username = self.usernamedl.text
//
//                    if let imgFile = self.currentUser!["images"] as? AVFile{
//                        self.myuserimages.image = UIImage(data: imgFile.getData()!)
//
//                }else{
//                    self.usernamedl.text = self.currentUser?.username
//
////                    title = currentUser?.username
//
//                    self.myuserimages.image = #imageLiteral(resourceName: "Simulator Screen Shot 2017年9月14日 下午4.39.04")
//
//                }
//
////                self.usernamedl.text = (chakanuser as AnyObject).username
////
////
////                if let imgFile = (chakanuser as AnyObject)["images"] as? AVFile{
////                    self.myuserimages.image = UIImage(data: imgFile.getData()!)
////                }
//            }
//            }
//        }
//    }
////
////    }
////
////
////    func userout(){
////        let query = AVQuery(className : "_User")
////
////        query.order(byDescending: "createdAt")
////
////            query.cachePolicy = .cacheThenNetwork
////            query.maxCacheAge  = 60 * 2
////            if query.hasCachedResult(){
////                print("yes")
////        }
////
////
////    }
    
    
    
    func kankan() {
        
        let rett = AVQuery(className: "xqcontentcc")
        
        rett.findObjectsInBackground { (results,error) in
            
                if let results = results as? [AVObject] {
        
                self.creas = results
        
                print(self.creas.count,"123123")
        
                        }
                }
    }
    

    func czwk(){
//        let current = AVUser.current()
        
        current?.fetchInBackground{ (results,error) in

            if  let results = results {

                self.creas = [results]

                OperationQueue.main.addOperation {

                    self.refreshControl?.endRefreshing()

                    self.tableView.reloadData()
                }
            }else{
//                print(error ?? "123")
            }
        }
        if currentUser != nil {
            
            let query = AVQuery(className : "_User")
            
            query.whereKey("user", equalTo: AVUser.current()!)
            
            //      query.cachePolicy = .cacheThenNetwork
            
            usernamedl.text = currentUser?.username
            
            
            title = currentUser?.username
            
            if let imgFile = currentUser!["images"] as? AVFile{
                myuserimages.image = UIImage(data: imgFile.getData()!)
            }else{
                
                let query = AVQuery(className : "_User")
                
                query.whereKey("user", equalTo: AVUser.current()!)
                
                title = currentUser?.username
                
                myuserimages.image = #imageLiteral(resourceName: "avatar_male_70")
                
                print("yes")
                
            }
        }

    }

    
   
//    func czwk1(){
//
//
////        let aaa = AVObject(className: "_User",objectId:(currentUser?.objectId!)!)
//
//        let ccc = AVQuery(className: "_User")
//
////        ccc.whereKey("username", equalTo: (currentUser?.objectId!)!)
//
//
//        ccc.findObjectsInBackground{ (results,error) in
//
//            if  let results = results as? [AVObject]{
//
//                self.creas = results
//
//                OperationQueue.main.addOperation {
//
//                    self.refreshControl?.endRefreshing()
//
//                    self.tableView.reloadData()
//                }
//            }else{
////                print(error ?? "123")
//            }
//        }
//
//    }


    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return creas.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "gogoog", for: indexPath) as! myTableViewCell
//        
//        let crea = creas[indexPath.row]
//        
//        cell.username.text = crea["username"] as? String
//
//
//        
//        return cell
//    }

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

    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
//        if segue.identifier == "showxqx"{
//            
//            let dest = segue.destination as! userxqTableViewController
//            dest.crea = creas[tableView.indexPathForSelectedRow!.row]
//            
//            
//        }
//    }
    

}
