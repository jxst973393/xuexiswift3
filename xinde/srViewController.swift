//
//  srViewController.swift
//  xinde
//
//  Created by 李力 on 2017/8/31.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import AVOSCloud
import CoreData
import AVOSCloud

class srViewController: UIViewController {

    var wrea: AreaMO!

    var crea : AVObject!
    
    var isVisited: Bool = true
    
    let currentUser = AVUser.current()
    
    var drea:[AVObject] = []

    var backSting : [AVObject] = []
    
    @IBAction func save1(_ sender: Any) {
        baocun()
//        _ = xqTableViewController()
//        self.navigationController?.popViewController(animated: true)
        
        backSting = drea
        //如果直接关联到exit，下面的performSegue方法不需要
        performSegue(withIdentifier: "backMainForP321", sender: nil)
        
        print(backSting,"aaa")
    }
    
    @IBOutlet weak var Nrtext: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = currentUser?.username

        print(crea.objectId!)
        if   user == nil{
            let alertController = UIAlertController(title: "系统提示",message: "请先登录", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: {
                action in
                let viewController = self.navigationController?.viewControllers[0]
                self.navigationController?.popToViewController(viewController as! UIViewController, animated: true)
            })
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in
                let viewController = self.navigationController?.viewControllers[0]
                self.navigationController?.popToViewController(viewController as! UIViewController, animated: true)

            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
//            _ = xqTableViewController()
//            self.navigationController?.popViewController(animated: true)

        }else{
            print("yes")
            
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func baocun(){
        
        let xqCloud = AVObject(className:"xqcontentcc")
        
        xqCloud["xqcontent"] = Nrtext.text
        
        let test = AVObject(className: "cs", objectId: crea.objectId!)
        
        let testt = AVObject(className: "_User",objectId: (currentUser?.objectId!)!)
        
        let testttt = AVObject(className: "_User", objectId: (currentUser?.username)!)
        
        let user = currentUser?.username
        
        let userimage = currentUser!["images"] as? AVFile
        
        xqCloud["plusername"] = user
        
        xqCloud["images"] = userimage
                                
        xqCloud.setObject( test, forKey:"xqgl")
        
        xqCloud.setObject( testt,forKey:"plgl")
        
        xqCloud.saveInBackground{ (suceedd,error) in
                if suceedd{
                    print("yes")
                }else{
                    print(error ?? "no")
                }
        }
        
    
}



    


    /*
      MARK: - Navigation
 
      In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      Get the new view controller using segue.destinationViewController.
      Pass the selected object to the new view controller.
     }
     */

    
    




}
