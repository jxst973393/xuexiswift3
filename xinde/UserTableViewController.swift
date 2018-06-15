//
//  UserTableViewController.swift
//  xinde
//
//  Created by 李力 on 2017/9/12.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import CoreData
import AVOSCloud

class UserTableViewController: UITableViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate {
    
    let randmorUser = AVUser()
    var area: AreaMO!
    var crea: AVObject!
    var isVisited: Bool = true
    var creas: [AVObject] = []

    @IBOutlet weak var useryzm: UITextField!
    @IBOutlet weak var userphone: UITextField!
    @IBOutlet weak var tips: UILabel!
    @IBOutlet weak var userimages: UIImageView!
    @IBOutlet weak var userpassword: UITextField!
    @IBOutlet weak var username: UITextField!
    
//    @IBAction func yzm(_ sender: Any) {
//        let ccc = userphone.text
//
//        AVUser.requestMobilePhoneVerify(ccc!){ (succeeded,error) in
//            if(succeeded){
//                print(succeeded)
//            }else{
//                print(error!)
//            }
//
//        }
//
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
        IndexPath) {
        if indexPath.row == 0 {
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = true
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = self
                
                present(imagePicker, animated: true)
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userimages.image = selectedImage
            userimages.contentMode = .scaleAspectFill
            userimages.clipsToBounds = true
        }
        let leadingConstraint = NSLayoutConstraint(item: userimages, attribute: .leading, relatedBy: .equal, toItem: userimages.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true

        let trailingConstrain = NSLayoutConstraint(item: userimages, attribute: .trailing, relatedBy: .equal, toItem: userimages.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstrain.isActive = true

        let topConstraint = NSLayoutConstraint(item: userimages, attribute: .top, relatedBy: .equal, toItem: userimages.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true

        let buttomConstraint = NSLayoutConstraint(item: userimages, attribute: .bottom, relatedBy: .equal, toItem: userimages.superview, attribute: .bottom, multiplier: 1, constant: 0)
        buttomConstraint.isActive = true

        dismiss(animated: true, completion: nil)
    }
   

    @IBAction func baocun(_ sender: Any) {
        
        if userimages.image == nil {
            showmsboxx(_message: "请添加头像")
            return
        }
        
        if userphone.text == nil {
            showmsboxx(_message: "请输入手机号")
            return
        }
        
        if username.text == nil {
            showmsboxx(_message: "请输入用户名")
            return
        }
        
        if userpassword.text == nil {
            showmsboxx(_message: "请输入密码")
            return
        }
        
        let abc = userphone.text

        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            area = AreaMO(context: appDelegate.persistentContainer.viewContext)
//            area.name = username.text
//            area.content = userpassword.text
//            area.isVisited = isVisited
            
            var ccc = username.text
            
//            let bbb = useryzm.text
//
//            AVUser.verifyMobilePhone(bbb!){ (succeeded,error) in
//                if (succeeded){
//                    print(succeeded)
//                }else{
//                    print(error)
//                }
//
//            }
            
            let query = AVQuery(className: "_User")
            
            
            for chachakan in query.findObjects()! {
                
                let bbb = (chachakan as AnyObject).username
                
                if  ccc == bbb.debugDescription {
                
                    let alertController = UIAlertController(title: "用户名已存在!",message: nil, preferredStyle: .alert)
                    //显示提示框
                    self.present(alertController, animated: true, completion: nil)
                    //两秒钟后自动消失
//                    _ = MyTableViewController()
//                    
//                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}

                }
                
                if abc == (chachakan as AnyObject).mobilePhoneNumber {
                    let alertController = UIAlertController(title: "手机号已存在", message: nil, preferredStyle: .alert)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
            

            if let creas = userimages.image {
                // 2
                if let imageData = UIImageJPEGRepresentation(creas,0.1) {
                    area.image = NSData(data: imageData)
                }
        
                print("Saving data to context ...")
//                usersave()
                userimag()
//                appDelegate.saveContext()
            
            }

//            dismiss(animated: true, completion: nil)
            
                                _ = AreaTableViewController()
            
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = AreaTableViewController();self.dismiss(animated: true, completion: nil)}

            
            //            performSegue(withIdentifier: "unwindToHomeScreen", sender: self)
        }
    
    
//       let ccc = AreaTableViewController()
//        self.navigationController?.popViewController(animated: true)
//self.presentingViewController!.dismiss(animated: true, completion: nil)
        
//        self.performSegue(withIdentifier: "login", sender: self)
        
        _ = AreaTableViewController()
        
        self.navigationController?.popViewController(animated: true)

//        dismiss(animated: true, completion: nil)
      

    }

    func showmsboxx(_message: String, _title: String = "提示"){
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "好的", style: .default, handler: {
            action in
            print("点击了确定")
        })
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    func userimag(){
        
        let cloudobject = AVObject(className: "_User")
        
        randmorUser.username = username.text

        randmorUser.password = userpassword.text
        
//        randmorUser.mobilePhoneNumber = userphone.text
        
//        cloudobject["username"] = area.name
//
//        cloudobject["password"] = area.content

        let originImg = UIImage(data: area.image! as Data)
        
        let factor = (originImg!.size.width > 1024) ? (1024 / originImg!.size.width) : 1
        
        let scaledImg = UIImage(data: area.image! as Data, scale: factor)
        
        let file = AVFile(name: "file", data: UIImageJPEGRepresentation(scaledImg!,0.1)!)
        
        randmorUser["images"] = file
        
//        randmorUser.saveInBackground{ (succeed,error)  in
//            if succeed {
//                print("成功")
//            }else{
//                print("cuowu")
//            }
//
//        }
        randmorUser.signUpInBackground{(succeed,error) in
            if succeed{
                print("注册成功")
            }else{
                print(error ?? "注册失败")
            }
            
        }
        

        
//        cloudobject.saveInBackground{ (succeed,error) in
//
//            if succeed{
//                print(self.randmorUser.objectId as Any)
//            }else{
//                print(error ?? "no")
//            }
//
//        }
    }
    
//    func usersave(){
//        randmorUser.username = username.text
//
//        randmorUser.password = userpassword.text
//
//        randmorUser.signUpInBackground{(succeed,error) in
//            if succeed{
//                print("注册成功")
//            }else{
//                print(error ?? "注册失败")
//            }
//
//        }
//    }
//////
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "注册时图片会压缩上传请耐心等待"
    }
    
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "手机号尚未验证并不影响使用，注册后会收到验证码可验证手机号，只有验证过的手机号才能使用找回密码功能"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tips.text = "注册后会给发送验证码，以便验证手机号方便您找回或更改密码，不验证手机号不影响使用其他功能"
//
//        tips.lineBreakMode = NSLineBreakMode.byWordWrapping
//
//        tips.numberOfLines = 0
        
        
//        tips.frame = CGRect(x: 262, y: 155, width: 110, height: 30)
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        userimages.image = #imageLiteral(resourceName: "beijing")

        username.placeholder = "请输入用户名"
        userpassword.placeholder = "请输入密码"
        userphone.placeholder = "请输入手机号"
        userpassword.isSecureTextEntry = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

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
