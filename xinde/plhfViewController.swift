//
//  plhfViewController.swift
//  xinde
//
//  Created by 李力 on 2017/12/21.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import AVOSCloud

class plhfViewController: UIViewController {

    var currentuser = AVUser.current()
    var crea:AVObject!
    var creas:[AVObject] = []
    var brea:AVObject!
    var krea : [AVObject] = []
    var mrea : [AVObject] = []
    @IBOutlet weak var plhf: UITextView!
    @IBAction func pl(_ sender: Any) {
        baocun()
//        _ = xqTableViewController()
//        self.navigationController?.popViewController(animated: true)
        
        mrea = krea
        performSegue(withIdentifier: "lypl", sender: nil)


    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "回复"
        print(brea.objectId!,"990")
        print(brea["plusername"]!,"009")
        chaxun()
        // Do any additional setup after loading the view.
    }
    
    func chaxun(){
        let query = AVQuery(className : "xqcontentcc")
        
        query.findObjectsInBackground{ (results,error) in
            
            if  let results = results as? [AVObject]{
                
                self.creas = results
                
            }else{
                print(error ?? "123")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func baocun(){
        let xqCloud = AVObject(className:"xqcontentcc")
        
//        print(xqCloud.objectId!)
        
        xqCloud["xqcontent"] = plhf.text
        
        let test = AVObject(className: "cs", objectId: crea.objectId!)
        
        let testt = AVObject(className: "_User",objectId: (currentuser?.objectId)!)
        
//        let testttt = AVObject(className: "_User", objectId: (currentuser?.username)!)
        
        let texx = AVObject(className: "xqcontentcc",objectId:brea.objectId!)
        
        let user = currentuser?.username
        
        let userimage = currentuser!["images"] as? AVFile
        
        xqCloud["plusername"] = user
        
        xqCloud["username"] = brea["plusername"] as? String
        
//        xqCloud["csgl"] = xqCloud.objectId as? String
        
        xqCloud["images"] = userimage
        
        xqCloud.setObject( test, forKey:"xqgl")
        
        xqCloud.setObject(texx, forKey: "csgl")
        
        xqCloud.setObject( testt,forKey:"plgl")
        
//        xqCloud.setObject(testttt, forKey: "username")
        
        xqCloud.saveInBackground{ (suceedd,error) in
            if suceedd{
                print("yes")
            }else{
                print(error ?? "no")
            }
        }
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
