//
//  txViewController.swift
//  xinde
//
//  Created by 李力 on 2018/3/1.
//  Copyright © 2018年 李力. All rights reserved.
//

import UIKit
import AVOSCloud
import Photos

class txViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var area: AreaMO!
    
    var crea: AVObject!
    var creas : [AVObject] = []
    
    var lll : UIImageView!
    
    var randmoUser = AVUser.current()
    
    var curren = AVUser.current()
    
    var back = AVUser.current()

    @IBAction func gh(_ sender: Any) {
        
        let alert = UIAlertController(title: "请选择", message: nil, preferredStyle: .actionSheet)
        
        let action = UIAlertAction(title: "更换头像", style: .default) { (UIAlertAction) -> Void in
            self.ghtx()
                    }
        
        let action2 = UIAlertAction(title: "保存头像", style: .default) { (UIAlertAction) -> Void in
            let image = self.usertx.image!
        PHPhotoLibrary.shared().performChanges({PHAssetChangeRequest.creationRequestForAsset(from: image)}) { (isSuccess :Bool,error:Error?) in
                if isSuccess{
                    print("yes")
                }else {
                    print("no")
                }
            }
        }
        
        let action3 = UIAlertAction(title: "拍照选取头像", style: .default){ (UIAlertAction) -> Void in
            let imagePicker = UIImagePickerController()
            
            let isAvailable = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
            imagePicker.sourceType = .photoLibrary
            
            if isAvailable {
                imagePicker.sourceType = .camera
                imagePicker.showsCameraControls = true
                //            imagePicker.cameraDevice = UIImagePickerControllerCameraDevice.front
            }
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion:{})
            imagePicker.allowsEditing = false
        }
        
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(action2)
//        alert.addAction(action3)
        alert.addAction(cancel)
        back = randmoUser

        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func ccccc(_ sender: Any) {
        back = randmoUser
        
        
        //如果直接关联到exit，下面的performSegue方法不需要
        performSegue(withIdentifier: "ghtx", sender: nil)
        print(back?.username,"666")
    }
    
    
    @IBOutlet weak var usertx: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "头像"
        
        if let image = randmoUser!["images"] as? AVFile {
            usertx.image = UIImage(data: image.getData()!)
        }
        
//        curren = back
//        //如果直接关联到exit，下面的performSegue方法不需要
////        performSegue(withIdentifier: "ghtx", sender: nil)
//        print(curren?.username,"666")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            usertx.image = selectedImage
            usertx.contentMode = .scaleAspectFill
            usertx.clipsToBounds = true
        }
        let leadingConstraint = NSLayoutConstraint(item: usertx, attribute: .leading, relatedBy: .equal, toItem: usertx.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstrain = NSLayoutConstraint(item: usertx, attribute: .trailing, relatedBy: .equal, toItem: usertx.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstrain.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: usertx, attribute: .top, relatedBy: .equal, toItem: usertx.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let buttomConstraint = NSLayoutConstraint(item: usertx, attribute: .bottom, relatedBy: .equal, toItem: usertx.superview, attribute: .bottom, multiplier: 1, constant: 0)
        buttomConstraint.isActive = true
        
        let cloudObject = AVObject(className: "_User")
        
        if let creas = self.usertx.image {
            // 2
            if let imageData = UIImageJPEGRepresentation(creas,0.1) {
                self.area.image = NSData(data: imageData)
            }
            
            let originImg = UIImage(data: self.area.image! as Data)
            
            let factor = (originImg!.size.width > 1024) ? (1024 / originImg!.size.width) : 1
            
            let scaledImg = UIImage(data: self.area.image! as Data, scale: factor)
            
            let file = AVFile(name: "file", data: UIImageJPEGRepresentation(scaledImg!,0.1)!)
            
            self.curren!["images"] = file
            
            self.curren?.saveInBackground{ (succeed,error) in
                if succeed{
                    print(cloudObject.objectId as Any)
                    print("ccc")
                    let alert = UIAlertController(title: "更换成功", message: nil, preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){ self.dismiss(animated: true, completion: nil)
                    }
                }else{
                    print(error ?? "no")
                }
            }
        }
        back = randmoUser

        dismiss(animated: true, completion: ccccc(_:))
    }
    
    func ghtx() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                self.area = AreaMO(context: appDelegate.persistentContainer.viewContext)
            }
            
            self.present(imagePicker, animated: true)

        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        if segue.identifier == "genghuantouxiang"{
//            
//            let dest = segue.destination as! userxqTableViewController
//            dest.crea = self.crea
//            dest.crea = creas[UITableView.indexPathForSelectedRow!.row]
//            
//            
//        }
//        
//        
//    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
