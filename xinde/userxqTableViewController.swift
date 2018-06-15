//
//  userxqTableViewController.swift
//  xinde
//
//  Created by 李力 on 2017/11/13.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import AVOSCloud

class userxqTableViewController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIGestureRecognizerDelegate  {
    var area: AreaMO!
    let randmorUser = AVUser()
    let AppWidth: CGFloat = UIScreen.main.bounds.size.width
    let AppHeight: CGFloat = UIScreen.main.bounds.size.height
    
    var lastImageView : UIImageView?
    var scrollView : UIScrollView?
    var originalFrame : CGRect!
    var isDoubleTap : ObjCBool!
    var urea:UIImage!
    var back = AVUser.current()

    @IBOutlet weak var userccc: UITableViewCell!
    
    @IBOutlet weak var useraf: UIView!
    var creas: [AVObject] = []
    
    var areas:[AreaMO] = []
    
    var crea: AVObject!
    
    var cu = AVUser.current()

    var current = AVUser.current()
    
    @IBOutlet weak var userimage: UIImageView!
   
    @IBOutlet weak var userphonenumber: UILabel!
    
    @IBOutlet weak var tips: UILabel!
    

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
//        IndexPath) {
//        if indexPath.row == 0 {
//            let alert = UIAlertController(title: "请选择", message: nil, preferredStyle: .actionSheet)
//            let action = UIAlertAction(title: "更换头像", style: .default) { (UIAlertAction) -> Void in
//                self.ghtx()
//            }
//        let action1 = UIAlertAction(title: "查看头像", style: .default) { (UIAlertAction) -> Void in
//                        if let imgFile = self.curren!["images"] as? AVFile{
//                            self.userimage.image = UIImage(data: imgFile.getData()!)
//                            self.userimage.isUserInteractionEnabled = true
//                            let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.showZoomImageView(tap:)))
//                            self.userccc.addGestureRecognizer(tap)
//                        }
//
//            func showZoomImageView(tap:UITapGestureRecognizer){
//                let bgView = UIScrollView.init(frame: UIScreen.main.bounds)
//                bgView.backgroundColor = UIColor.black
//                let tapBg = UITapGestureRecognizer.init(target: self, action: #selector(self.tapBgView(tapBgRecognizer:)))
//                bgView.addGestureRecognizer(tapBg)
//                let PicView = tap.view as! UIImageView
//                let imageView = UIImageView.init()
//                imageView.image = PicView.image
//
//                let y : CGFloat? = (self.AppHeight - (self.userimage.image?.size.height)! * self.AppWidth / (self.userimage.image?.size.width)!)/2.0
//                let height : CGFloat? = (self.userimage.image?.size.height)! * self.AppWidth / (self.userimage.image?.size.width)!
//                imageView.frame = CGRect(x: 0, y: y!, width: self.AppWidth, height: height!)
//                bgView.addSubview(imageView)
//                UIApplication.shared.keyWindow?.addSubview(bgView)
//
//                self.lastImageView = imageView
//                self.originalFrame = imageView.frame
//                self.scrollView = bgView
//                self.scrollView?.maximumZoomScale = 1.5
//                self.scrollView?.delegate = self
//
//                UIView.animate(withDuration: 1.5, delay: 0.0, options: UIViewAnimationOptions.beginFromCurrentState, animations: {
//                    var frame = imageView.frame
//                    frame.size.width = bgView.frame.size.width
//                    frame.size.height = frame.size.width * ((imageView.image?.size.height)! / (imageView.image?.size.width)!)
//                    frame.origin.x = 0
//                    frame.origin.y = (bgView.frame.size.height - frame.size.height) * 0.5
//                    imageView.frame = frame
//                }, completion:nil)
//
//            }
//                    }
//            let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//            alert.addAction(action)
//          alert.addAction(action1)
//            alert.addAction(cancel)
//            self.present(alert, animated: true, completion: nil)
//
//        }
//
//    }
//
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            userimage.image = selectedImage
            userimage.contentMode = .scaleAspectFill
            userimage.clipsToBounds = true
        }
        let leadingConstraint = NSLayoutConstraint(item: userimage, attribute: .leading, relatedBy: .equal, toItem: userimage.superview, attribute: .leading, multiplier: 1, constant: 0)
        leadingConstraint.isActive = true
    
        let trailingConstrain = NSLayoutConstraint(item: userimage, attribute: .trailing, relatedBy: .equal, toItem: userimage.superview, attribute: .trailing, multiplier: 1, constant: 0)
        trailingConstrain.isActive = true
        
        let topConstraint = NSLayoutConstraint(item: userimage, attribute: .top, relatedBy: .equal, toItem: userimage.superview, attribute: .top, multiplier: 1, constant: 0)
        topConstraint.isActive = true
        
        let buttomConstraint = NSLayoutConstraint(item: userimage, attribute: .bottom, relatedBy: .equal, toItem: userimage.superview, attribute: .bottom, multiplier: 1, constant: 0)
        buttomConstraint.isActive = true
        
        let cloudObject = AVObject(className: "_User")
        
        if let creas = self.userimage.image {
            // 2
            if let imageData = UIImageJPEGRepresentation(creas,0.1) {
                self.area.image = NSData(data: imageData)
            }
            
            let originImg = UIImage(data: self.area.image! as Data)
            
            let factor = (originImg!.size.width > 1024) ? (1024 / originImg!.size.width) : 1
            
            let scaledImg = UIImage(data: self.area.image! as Data, scale: factor)
            
            let file = AVFile(name: "file", data: UIImageJPEGRepresentation(scaledImg!,0.1)!)
            
            self.current!["images"] = file
            
            self.current?.saveInBackground{ (succeed,error) in
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
        dismiss(animated: true, completion: nil)
    }
    
    func showZoomImageView(tap:UITapGestureRecognizer){        
        let bgView = UIScrollView.init(frame: UIScreen.main.bounds)
        bgView.backgroundColor = UIColor.black
        let tapBg = UITapGestureRecognizer.init(target: self, action: #selector(tapBgView(tapBgRecognizer:)))
        bgView.addGestureRecognizer(tapBg)
        let PicView = tap.view as! UIImageView
        let imageView = UIImageView.init()
        imageView.image = PicView.image
        
        
        let y : CGFloat? = (AppHeight - (userimage.image?.size.height)! * AppWidth / (userimage.image?.size.width)!)/2.0
        let height : CGFloat? = (userimage.image?.size.height)! * AppWidth / (userimage.image?.size.width)!
        imageView.frame = CGRect(x: 0, y: y!, width: AppWidth, height: height!)
        bgView.addSubview(imageView)
        UIApplication.shared.keyWindow?.addSubview(bgView)
        
        self.lastImageView = imageView
        self.originalFrame = imageView.frame
        self.scrollView = bgView
        self.scrollView?.maximumZoomScale = 1.5
        self.scrollView?.delegate = self
        
        UIView.animate(withDuration: 1.5, delay: 0.0, options: UIViewAnimationOptions.beginFromCurrentState, animations: {
            var frame = imageView.frame
            frame.size.width = bgView.frame.size.width
            frame.size.height = frame.size.width * ((imageView.image?.size.height)! / (imageView.image?.size.width)!)
            frame.origin.x = 0
            frame.origin.y = (bgView.frame.size.height - frame.size.height) * 0.5
            imageView.frame = frame
        }, completion:nil)
        print("放大图片")
    }
    
    
    func tapBgView(tapBgRecognizer:UITapGestureRecognizer){
        let y : CGFloat? = (AppHeight - (lastImageView?.image?.size.height)! * AppWidth / (lastImageView?.image?.size.width)!)/2.0
        let height : CGFloat? = (lastImageView?.image?.size.height)! * AppWidth / (lastImageView?.image?.size.width)!
        lastImageView?.frame = CGRect(x: 0, y: y!, width: AppWidth, height: height!)
        self.scrollView?.contentOffset = CGPoint.zero
        UIView.animate(withDuration: 0, animations: {
            self.lastImageView?.frame = self.originalFrame!
            tapBgRecognizer.view?.backgroundColor = UIColor.clear
        }){ (finished:Bool) in
            tapBgRecognizer.view?.removeFromSuperview()
            self.scrollView = nil
            self.lastImageView = nil
        }
        
        print("缩小图片")
        
    }
    
    
    override func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        
        return self.lastImageView
    }
    
    @IBAction func userout(_ sender: Any) {
        AVUser.logOut()
        _ = AreaTableViewController()
        self.navigationController?.popToRootViewController(animated: true)
//        self.presentationController(
        
        func refreshData() {
            czwk(needUpdate: true)
        }
        
        func czwk(needUpdate : Bool = false){
            let query = AVQuery(className : "_User")
            
            query.order(byDescending: "createdAt")
            
            if needUpdate{
                query.cachePolicy = .ignoreCache
            }else{
                query.cachePolicy = .cacheThenNetwork
                query.maxCacheAge  = 60 * 2
                if query.hasCachedResult(){
                    print("yes")
                }
            }
            query.findObjectsInBackground{ (results,error) in
                
                if  let results = results as? [AVObject]{
                    
                    self.creas = results
                    
                    OperationQueue.main.addOperation {
                        
                        self.refreshControl?.endRefreshing()
                        
                        self.tableView.reloadData()
                    }
                }else{
                    print(error ?? "123")
                }
            }
            
        }


    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        //传值到P1
//        if segue.identifier == "goP1Segue"{//判断是哪个segue被触发
//            //设置目标控制器
//            let dest = segue.destination as! txViewController
//            dest.curren = randmorUser
//            
//            
//        }
//        
//    }
    
    
    @IBAction func ghtx1(_ sender: Any) {
        back = current
        
        
        //如果直接关联到exit，下面的performSegue方法不需要
        performSegue(withIdentifier: "ghtx1", sender: nil)
//        print(back?.username,"666")
    }
    
    

    @IBAction func ghtx(segue : UIStoryboardSegue){
        if segue.identifier == "ghtx"{
            //获取返回的控制器
            let ghtx = segue.source as! txViewController
            
            
            current = ghtx.back
            
            if let  img = current!["images"] as? AVFile {
                userimage.image = UIImage(data: img.getData()!)
                print(img.url,"img")
            }
            
//            if let imgFile = backVC.back!["images"] as? AVFile {
//                userimage.image = UIImage(data: imgFile.getData()!)
//            }
    
//            self.tableView.reloadData(czwk1())
//            return czwk1()
        }
    }
    func czwk1(){
        //        let current = AVUser.current()
        
        current?.fetchInBackground{ (results,error) in
            
            if  let results = results {
                
                self.creas = [results]
                
                print(self.creas,"777")
                
                OperationQueue.main.addOperation {
                    
                    self.refreshControl?.endRefreshing()
                    
                    self.tableView.reloadData()
                }
    }
        }
    }
        
    func ghtx() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            
            print(imagePicker,"ccc")
            
            if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
                self.area = AreaMO(context: appDelegate.persistentContainer.viewContext)
            }

                self.present(imagePicker, animated: true)
        }
    }
    
    @IBOutlet weak var username: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if   current?.username == nil{
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
            
            tips.text = "手机号未验证"
        }else{
            if current?.mobilePhoneVerified == true {
                tips.text = "手机号以验证"
            }else{
                tips.text = "手机号未验证"
            }
            print("yes")
        }
//        czwk1()
//        self.tableView.reloadData(czwk1())
//        return czwk1()

        back = current
//        performSegue(withIdentifier: "ghtx1", sender: nil)

        title = current?.username
        
        username.text = current?.username
        
        userphonenumber.text = current?.mobilePhoneNumber
        
        if current != nil {
            if let imgFile = current!["images"] as? AVFile{
                userimage.image = UIImage(data: imgFile.getData()!)
//                let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.showZoomImageView(tap:)))
//                self.userimage.addGestureRecognizer(tap)
//                self.tableView.reloadData(czwk1())
//                return czwk1()
                print(imgFile.url,"imgFile")
            }
        }else{
            userimage.image = #imageLiteral(resourceName: "avatar_male_70")
        }
        
        let button =   UIButton(type: .system)
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        button.setImage(UIImage(named:"@left"), for: .normal)
//        button.setBackgroundImage(UIImage(named:"@left"),for:.normal)
        button.setTitle("返回", for: .normal)
        button.addTarget(self, action: #selector(ghtx1(_:)), for: .touchUpInside)

        let leftBarBtn = UIBarButtonItem(customView: button)

        //用于消除左边空隙，要不然按钮顶不到最前面
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)

        spacer.width = -10;

        self.navigationItem.leftBarButtonItems = [spacer,leftBarBtn]

        self.navigationController?.interactivePopGestureRecognizer!.delegate = self
        


        
//        let leftBarbtn = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(ghtx1(_:)))
//
////        let backbar = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(ghtx1(_:)))
//
//        leftBarbtn.image = UIImage(named: "@left")
////
//        self.navigationItem.leftBarButtonItem = leftBarbtn
//
//        self.navigationItem.backBarButtonItem = backbar
        
//        self.navigationItem.performSelector(inBackground: #selector(ghtx1(_:)), with: nil)
        
        
//        czwk()
//        self.tableView.reloadData(czwk())
//        return czwk()
        
//        ceil.selectionStyle = UITableViewCellSelectionStyle.None

        
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
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if (gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer) {
            //只有二级以及以下的页面允许手势返回
            return self.navigationController!.viewControllers.count > 1
        }
        return true
    }
    
    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

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

    
    // MARK: - Navigation

//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//
////        if segue.identifier == "showxqx"{
////
////            let dest = segue.destination as! xqTableViewController
////            dest.crea = creas[tableView.indexPathForSelectedRow!.row]
////
//        if segue.identifier == "chuanzhi"{
//
//            let dest = segue.destination as! txViewController
//            dest.curren = self.curren
//
//        }
//
//    }
//

}
