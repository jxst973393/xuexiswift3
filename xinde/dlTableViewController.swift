//
//  dlTableViewController.swift
//  xinde
//
//  Created by 李力 on 2017/9/12.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import AVOSCloud

class dlTableViewController: UITableViewController {

    var crea: AVObject!
    var creas: [AVObject] = []
    var currentUser = AVUser.current()
    var callen: [AVObject] = []
    var backSting = AVUser.current()
    var lrea = AVUser.current()
    @IBOutlet weak var imagesss: UIImageView!
    
    @IBOutlet weak var dlpassword: UITextField!
    @IBOutlet weak var dluser: UITextField!
    @IBAction func Dl(_ sender: Any) {
        
        var ccc = dluser.text
        let bbb = dlpassword.text
       
//        if ccc == ""{
//            
//            showMsgbox(_message: "请输入帐号")
//            
//            return
//            
//        }
//        
//        if bbb == "" {
//            
//            showMsgbox(_message: "请输入密码")
//            
//            return
//            
//        }
        
        denglu()

        
        dlluoji()
//        passworderror()
//        chaxun()
//
        let brea = AVQuery(className: "_User")
//                        brea.whereKey("username", equalTo: ccc!)
        brea.whereKey("username", notEqualTo: ccc!)
//        brea.whereKey("password", notEqualTo: bbb!)
//                brea.order(byDescending: "updatedAt")
//
//                brea.addDescendingOrder("updatedAt")

        brea.cachePolicy = .ignoreCache

        brea.findObjectsInBackground { (results,error) in
            let results = results as? [AVObject]
        }

        for chaxuncha in brea.findObjects()! {
            print(chaxuncha)
//
//            brea.cachePolicy = .ignoreCache
//
//            if ccc != (chaxuncha as AnyObject).username {
//                let alertController = UIAlertController(title: "用户名错误!",message: nil, preferredStyle: .alert)
//                                //显示提示框
//                                self.present(alertController, animated: true, completion: nil)
//                                //两秒钟后自动消失
//                                _ = MyTableViewController()
//
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
//            }
        }

//    dismiss(animated: true, completion:  nil )

        
//        dismiss(animated: true, completion: nil)
//
//        self.navigationController?.popViewController(animated: true)
//        let sb = UIStoryboard(name: "Main", bundle:nil)
//                    let vc = sb.instantiateViewController(withIdentifier: "crea") as! AreaTableViewController
//
//                    self.present(vc, animated: true, completion: nil)
//

        backSting = lrea
        //        var back = denglu()
        //如果直接关联到exit，下面的performSegue方法不需要
        performSegue(withIdentifier: "backMainForP1", sender: nil)
        print(currentUser,"...")
    }
    
    func dl() {
        if currentUser != nil {
            let alert = UIAlertController(title: "已登陆", message: nil, preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            _ = MyTableViewController()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                _ = MyTableViewController();self.dismiss(animated: true, completion: nil)
            }
            dismiss(animated: true, completion: nil)
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dl()
        dluser.placeholder = "请输入用户名"
        dlpassword.placeholder = "请输入密码"
        print(currentUser?.username!)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
//        denglu()

        dlpassword.isSecureTextEntry = true
//        dlluoji()
        
//        let query = AVQuery(className: "_User")
//
//        query.findObjectsInBackground{ (results,error) in
//            if let results = results as? [AVObject] {
//                self.creas = results
//            }else{
//                print(error!)
//            }
//
//        }
       chaxun()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func dlluoji(){

        let ccc = dluser.text
        let bbb = dlpassword.text

        let brea = AVQuery(className: "_User")
        brea.whereKey("username", equalTo: ccc!)
//        brea.whereKey("password", notEqualTo: bbb!)
//        brea.order(byDescending: "updatedAt")

//        brea.addDescendingOrder("updatedAt")

        for chaxuncha in brea.findObjects()! {
            print((chaxuncha as AnyObject).username)



//            if ccc == (chaxuncha as AnyObject).username  {
//                let alertController = UIAlertController(title: "登陆成功!",message: nil, preferredStyle: .alert)
//                //显示提示框
//                self.present(alertController, animated: true, completion: nil)
//                //两秒钟后自动消失
//                _ = MyTableViewController()
//
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}

            }

//            if bbb != (chaxuncha as AnyObject).password {
//                showmsboxx(_message: "密码错误")
//                return
//
//            }
//        }
    }
    
    func chaxun(){
        let query = AVQuery(className: "_User")

        query.findObjectsInBackground{ (results,error) in
            if let results = results as? [AVObject] {
                self.creas = results
            }else{
                print(error!)
            }

        }
    }
    
    
    func denglu(){
        
        let ccc = dluser.text
        let bbb = dlpassword.text
        
        AVUser.logInWithUsername(inBackground: ccc!, password: bbb!){ (user,error) in
            if (user != nil){
//                self.showmsboxx(_message: "登陆成功")
//                return
        let alertController = UIAlertController(title: "登陆成功!",message: nil, preferredStyle: .alert)
                                                //显示提示框
    self.present(alertController, animated: true, completion: nil)
                                                //两秒钟后自动消失
    _ = MyTableViewController()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) { _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
                print(user!)
            }
            if (error?._code == 210){
//                self.showmsboxx(_message: "用户名或密码错误")
//                print("用户名或密码错误")
                let alertController = UIAlertController(title: "用户名或密码错误!",message: nil, preferredStyle: .alert)
                                                //显示提示框
                                                self.present(alertController, animated: true, completion: nil)
                                                //两秒钟后自动消失
                                                _ = MyTableViewController()
                
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
                return
            }
            if (error?._code == 217){
                let alertController = UIAlertController(title: "请输入账号",message: nil, preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)
                //两秒钟后自动消失
                _ = MyTableViewController()
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
                return
            }
            if (error?._code == 218){
                let alertController = UIAlertController(title: "请输入密码",message: nil, preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)
                //两秒钟后自动消失
                _ = MyTableViewController()
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
                return
            }
            if (error?._code == 211){
                let alertController = UIAlertController(title: "用户名不存在",message: nil, preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)
                //两秒钟后自动消失
                _ = MyTableViewController()
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
                return
            }
            
            
        }

    }
    
        

//     MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return creas.count
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

         Configure the cell...

        return cell
    }
    */

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
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "gogogo"{
            
            let dest = segue.destination as! MyTableViewController
            dest.crea = self.crea
            dest.crea = creas[tableView.indexPathForSelectedRow!.row]
            
            
        }

        
    }
    
    func showmsboxx(_message: String, _title: String = "提示"){
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertControllerStyle.alert)
        let btnOK = UIAlertAction(title: "好的", style: .default, handler: nil)
        alert.addAction(btnOK)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showMsgbox(_message: String, _title: String = "提示"){
        
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertControllerStyle.alert)
        let btnOK = UIAlertAction(title: "好的", style: .default, handler: nil)
        alert.addAction(btnOK)
        self.present(alert, animated: true, completion: nil)
        
    }
}

