//
//  userquerypassTableViewController.swift
//  xinde
//
//  Created by 李力 on 2017/11/27.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import AVOSCloud

class userquerypassTableViewController: UITableViewController {
    let current = AVUser.current()
    var sendButton: UIButton!

    @IBOutlet weak var phonenumber: UITextField!
    @IBOutlet weak var yzm: UITextField!
    @IBOutlet weak var newpassword: UITextField!
    
//    @IBAction func message(_ sender: Any) {
//        let ccc = phonenumber.text
//
//        AVUser.verifyMobilePhone(ccc!) { (succeeded,error) in
//            if (succeeded){
//                print(succeeded)
//            }else{
//                print(error,"123")
//            }
//
//        }
//
//        AVUser.requestPasswordReset(withPhoneNumber: ccc!){ (succeeded,error) in
//            if (succeeded){
//                print(succeeded)
//                let alertController = UIAlertController(title: "请稍等",message: nil, preferredStyle: .alert)
//                //显示提示框
//                self.present(alertController, animated: true, completion: nil)
//                //两秒钟后自动消失
//                _ = MyTableViewController()
//
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
//                return
//            }else{
//                print(error)
//            }
//
//        }
//    }
    
    @IBAction func query(_ sender: Any) {
      
        let ccc = phonenumber.text
        let bbb = yzm.text
        let ddd = newpassword.text
        
        if ccc == "" {
            let alertController = UIAlertController(title: "不能为空",message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            _ = MyTableViewController()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
            return
        }
        if bbb == "" {
            let alertController = UIAlertController(title: "不能为空",message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            _ = MyTableViewController()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
            return
        }
        if ddd == "" {
            let alertController = UIAlertController(title: "不能为空",message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            _ = MyTableViewController()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
            return
        }
        dismiss(animated: true, completion: xiugai)
    }
    
    
    var countdownTimer: Timer?
    
    var remainingSeconds: Int = 0 {
        willSet {
            sendButton.setTitle("有效期(\(newValue))", for: .normal)
            if newValue <= 0 {
                sendButton.setTitle("重新获取验证码", for: .normal)
                isCounting = false
            }
        }
    }
    
    var isCounting = false {
        willSet {
            if newValue {
                countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(yzmobphoneTableViewController.updateTime(_:)), userInfo: nil, repeats: true)
                
                remainingSeconds = 60
                
                sendButton.backgroundColor = UIColor.gray
            } else {
                countdownTimer?.invalidate()
                countdownTimer = nil
                
                sendButton.backgroundColor = UIColor.red
            }
            
            sendButton.isEnabled = !newValue
        }
    }
    
    func sendButtonClick(_ sender: UIButton) {
        isCounting = true
        
        let ccc = phonenumber.text
        
        AVUser.verifyMobilePhone(ccc!) { (succeeded,error) in
            if (succeeded){
                print(succeeded)
            }else{
                print(error,"123")
            }
            
        }
        
        AVUser.requestPasswordReset(withPhoneNumber: ccc!){ (succeeded,error) in
            if (succeeded){
                print(succeeded)
                let alertController = UIAlertController(title: "请稍等",message: nil, preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)
                //两秒钟后自动消失
                _ = MyTableViewController()
                
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
                return
            }else{
                if (error?._code == 212){
                        let alertController = UIAlertController(title: "手机号不能为空",message: nil, preferredStyle: .alert)
                        //显示提示框
                        self.present(alertController, animated: true, completion: nil)
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
                        self.isCounting = false
                        return
                }
                print(error)
            }
            
        }
    }
    
    func updateTime(_ timer: Timer) {
        remainingSeconds -= 1
    }
    func xiugai(){
        let ccc = phonenumber.text
        let bbb = yzm.text
        let ddd = newpassword.text
        
        AVUser.resetPassword(withSmsCode: bbb!, newPassword: ddd!) { (succeed,error) in
            let alertController = UIAlertController(title: "修改成功",message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            _ = MyTableViewController()
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
            return
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton = UIButton()
        sendButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        sendButton.frame = CGRect(x: 262, y: 115, width: 110 , height: 30)
        sendButton.backgroundColor = UIColor.red
        sendButton.setTitleColor(UIColor.white, for: .normal)
        sendButton.setTitle("获取验证码", for: .normal)
        sendButton.addTarget(self, action: #selector(yzmobphoneTableViewController.sendButtonClick(_:)), for: .touchUpInside)
        
        self.view.addSubview(sendButton)
        
        phonenumber.placeholder = "请输入手机号"
        newpassword.placeholder = "请输入密码"
        yzm.placeholder = "请输入验证码"
        
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
