//
//  xqTableViewController.swift
//  xinde
//
//  Created by 李力 on 2017/8/31.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import AVOSCloud
import CoreData
import LeanCloud
import UserNotifications
import Photos

class xqTableViewController: UITableViewController,UINavigationControllerDelegate,UIGestureRecognizerDelegate  {
    
    @IBOutlet weak var hidden: UILabel!
    @IBAction func acc(_ sender: Any) {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.navigationItem.setLeftBarButton(nil, animated: true)
    }
    var button : UIButton?
    
    @IBAction func acti (_ sender: Any) {
        
    let alert = UIAlertController(title: "请选择", message: nil, preferredStyle: .actionSheet)
        
        let actiont = UIAlertAction(title: "留言", style: .default){ (UIAlertAction) -> Void in

            self.performSegue(withIdentifier: "showshow", sender: (Any).self)
        }
        
        let action5 = UIAlertAction(title: "收藏", style: .default){(UIAlertAction) -> Void in
            
//            let cloud = AVObject(className: "cs", objectId: self.crea.objectId!)
            
            let xqCloud = AVObject(className:"sc")
            
            let qqq = AVObject(className: "cs", objectId: self.crea.objectId!)
            
            let test = AVObject(className: "cs", objectId: self.crea.objectId!)
            
            let testt = AVObject(className: "_User",objectId: (self.currentUser?.objectId!)!)
//
//            let testttt = AVObject(className: "_User", objectId: (self.currentUser?.username)!)
//
//            let user = self.currentUser?.username
//
//            let csimage = self.crea["images"] as? AVFile
//
//            let csusername = self.crea["Name"] as? String
//
////            let userimage = self.currentUser!["images"] as? AVFile
//
////            xqCloud["plusername"] = csusername
////
////            xqCloud["images"] = csimage
            
            qqq.setObject(testt, forKey: "usersc")
            
            xqCloud.setObject( test, forKey:"xqgl")
            
//            xqCloud.setObject(test, forKey: "usersc")
            
            xqCloud.setObject( testt,forKey:"plgl")
            
            test.setObject(xqCloud, forKey: "scsc")
            
            qqq.saveInBackground { (succeed,error) in
                if succeed{
                    print("yes")
                    let alertController = UIAlertController(title: "收藏成功", message: nil
                        , preferredStyle: .alert)
                    self.present(alertController, animated: true, completion: nil)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                        self.dismiss(animated: true, completion: nil)
                    }
                }else{
                    print(error,"no")
                }
                
            }
            
            xqCloud.saveInBackground{ (suceedd,error) in
                if suceedd{
                    print("yes")
                }else{
                    print(error ?? "no")
                }
            }
            
//            print(cloud,"cloud")
            
        }
        
        let action4 = UIAlertAction(title: "关注", style: .default) { (UIalertAction) -> Void in
            
            let ccc = AVUser.current()
            
            let cloudObject = AVObject(className: "cs", objectId: self.crea.objectId!)
            //
            //            let cloo = AVQuery(className: "cs")
            //
            //            let cccc = AVQuery(className: "cs")
            //
            ////            cloo.includeKey("plgl")
            //
            ////            cloo.includeKey("plgl.objectId")
            ////            cloo.selectKeys(["plgl.objectId"])
            //
            //            cccc.whereKey("plgl", equalTo: cloudObject)
            //
            //            cccc.findObjectsInBackground {(succeed,error) in
            //                print(succeed,"succeed")
            //
            //            }
//            let query = AVQuery(className: "cs")
//
//            let targetTodoFolder = AVObject(className: "_User", objectId: "5ac1d19f7565710045b21bd6")
//
//            //            query.whereKey("targetTodoFolder", equalTo:targetTodoFolder)
//            query.whereKey("plgl", equalTo: targetTodoFolder)
//
//            print(query,"queryy")
//
//
//
//
//            query.findObjectsInBackground({ (results, error) in
//                if let results = results as? [AVObject] {
//                    for aaa in results {
//                        print(aaa.objectId as Any,"objectid")
//
//                    }
//                    print(results,"qiqiqi")
//                }
//
//            })
//
//
//            //            cloo.findObjectsInBackground { (results,error) in
//            //
//            //                print(results,"results")
//            //
//            //            }
//
//            //            if crea["plgl"] as? String = cloudObject["objectId"] as? String {
//            //
//            //            }
//
//
//
//            //
//
    
            
            
            cloudObject.fetchInBackground(withKeys: ["plgl"], block: { (results, error) in
                let bbb = results?.object(forKey: "plgl") as? AVObject
                
                print(bbb?.objectId,"ctmm")
                
                ccc?.follow((bbb?.objectId)!, andCallback: { (suceed, error) in
                    if suceed {
                        print("关注成功")
                        let alertController = UIAlertController(title: "关注成功", message: nil
                            , preferredStyle: .alert)
                        self.present(alertController, animated: true, completion: nil)
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                            self.dismiss(animated: true, completion: nil)
                        }
                    }else{
                        print("关注失败")
                    }
                })
                
            })
            
            
            //            print(,"778899")
            
        }
        let action = UIAlertAction(title: "删除", style: .destructive) {(UIAlertAction) -> Void in
        self.cloudobject()
        self.breaa = self.ccea
        self.performSegue(withIdentifier: "back", sender: nil)
        }
    
        
        let action3 = UIAlertAction(title: "保存图片", style: .default) { (UIAlertAction) -> Void in
            let image = self.xqimage.image
            PHPhotoLibrary.shared().performChanges({PHAssetChangeRequest.creationRequestForAsset(from: image!)}) {(isSuccess:Bool,error:Error?)in
                if isSuccess{
                    let alertController = UIAlertController(title: "正在保存", message: nil
                        , preferredStyle: .alert)
                    self.present(alertController, animated: true, completion: nil)
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                        self.dismiss(animated: true, completion: nil)
                    }
            }
        }
}
    let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
                alert.addAction(actiont)
                alert.addAction(action5)
                alert.addAction(action3)
                alert.addAction(action4)
                alert.addAction(action)
                alert.addAction(cancel)
                self.present(alert, animated: true, completion: nil)
    }
    @IBAction func imagessave(_ sender: Any) {
        let image = self.xqimage.image
        
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image!)
        }) {(isSuccess:Bool,error: Error?) in
            if isSuccess {
                let alertController = UIAlertController(title: "正在保存", message: nil, preferredStyle: .alert)
                self.present(alertController, animated: true, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1){
                    self.dismiss(animated: true, completion: nil)}
                print("保存成功")
            }else{
                print("保存失败",error!.localizedDescription)
            }
            
        }
        
    }
    
    
//    @IBAction func imagesave(_ sender: Any) {
//
//        if let tutdou = crea["images"] as? AVFile {
//            xqimage.image = UIImage(data: tutdou.getData()!)
//            }
//        let tudou = crea["images"] as? AVFile
//        tudou?.getDataInBackground{ (data,error) in
//            self.xqimage.image = UIImage(data: (tudou?.getData()!)!)
//
//        }
//        UIImageWriteToSavedPhotosAlbum(xqimage.image!, <#T##completionTarget: Any?##Any?#>, <#T##completionSelector: Selector?##Selector?#>, <#T##contextInfo: UnsafeMutableRawPointer?##UnsafeMutableRawPointer?#>)
//        UIImageWriteToSavedPhotosAlbum(xqimage.image!, nil, nil, nil)
//print("123")
//    }
    let AppWidth: CGFloat = UIScreen.main.bounds.size.width
     let AppHeight: CGFloat = UIScreen.main.bounds.size.height

    var lastImageView : UIImageView?
    var scrollView : UIScrollView?
    var originalFrame : CGRect!
    var isDoubleTap : ObjCBool!
    var currentUser = AVUser.current()
    var images : [AVObject] = []
    var imgFilee:AVObject!
    var caaa : AVObject!
    var cuttr: AVUser!
    var baaa:UIImageView!
    var ccea : [AVObject] = []
    var breaa : [AVObject] = []
    var cui :AVObject!
//    var brea:AVObject!
    @IBOutlet weak var buttondi: UIBarButtonItem!

//    @IBAction func ly(_ sender: Any) {
//        
//        let srView = srViewController()
//        //跳转
//        self.navigationController?.pushViewController(srView, animated: true)
//
//    }
    
    
    
        @IBAction func backSegue666(segue : UIStoryboardSegue){
        if segue.identifier == "backMainForP321"{
            //获取返回的控制器
            let backVC = segue.source as! srViewController
            backVC.backSting = creas
            self.tableView.reloadData(listlb())
            return listlb()
        }
    }
    
    @IBAction func backSeguelypl(segue : UIStoryboardSegue){
        if segue.identifier == "lypl"{
            //获取返回的控制器
            let backVC = segue.source as! plhfViewController
            backVC.krea = creas
            self.tableView.reloadData(listlb())
            return listlb()
        }
    }
    
    var areas : [AVObject] = []
    var area : AreaMO!
    var crea : AVObject!
    var creas : [AVObject] = []
//    var cres: AVUser!
    
    @IBOutlet weak var xqimage: UIImageView!
//    @IBOutlet weak var userimages: UIImageView!
    
    @IBAction func ssc(_ sender: Any) {
       cloudobject()
        breaa = ccea
        performSegue(withIdentifier: "back", sender: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        definesPresentationContext = false

        refreshControl = UIRefreshControl()
        
        thetodo()
        
//        refreshControl?.addTarget(self, action: #selector(self.refreshData), for:.valueChanged)

        self.tableView?.reloadData()
        //        czwk()
        
        if let tutdou = crea["images"] as? AVFile {
            xqimage.image = UIImage(data: tutdou.getData()!)
            xqimage.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer.init(target: self, action: #selector(showZoomImageView(tap:)))
            self.xqimage.addGestureRecognizer(tap)
//            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressClick))
//            self.scrollView?.isUserInteractionEnabled = true
//            self.scrollView?.addGestureRecognizer(longPress)
}
        title = crea["Name"] as? String
        
        kankan()
        
        listlb()
        
        print(crea.objectId!,"why")
        
        prepareNotification()
        
        self.tableView?.reloadData(listlb())
        
        return listlb()
        
//        hflist()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func addLongPressGestureRecognizer() {
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressClick))
//        //      longPress.addTarget(self, action: #selector(xqTableViewController.longPressClick(_:)))
//
////        longPress.addTarget(self, action: #selector(xqTableViewController.longPressClick(_:)))
//
//        self.lastImageView?.isUserInteractionEnabled = true
//        self.lastImageView?.addGestureRecognizer(longPress)
//        self.scrollView?.addGestureRecognizer(longPress)
////        self.scrollView?.addSubview(longPress)
//        print("长按图片")
//
    }
    

    func thetodo() {

        let Thetodo = AVObject(className: "cs", objectId:crea.objectId! )

        Thetodo.setObject(0, forKey: "view")

        let cs = AVObject(className: "cs")

//        cs["view"] = Thetodo
//
//        cs.saveInBackground { (results,error) in
//            if results{
//                print(results.lcValue,"666")
//            }else{
//                print(error)
//            }
//
//        }

        Thetodo.saveInBackground{ (suceedd,error) in

            Thetodo.incrementKey("view")

            Thetodo.fetchWhenSave = true

            Thetodo.saveInBackground()

            print(Thetodo,suceedd)

        }


    }
    
    
    func kankan() {
        let kankan = AVQuery(className: "xqcontentcc")
        
        kankan.findObjectsInBackground { (results,error) in
            
            if let results = results as? [AVObject] {
                
                self.creas = results
                
                print(self.creas.count,"callen")
                
            }
            
            
        }
        
    }
    

    
    func save(){
        let alertController = UIAlertController(title: "保存成功",message: nil, preferredStyle: .alert)
        //显示提示框
        self.present(alertController, animated: true, completion: nil)
        //两秒钟后自动消失
        _ = xqTableViewController()
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = xqTableViewController();self.dismiss(animated: true, completion: nil)}
        self.dismiss(animated: true, completion:  nil )
        
//        self.scrollView?.addSubview(view)
        
//        self.scrollView?.addSubview(alertController)
        
    }
    
    func sendButtonClick() {
 
//
//        if Int((button?.state)!.rawValue) == 1 {
////            self.showmsboxx(_message: "yes")
////            return
//
//            let alertController = UIAlertController(title: "保存成功",message: nil, preferredStyle: .alert)
////            //显示提示框
//            self.present(alertController, animated: true, completion: nil)
////            //两秒钟后自动消失
//////            _ = xqTableViewController()
//
////
////            save()
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = xqTableViewController();self.dismiss(animated: true, completion:nil)}
////            self.dismiss(animated: true, completion:  nil )
//
////            self.scrollView?.bringSubview(toFront: button!)
        
            if self.button?.state.rawValue == 1 {
                let alertController = UIAlertController(title: "保存成功",message: nil, preferredStyle: .alert)
                //            //显示提示框
                self.present(alertController, animated: true, completion: nil)
                //            //两秒钟后自动消失
                ////            _ = xqTableViewController()
                
                //
                //            save()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = xqTableViewController();self.dismiss(animated: false, completion:nil)}
                //
            
                self.dismiss(animated: true, completion: save)
    
            self.lastImageView?.sendSubview(toBack:button!)
//            scrollView?.didAddSubview(UIView)
        }
//        let alertController = UIAlertController(title: "保存成功",message: nil, preferredStyle: .alert)
//        //显示提示框
//        self.present(alertController, animated: true, completion: nil)
//        //两秒钟后自动消失
//        //                _ = xqTableViewController()
//
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {      self.dismiss(animated: true, completion: nil)}
//        self.dismiss(animated: true, completion:  nil )
//
//        return
//
//        print(123)

//        if  Int(car.state.rawValue) == 1 {
//        let alertController = UIAlertController(title: "保存成功",message: nil, preferredStyle: .alert)
//        //显示提示框
//        self.present(alertController, animated: true, completion: nil)
//        //两秒钟后自动消失
//        //                _ = xqTableViewController()
//
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {      self.dismiss(animated: true, completion: nil)}
//        self.dismiss(animated: true, completion:  nil )
//
//        }
//

//        UIApplication.shared.keyWindow?.addSubview(car)
        
        
//        let image = self.lastImageView?.image
//
//        PHPhotoLibrary.shared().performChanges({
//            PHAssetChangeRequest.creationRequestForAsset(from: image!)
//        }) {(isSuccess,error) in
//            if isSuccess{
//                let alertController = UIAlertController(title: "保存成功",message: nil, preferredStyle: .alert)
//                //显示提示框
//                self.present(alertController, animated: true, completion: nil)
//                //两秒钟后自动消失
////                _ = xqTableViewController()
//
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {      self.dismiss(animated: true, completion: nil)}
//                self.dismiss(animated: true, completion:  nil )
//
//                print("保存成功")
//            }else{
//                print("保存失败",error!.localizedDescription)
//            }
//
//        }

    }
//    func longPress(_ longPress: BrowserCollectionViewCellLongPressClosure? = nil) {
//        longPressClosure = longPress
//    }
//    var longPressClosure: BrowserCollectionViewCellLongPressClosure? = nil
//
//    typealias BrowserCollectionViewCellLongPressClosure = (_ browserCell: xqTableViewCell) -> Void
//
//
//    @objc func longPressGesture(gesture: UILongPressGestureRecognizer) {
//        if longPressClosure != nil {
//            if gesture.state == .began {
//                let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//                let action = UIAlertAction(title: "保存相册", style: .default)
//                let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//                alert.addAction(action)
//                alert.addAction(cancel)
//                self.present(alert, animated: true, completion: nil)
//            }
//        }
//    }
//
    
    func showmsboxx(_message: String, _title: String = "提示"){
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertControllerStyle.alert)
        let btnOK = UIAlertAction(title: "好的", style: .default, handler: nil)
        alert.addAction(btnOK)
        self.present(alert, animated: true, completion: nil)
    }
    
    var colorLayer: CALayer!
    
    var alert : UIAlertController!
    
//    func initView()
//    {
//
//        self.colorLayer = CALayer()
//        self.colorLayer.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        self.colorLayer.position = CGPoint(x: self.view.bounds.size.width / 2, y: self.view.bounds.size.height / 2)
//        self.colorLayer.backgroundColor = UIColor.blue.cgColor
////        self.view.layer.addSublayer(self.colorLayer)
//        self.scrollView?.layer.addSublayer(self.colorLayer)
//
//    }
    

    func showZoomImageView(tap:UITapGestureRecognizer){
//        self.addLongPressGestureRecognizer()
//        self.longPressClick()

        let bgView = UIScrollView.init(frame: UIScreen.main.bounds)
        bgView.backgroundColor = UIColor.black
//                let longPress = UILongPressGestureRecognizer()//
//        longPress.addTarget(self, action: Selector(("longPressClick")))

//        let longPress = UILongPressGestureRecognizer()
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressClick))
       
        
       //        self.lastImageView?.isUserInteractionEnabled = true
//        self.scrollView?.addGestureRecognizer(longPress)
//        bgView.addGestureRecognizer(longPress)
//        longPress.addTarget(self, action: #selector(xqTableViewController.longPressClick(_:)))
//        self.addLongPressGestureRecognizer()
//        self.longPressClick()
//        self.sendButtonClick(button!)
//        sendButtonClick(button!)
//        self.lastImageView?.addGestureRecognizer(longPress)
//        self.scrollView?.addGestureRecognizer(longPress)
//        self.view.addGestureRecognizer(UILongPressGestureRecognizer)
        //        self.lastImageView?.addGestureRecognizer(longPress)
//        self.scrollView?.addGestureRecognizer(longPress)
        let tapBg = UITapGestureRecognizer.init(target: self, action: #selector(tapBgView(tapBgRecognizer:)))
        bgView.addGestureRecognizer(tapBg)
        let PicView = tap.view as! UIImageView
        let imageView = UIImageView.init()
        imageView.image = PicView.image

        
        let y : CGFloat? = (AppHeight - (xqimage.image?.size.height)! * AppWidth / (xqimage.image?.size.width)!)/2.0
        let height : CGFloat? = (xqimage.image?.size.height)! * AppWidth / (xqimage.image?.size.width)!
        imageView.frame = CGRect(x: 0, y: y!, width: AppWidth, height: height!)
        bgView.addSubview(imageView)
        UIApplication.shared.keyWindow?.addSubview(bgView)
        
        self.lastImageView = imageView
        self.originalFrame = imageView.frame
        self.scrollView = bgView
        self.scrollView?.maximumZoomScale = 1.5
        self.scrollView?.delegate = self
    
//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressGesture(gesture:)))

//        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressClick(car:)))
//       self.lastImageView?.isUserInteractionEnabled = true
////        self.scrollView?.addGestureRecognizer(longPress)
////                bgView.addGestureRecognizer(longPress)
//        self.lastImageView?.addGestureRecognizer(longPress)
//        self.scrollView?.addGestureRecognizer(longPress)
//        bgView.addGestureRecognizer(longPress)
//        view.addGestureRecognizer(longPress)
//        scrollView?.addGestureRecognizer(longPress)
//
//        self.initView()
        
        
        button = UIButton()
        button?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button?.frame = CGRect(x: 262, y: 667, width: 110 , height: 30)
        button?.backgroundColor = UIColor.red
        button?.setTitleColor(UIColor.white, for: .normal)
        button?.setTitle("下载图片", for: .normal)
        button?.addTarget(self, action: #selector(xqTableViewController.sendButtonClick), for: .touchUpInside)
      
//        if button?.state.rawValue == 1 {
//            showmsboxx(_message: "ccc")
//            return
//        }
        self.scrollView?.addSubview(button!)
        self.lastImageView?.addSubview(button!)
        scrollView?.addSubview(button!)
        lastImageView?.addSubview(button!)
        bgView.addSubview(button!)
//        self.scrollView?.bringSubview(toFront: button!)
        
//
//        scrollView?.panGestureRecognizer
//        scrollView?.pinchGestureRecognizer
//        scrollView?.directionalPressGestureRecognizer
//        scrollView?.gestureRecognizers
//
//
//        scrollView?.panGestureRecognizer
//        scrollView?.pinchGestureRecognizer
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(longPressClick(car:)))
        self.lastImageView?.isUserInteractionEnabled = true
        //        self.scrollView?.addGestureRecognizer(longPress)
        //                bgView.addGestureRecognizer(longPress)
        self.lastImageView?.addGestureRecognizer(longPress)
        self.scrollView?.addGestureRecognizer(longPress)
        bgView.addGestureRecognizer(longPress)
        view.addGestureRecognizer(longPress)
        scrollView?.addGestureRecognizer(longPress)

        
//        showmsboxx(_message: "ccc")
//        return
    

        //        self.showmsboxx(_message: "aaa")
        
//        self.sendButtonClick()
//        
//        self.view.bringSubview(toFront: button!)
//
//        self.view.bringSubview(toFront: bgView)


        //        let aler = UIAlertController()

//        scrollView?.addSubview(UIAlertAction)

        
//        longPress.minimumPressDuration = 1
//        longPress.allowableMovement = 15
//        longPress.numberOfTouchesRequired = 1
//        bgView.addGestureRecognizer(longPress)
//        self.xqimage?.addGestureRecognizer(longPress)
//        self.scrollView?.addGestureRecognizer(longPress)
        
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

    
    func longPressClick(car:UIAlertController){
        
        let alertt = UIAlertController()
        let abc = UIAlertAction()

        let acc = UIAlertAction(title: "保存相册", style: .default)
            self.alert = UIAlertController()
//            self.alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let action = UIAlertAction(title: "保存相册", style: .default)
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        
        
        self.present(alert, animated: true, completion: nil)
        
        self.scrollView?.didMoveToWindow()

        self.scrollView?.didMoveToSuperview()

        //        self.lastImageView?.addGestureRecognizer(long)

//        if (long.state == UIGestureRecognizerState.ended)
//        {
//            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//            let action = UIAlertAction(title: "保存相册", style: .default)
//            let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//            alert.addAction(action)
//            alert.addAction(cancel)
//            self.present(alert, animated: true, completion: nil)
//            self.scrollView?.addGestureRecognizer(long)
//            self.lastImageView?.addGestureRecognizer(long)
//            print("长按手势完毕")
//        }else{
//            let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//            let action = UIAlertAction(title: "保存相册", style: .default)
//            let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
//            alert.addAction(action)
//            alert.addAction(cancel)
//            self.present(alert, animated: true, completion: nil)
//            self.scrollView?.addGestureRecognizer(long)
//            self.lastImageView?.addGestureRecognizer(long)
//            print("长按手势进行中...")
//        }
//

        //        let alert = UIAlertController(title: "请选择", message: nil, preferredStyle: .actionSheet)
        //        let action = UIAlertAction(title: "保存相册", style: .default) {(UIAlertAction) -> Void in
        //
        //            let image = self.xqimage.image
        //
        //            PHPhotoLibrary.shared().performChanges({
        //                PHAssetChangeRequest.creationRequestForAsset(from: image!)
        //            }) { (isSuccess: Bool, error: Error?) in
        //                if isSuccess {
        //                    print("保存成功!")
        //                } else{
        //                    print("保存失败：", error!.localizedDescription)
        //                }
        //            }
        //            print("确定按钮点击事件")
        //        }
        //        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        //        alert.addAction(action)
        //        alert.addAction(cancel)
        //        self.present(alert, animated: true, completion: nil)
        //        self.scrollView?.addGestureRecognizer(UIAlertController)
        //        dismiss(animated: true, completion: nil)

//            (self.scrollView?.addGestureRecognizer(long))!
//        self.lastImageView?.addGestureRecognizer(long)

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
    
    func cloudobject(){
        let test = AVObject(className: "cs", objectId: crea.objectId!)
        
        test.fetchInBackground(withKeys: ["plgl"], block: {(results,error) in
            let ttt = results?.object(forKey: "plgl") as? AVObject
            
            print(ttt?.objectId,"ctmm1")
            
            test.deleteInBackground { (result,errpr) in
                if ttt?.objectId == self.currentUser?.objectId {
                    print("yes")
                }else{
                    self.showmsboxx(_message: "不能删除他人发帖内容")
                    return
                        print(error,"why")
                }
            }
            
            
//            ttt?.deleteInBackground { (resultss,error) in
//
//                if resultss {
//
//                    print("yes")
//                }else{
//                    self.showmsboxx(_message: "不能删除他人发帖内容")
//                    return
//
//                        print(error,"why")
//                }
//
//            }
            
            
        })
        
    
//
//        test.fetchInBackground(withKeys: ["plgl"], block: { (results, error) in
//            let bbb = results?.object(forKey: "plgl") as? AVObject
//
//            print(bbb?.objectId,"ctmm")
//
//
//            bbb?.deleteInBackground { (results,error) in
//                if results {
//                    print("yes")
//                }else{
//                    self.showmsboxx(_message: "不能删除他人发帖内容")
//                    return
//
//                    print(error,"why")
//                }
//
//            }
//            bbb?.deleteInBackground{(results,error) in
//                if results{
//                    print("yes")
//                }else{
//                    self.showmsboxx(_message: "不能删除他人发帖内容")
//                    return
//                    print(error ?? "no")
//                }
//            }

            
            
//        })
        
    }
    
    @IBOutlet weak var zzz: UILabel!
    
    func hflist() {
        let aaa = AVObject(className: "cs",objectId:crea.objectId!)
        
        
        let ccc = AVQuery(className: "hfpl")
        
        
        ccc.whereKey("csgl", equalTo: aaa)
        
        ccc.order(byDescending: "createdAt")
        
        
        ccc.findObjectsInBackground{ ( results ,error) in
            
            if  let results = results as? [AVObject]{
                
                print(results)
                
                self.creas = results
                
                OperationQueue.main.addOperation {
                    
                    self.refreshControl?.endRefreshing()
                    
                    self.tableView.reloadData()
                }
            }else{
                print(error ?? "error")
            }
            
        }
    }
    
    func arrea(){
        let test = AVObject(className: "xqcontentcc")
        
        test.refreshInBackground{ (results,error) in
            if let results = results as? [AVObject]{
                self.creas = results
            }
        }
    }
    
    func listlb(){
        let aaa = AVObject(className: "cs",objectId:crea.objectId!)
        
        //        let chaxun = AVObject(className: "_User",objectId: "59ba6a64a0bb9f0064bca8ba")
        
        let ccc = AVQuery(className: "xqcontentcc")
        
        
        //        let cccc = AVQuery(className: "_User")
        
        ccc.whereKey("xqgl", equalTo: aaa)
        
//        ccc.whereKey("csgl", equalTo: crea.objectId!)
        //
        //        ccc.includeKey("plgl")
        //
        //        ccc.includeKey("plgl.username")
        
        ccc.order(byDescending: "createdAt")
        
        //        ccc.limit = 10
        
        ccc.findObjectsInBackground{ ( results ,error) in
            
            if  let results = results as? [AVObject]{
                
                print(results)
                
                self.creas = results
                
                OperationQueue.main.addOperation {
                    
                    self.refreshControl?.endRefreshing()
                    
                    self.tableView.reloadData()
                }
            }else{
                print(error ?? "error")
            }
            
        }
        aaa.refresh()
        
    }
    
    // MARK: - Table view data source
    
     override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return creas.count
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let brea = creas[indexPath.row]

        if editingStyle == .delete {

            if currentUser?.username == brea["plusername"] as? String {
                let test = AVObject(className: "xqcontentcc", objectId: brea.objectId!)
                
                test.deleteInBackground{ (results,error) in
                    if results{
                        print("yes")
                    }else{
                        self.showmsboxx(_message: "只能删除自己的留言")
                        return
                        print(error!,"why")
                    }
                    
                }
            }else{
                self.showmsboxx(_message: "只能删除自己的留言")
                return

                print("不是当前用户")
            }
        }
            
        OperationQueue.main.addOperation {
            
            self.refreshControl?.endRefreshing()
            
            self.tableView.reloadData()
        }
        
        self.tableView?.reloadData(listlb())
        
        return listlb()
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "删除"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    let  alert = UIAlertController(title: "请选择", message: nil, preferredStyle: .actionSheet)
    
        let alert1 = UIAlertAction(title: "评论", style: .default, handler: { (UIAlertAction) -> Void in
            
            self.performSegue(withIdentifier: "plhf", sender: (Any).self)
        })
        
        let alert3 = UIAlertAction(title: "关注", style: .default) { (UIAlertAction) in
            let ccc = AVUser.current()
            
            let brea = self.creas[indexPath.row]
            print(AVUser.followeeQuery("USER_OBJECT_ID"),"USER_OBJECT_ID")
            print(AVUser.followerQuery("USER_OBJECT_ID"),"USER_OBJECT_ID")
            
            let cloudObject = AVObject(className: "xqcontentcc", objectId: brea.objectId!)
        
            cloudObject.fetchInBackground(withKeys: ["plgl"], block: { (results, error) in
                let bbb = results?.object(forKey: "plgl") as? AVObject
                
                print(bbb?.objectId,"ctmm")
                
                ccc?.follow((bbb?.objectId)!, andCallback: { (suceed, error) in
                    if suceed {
                        print("关注成功")
                        let alertController = UIAlertController(title: "关注成功", message: nil
                            , preferredStyle: .alert)
                        self.present(alertController, animated: true, completion: nil)
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                            self.dismiss(animated: true, completion: nil)
                        }
                    }else{
                        let alertController = UIAlertController(title: "关注失败", message: nil
                            , preferredStyle: .alert)
                        self.present(alertController, animated: true, completion: nil)
                        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
                            self.dismiss(animated: true, completion: nil)
                        }
                        print("关注失败")
                    }
                })
                
            })
            
        }
        
        let alert2 = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alert.addAction(alert1)
        alert.addAction(alert3)
        alert.addAction(alert2)
        self.present(alert, animated: true, completion: nil)

        
    }
    
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "Call", for: indexPath) as! xqTableViewCell
        
            let brea = creas[indexPath.row]

            cell.username.text = brea["plusername"] as? String
            
            cell.nametext.text = brea["xqcontent"] as? String
            
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            
            if let imgFile = brea["images"] as? AVFile{
                cell.userimage.image = UIImage(data: imgFile.getData()!)
            }
        
//        label.enabled = false
        // 隐藏单个组建
        cell.huifu.isEnabled = false
            print(brea.objectId!,"www")
        
//        cell.huifu.text = nilii
        
        if brea["username"] == nil {
            cell.huifu.isEnabled = false
        }else{
            cell.huifu.text = "回复"
        }
        
//        cell.qitausername.text = brea["username"] as? String
        
        if  brea["csgl"] as? String == brea["xqgl"] as? String {
            
            cell.qitausername.text = brea["username"] as? String
            
        }
        
        
        return cell
     }
    
    func tup() {
        if let imgFile = crea["images"] as? AVFile{
            xqimage.image = UIImage(data: imgFile.getData()!)
        }
    }
    
    

    func prepareNotification() {
        if creas.count <= 0{
            return
        }
        let randomNum = Int(arc4random_uniform(UInt32(creas.count)))
        let suggestedcreas = creas[randomNum]
        
        let content = UNMutableNotificationContent()
        
        content.title = "新通知"
        content.subtitle = "有人回复您的消息"
        content.body = "123?"
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        
        let request = UNNotificationRequest(identifier: "foodpin.restaurantSuggestion", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.

        
        if segue.identifier == "showshow"{

            let dest = segue.destination as! srViewController
            dest.crea = self.crea
            dest.drea = creas

        }
//
        
        if segue.identifier == "plhf"{
            
            let dest = segue.destination as! plhfViewController
            dest.crea = crea
            dest.brea = creas[(tableView.indexPathForSelectedRow?.row)!]
            dest.krea = creas
        }
        
    }

}
//
//    func enterStepDetail(){
////        let sb = UIStoryboard(name: "Main", bundle:nil)
////        let vc = sb.instantiateViewController(withIdentifier: "fdtppViewController") as! fdtppViewController
////            vc.crea = self.crea
//
////        let vc = sb.instantiateInitialViewController()
////        if let imgFile = crea["images"] as? AVFile{
////            xqimage.image = UIImage(data: imgFile.getData()!)
////        }
////        print(crea,"456")
//        let previewVC = fdtppViewController()
////        let previewVC = fdtppViewController(coder: crea)
////        backSting = dluser.text
////        let backSting123 = imgFilee
//
//        cui = crea
//        print(crea,"777")
////        if let imgFile = crea["images"] as? AVFile{
////                        xqimage.image = UIImage(data: imgFile.getData()!)
////                    }
////      if let caaa = crea["images"] as? AVFile {
////            xqimage.image = UIImage(data: caaa.getData()!)
////
////        }
////        caaa = xqimage.image
//        print(cui)
////        caaa = crea
////        baaa = xqimage
////        print(baaa.image!)
////        //如果直接关联到exit，下面的performSegue方法不需要
////        performSegue(withIdentifier: "backMainForP111", sender: nil)
//
////        dismiss(animated: true, completion: nil)
//
//        self.navigationController?.pushViewController(previewVC, animated:true)
////        let alertController = UIAlertController(title: "点击了图片",message: nil, preferredStyle: .alert)
////        //显示提示框
////        self.present(alertController, animated: true, completion: nil)
////        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {        _ = MyTableViewController();self.dismiss(animated: true, completion: nil)}
////        return
////        let tudou = CGSize(width: 240, height: 150)
//
////
////        if let tudou = crea["images"] as? AVFile {
////            xqimage.image = UIImage(data: tudou.getData()!)
////        }
//
//
//           }

//     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        //可再每个连线处类似按钮的东西加上identifier，即可判断不同指向
//       if let imgFilee = crea["images"] as? AVFile{
//            xqimage.image = UIImage(data: imgFilee.getData()!)
//        }
////        let ve = segue.destination as! fdtppViewController
////        ve.crty = imgFilee
//
//
//
//        if segue.identifier == "fdtppViewController" {
//
//            //不带导航的方式
//            let ve = segue.identifier as! fdtppViewController
//            ve.crea = self.crea
//            print(crea, "123")
//
//        }
//    }
//    func showImage(sender: UITapGestureRecognizer){
//        var image = xqimage.image
//        var window = UIApplication.shared.keyWindow
//        var backgroundView = UIView(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
//        backgroundView.backgroundColor = UIColor.black
//        backgroundView.alpha = 0
//        var imageView = UIImageView(frame: xqimage.frame)
//
//        imageView.image = image
//        imageView.tag = 1
//        backgroundView.addSubview(imageView)
//        window?.addSubview(backgroundView)
//        var hide = UITapGestureRecognizer(target: self, action: "hideImage:")
//
//        imageView.isUserInteractionEnabled = true
//        imageView.addGestureRecognizer(hide)
//        UIView.animate(withDuration: 0.3, animations:{ () in
//            var vsize = UIScreen.main.bounds.size
//            imageView.frame = CGRect(x:0.0, y: 0.0, width: vsize.width, height: vsize.height)
//            imageView.contentMode = .scaleAspectFit
////            backgroundView.alpha = 1
//        }, completion: {(finished:Bool) in })
//
//    }
//    var imageWidth:Int!
//    var imageHeight:Int!
//    var oldFrame:CGRect!;
//    required init(coder aDecoder:NSCoder){
//        super.init(coder: aDecoder)!
//    }
//
//
//    func hideImage(sender: UITapGestureRecognizer){
//        var backgroundView = sender.view as UIView?
//        if let view = backgroundView{
//            UIView.animate(withDuration: 0.3,
//                                       animations:{ () in
//                                        var imageView = view.viewWithTag(1) as! UIImageView
//                                        imageView.frame = self.oldFrame
//                                        imageView.alpha = 0
//
//            },
//                                       completion: {(finished:Bool) in
//                                        view.alpha = 0
//                                        view.superview?.removeFromSuperview()
//                                        view.removeFromSuperview()
//            })
//        }
//    }


//    func chaxunusername(){
//        let query = AVQuery(className: "_User")
//
//        query.findObjectsInBackground{ (results,error) in
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
//                print(error ?? "123")
//            }
//        }
//
//    }


//    func czwk(){
////
//        let aaa = AVObject(className: "cs",objectId:crea.objectId!)
//
//        //        let chaxun = AVObject(className: "_User",objectId: "59ba6a64a0bb9f0064bca8ba")
//
//        let ccc = AVQuery(className: "xqcontentcc")
//
//        //        let cccc = AVQuery(className: "_User")
//
//        ccc.whereKey("xqgl", equalTo: aaa)
//
////        ccc.includeKey("plgl")
//
//        ccc.includeKey("plgl.username")
//
//        ccc.order(byDescending: "createdAt")
//
//        ccc.limit = 1000
//
//        ccc.findObjectsInBackground { (results , error) in
//            if let results = results as? [AVObject] {
////                self.creas = results.first as! [AVObject]
//                print(results)
//            }else{
//            print(error ?? "no")
//            }
//        }
//    }


