//
//  yzmobphoneTableViewController.swift
//  xinde
//
//  Created by 李力 on 2017/11/27.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import AVOSCloud
import LeanCloud

class yzmobphoneTableViewController: UITableViewController {

    var sendButton: UIButton!
    let current = AVUser.current()
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var yzm: UITextField!
    let curr = AVUser()
    
   
    
    @IBAction func yanz(_ sender: Any) {
        let ccc = yzm.text
        
        let bbb = phone.text
      

//        LCUser.verifyMobilePhoneNumber(bbb!, verificationCode: ccc!){ result in
//            switch result {
//            case .success:
//                break
//            case .failure(let error):
//                print(error)
//            }
//
//        }
        
        
            AVUser.verifyMobilePhone(ccc!) { (succeeded,error) in
                if (succeeded){
                    let alertController = UIAlertController(title: "验证成功",message: nil, preferredStyle: .alert)
                    //显示提示框
                    self.present(alertController, animated: true, completion: nil)
                    print(succeeded)
                }else{
                    print(error!,"123")
                }
        }
        
        
        dismiss(animated: true, completion: nil)
        
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
        
        let ccc = phone.text
        

        
        let bbb = AVUser.current()
        
    
        
//        AVOSCloud.requestSmsCode(withPhoneNumber: ccc!){ (results,error ) in
//            print(results)
//
//        }
        
//        AVUser.requestMobilePhoneVerify(ccc!) { (succeeded,error) in
//            if (succeeded){
//                print(self.current?.mobilePhoneNumber)
//            }else{
//                print(error)
//            }
//        }
        
   
//        LCUser.requestVerificationCode(mobilePhoneNumber: ccc!) { result in
//            switch result {
//            case .success(let result):
//                print(result)
//                break
//            case.failure(let error):
//                print(error)
//            }
//
//        }
//
        
//        LCUser.requestVerificationCode(mobilePhoneNumber: ccc!){ result in
//            switch result {
//            case .success:
//                break
//            case .failure(let error):
//                print(error)
//            }
//
//        }
        
//
//        LCUser.requestVerificationCode(mobilePhoneNumber: ccc!){ reulst in
//            switch reulst {
//            case .success:
//                break
//            case .failure(let error):
//                print(error)
//            }
//
//        }
//
//        LCUser.requestVerificationCode(mobilePhoneNumber: ccc!){ reulst in
//            switch reulst {
//            case .success:
//                break
//            case .failure(let error):
//                print(error)
//            }
//
//        }
        
        AVUser.requestMobilePhoneVerify(ccc! ) { (succeeded,error) in
                        if (succeeded){
                            let alertController = UIAlertController(title: "验证码已发送",message: nil, preferredStyle: .alert)
                            //显示提示框
                            self.present(alertController, animated: true, completion: nil)
                             DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
                            return
                            print(succeeded)
                        }else{
                            if (error?._code == 212){
                                let alertController = UIAlertController(title: "手机号不能为空",message: nil, preferredStyle: .alert)
                                //显示提示框
                                self.present(alertController, animated: true, completion: nil)
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
                                self.isCounting = false
                                return
                            }
                            if   self.current?.mobilePhoneVerified == true {
                                let alertController = UIAlertController(title: "手机号以验证",message: nil, preferredStyle: .alert)
                                //显示提示框
                                self.present(alertController, animated: true, completion: nil)
                                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
                                if (error?._code == 119){
                                    let alertController = UIAlertController(title: "该操作已被禁止",message: nil, preferredStyle: .alert)
                                    //显示提示框
                                    self.present(alertController, animated: true, completion: nil)
                                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
                                }

                                self.isCounting = false
                                return

                            }
//                            print(error)

                            print(error as Any)
                        }
                    }
////
    }
    
    func updateTime(_ timer: Timer) {
        remainingSeconds -= 1
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
        phone.placeholder = "请输入手机号"
        yzm.placeholder = "请输入验证码"
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        if   current == nil{
            let alertController = UIAlertController(title: "系统提示",message: "请先登录", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: {
                action in
                _ = userxqTableViewController()
                self.navigationController?.popViewController(animated: true)
            })
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in
                _ = userxqTableViewController()
                self.navigationController?.popViewController(animated: true)
                
            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }else{
            
            print("yes")
        }
        print(current?.username!)
        
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
