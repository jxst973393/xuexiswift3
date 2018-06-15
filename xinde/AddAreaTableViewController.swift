//
//  AddAreaTableViewController.swift
//  xinde
//
//  Created by 李力 on 2017/8/17.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import CoreData
import AVOSCloud
import LeanCloud

class AddAreaTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    var area: AreaMO!
    var crea: AVObject!
    var brea:[AVObject] = []
    var backSting: AVObject? //segue返回数据
    var back : [AVObject] = []
    let current = AVUser.current()

    @IBOutlet weak var xqTText: UITextView!
    @IBOutlet weak var xinxiText: UITextField!
//    @IBOutlet weak var xqText: UITextField!
    @IBOutlet weak var tupianimages: UIImageView!
    
    var isVisited: Bool = true
    
    let currentUser = AVUser.current()

    override func viewDidLoad() {
        super.viewDidLoad()
        tupianimages.image = #imageLiteral(resourceName: "beijing")
        xinxiText.placeholder = "请输入标题"
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        let user = currentUser?.username
        
        if   user == nil{
            let alertController = UIAlertController(title: "系统提示",message: "请先登录", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: {
                action in
                self.dismiss(animated: true, completion: nil)
            })
            let okAction = UIAlertAction(title: "好的", style: .default, handler: {
                action in
                self.dismiss(animated: true, completion: nil)
            })
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }else{
            print("yes")
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
        IndexPath) {
        if indexPath.row == 0 {
//            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
//                let imagePicker = UIImagePickerController()
//                imagePicker.allowsEditing = true
//                imagePicker.sourceType = .photoLibrary
//                imagePicker.delegate = self
//
//                present(imagePicker, animated: true)
//            }
        }

        let alert = UIAlertController(title: "请选择", message: nil, preferredStyle: .actionSheet)
            let action = UIAlertAction(title: "选取相册照片", style: .default){ (UIAlertAction) -> Void in
                if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                                    let imagePicker = UIImagePickerController()
                                    imagePicker.allowsEditing = true
                                    imagePicker.sourceType = .photoLibrary
                                    imagePicker.delegate = self
            
                    self.present(imagePicker, animated: true)
                                }
            }
            
    let action2 = UIAlertAction(title: "拍照", style: .default){ (UIAlertAction) -> Void in
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
            alert.addAction(cancel)
            self.present(alert, animated: true, completion: nil)
            
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            tupianimages.image = selectedImage
            tupianimages.contentMode = .scaleAspectFill
            tupianimages.clipsToBounds = true
        }
        let leadingConstraint = NSLayoutConstraint(item: tupianimages, attribute: .leading, relatedBy: .equal, toItem: tupianimages.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
        
        let trailingConstrain = NSLayoutConstraint(item: tupianimages, attribute: .trailing, relatedBy: .equal, toItem: tupianimages.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstrain.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: tupianimages, attribute: .top, relatedBy: .equal, toItem: tupianimages.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let buttomConstraint = NSLayoutConstraint(item: tupianimages, attribute: .bottom, relatedBy: .equal, toItem: tupianimages.superview, attribute: .bottom, multiplier: 1, constant: 0)
        buttomConstraint.isActive = true
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func save(_ sender: Any) {
        //

        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
            area = AreaMO(context: appDelegate.persistentContainer.viewContext)
            area.name = xinxiText.text
            area.content = xqTText.text
            area.isVisited = isVisited
            
            if let creas = tupianimages.image {
                // 2
                if let imageData = UIImageJPEGRepresentation(creas,0.1) {
                    area.image = NSData(data: imageData)

                }
                
            print("Saving data to context ...")
            savecloud(area: area)
            appDelegate.saveContext()
            back = brea

        }
            let alertController = UIAlertController(title: "正在上传",message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)

//        dismiss(animated: true, completion: nil)
    }
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(1*NSEC_PER_SEC))/Double(NSEC_PER_SEC)) {
            //两秒钟后自动消失
           self.performSegue(withIdentifier: "backMainForPback", sender: nil)
        }
    
    }

}

func savecloud(area:AreaMO!){
    let cloudObject = AVObject(className: "cs")
    
    cloudObject["Name"] = area.name
    
    cloudObject["content"] = area.content
    
    let current = AVUser.current()
    
    let testt = AVObject(className: "_User",objectId: (current?.objectId)!)
    
    cloudObject.setObject( testt,forKey:"plgl")
        
    let originImg = UIImage(data: area.image! as Data)
    
    let factor = (originImg!.size.width > 1024) ? (1024 / originImg!.size.width) : 1
    
    let scaledImg = UIImage(data: area.image! as Data, scale: factor)
    
    let file = AVFile(name: "file", data: UIImageJPEGRepresentation(scaledImg!,0.1)!)
        
    cloudObject["images"] = file
    
    cloudObject.saveInBackground{ (succeed,error) in

        if succeed{
            print(cloudObject.objectId as Any)
        }else{
            print(error ?? "no")
        }
    }
}
