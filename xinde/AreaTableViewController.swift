//
//  AreaTableViewController.swift
//  xinde
//
//  Created by 李力 on 2017/8/17.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import CoreData
import AVOSCloud
import UserNotifications
import LeanCloudSocial
import LeanCloudSocial.AVUser_SNS


class AreaTableViewController: UITableViewController, NSFetchedResultsControllerDelegate,UITextFieldDelegate,UISearchBarDelegate{

    @IBOutlet weak var searchbar: UISearchBar!
    var ctrls:[AVObject] = []
    
    // 搜索匹配的结果，Table View使用这个数组作为datasource
    var ctrlsel:[AVObject] = []

    var creas: [AVObject] = []
    
//    var ti: [AVObject] = []
    
    @IBAction func usernil(_ sender: Any) {
        if currentUser != nil {
            let loginView = dlTableViewController()
            //从下弹出一个界面作为登陆界面，completion作为闭包，可以写一些弹出loginView时的一些操作
            self.present(loginView, animated: true, completion: nil)
        }else{
            let loginView = dlTableViewController()
            //从下弹出一个界面作为登陆界面，completion作为闭包，可以写一些弹出loginView时的一些操作
            self.present(loginView, animated: true, completion: nil)
        }


    }
    
    @IBAction func backSegueback(segue : UIStoryboardSegue){
        
        if segue.identifier == "backMainForPback"{
            //获取返回的控制器
            let backVC = segue.source as! AddAreaTableViewController
            backVC.back = creas
            self.tableView.reloadData(czwk())
            return czwk()
        }
    }
    
//    func guanzhu() {
//
//        let ccc = AVUser.current()
//
//        let userobjectId = "5a0a9ea38d6d81005d4d89a6"
//
//        ccc?.follow(userobjectId, andCallback: { (succeeded, error) in
//            if succeeded {
//                print(succeeded,"成功")
//            }else{
//                print("不成功")
//            }
//        })
//    }
    
    func bangdinguser() {
//
//        AVUser.loginOrSignUp(withAuthData: [AnyHashable : Any], platform: AVOSCloudSNSPlatformWeiBo) { (avuser, error) in
//            if (error){
//                print(error,"error")
//                            }else{
//                                print("登陆跳转成功")
//                            }
//        }
        
//        AVUser.login(withAuthData: currentUser, platform: AVOSCloudSNSPlatformWeiBo, block: nil)
        
    
//        AVUser.loginOrSignUp(withAuthData: nil, platform: AVOSCloudSNSPlatformWeiBo) { (avuser, error) in
//            if (error){
//                print(error,"error")
//            }else{
//                print("登陆跳转成功")
//            }
//        }
//        AVUser.login(withAuthData: nil, platform: AVOSCloudSNSPlatformWeiBo) { (avuser, error) in
//            if ((error) != nil){
//                print(error,"error")
//            }else{
//                print("登陆跳转成功")
//            }
//        }
    
    }
    
    func weibo() {

        AVOSCloudSNS.login(callback: { (object, error) in
//            let authData = id as! [NSObject :NSObject]
            var authData = object as! [NSObject:NSObject]
            
            
        

            for aaa in authData {
                print(aaa.key,"aaa666")
                print(aaa.value,"bbb666")
            }
//
//            NSString *accessToken = object[@"access_token"];
//            NSString *username = object[@"username"];
//            NSString *avatar = object[@"avatar"];
//            NSDictionary *rawUser = object[@"raw-user"];

//            let username = authData[@objc]
            
            

//
//
////
//            let key = authData.keys
//
//
////            let  c = "screnn_name" as? NSString
//
//            let username = key["username"] as? NSString
//
//
//            print(c,"screnn")
//
//            print(key,"keykey")
//
//            let value = authData.values
//
//            print(value,"value")
//
//
            let key = "username" as NSString
////
            let c = authData[key]
            print(c as Any,"a6666")

            let valuee = "username" as NSString

            let b = authData[valuee]
            print(b as Any,"b666")
//
//
////
//            print(b,"b666")
//
//            let c = authData[key]


//
////
//            print(c as Any,"NSString")
////
//            for aaa in authData {
//                print(aaa.value,"aaa.username")
//
////                AVUser.login(withAuthData: aaa.value as! [AnyHashable : Any], platform: AVOSCloudSNSPlatformWeiBo, block: { (user, error) in
////
////                    print(user,"user")
////                })
//
//            }

            AVUser.login(withAuthData: [c!:b], platform: AVOSCloudSNSPlatformWeiBo, block: { (user, error) in
                print(user as Any,"user")
            })

//            AVUser.login(withAuthData: authData[key] as! [AnyHashable : Any], platform: AVOSCloudSNSPlatformWeiBo, block: { (user, error) in
//
//                                print(user,"user")
//                            })


//            AVUser.login(withAuthData: authData, platform: AVOSCloudSNSPlatformWeiBo, block: { (user, error) in
//
//                print(user,"user")
//            })

//            if (object != nil) {
//
//
//                print(id as Any,"登陆成功")
//            }else{
//                print(error!,"weibo")
//            }
//            for aaa in results {
//                print(aaa.value.username,"aaa")
//            }


//            AVUser.login(withAuthData: id as! [AnyHashable : Any], platform: AVOSCloudSNSPlatformWeiBo, block: { (user, error) in
//                print(user,"user")
//            })
        }, toPlatform: AVOSCloudSNSType.snsSinaWeibo)

//        AVOSCloudSNS.login(callback: { (id, error) in
//            let results = id as! [NSObject : AnyObject]
//
//
//            AVUser.login(withAuthData: id , platform: AVOSCloudSNSPlatformWeiBo, block: { (user, error) in
//                //                user?.username
//
//                print(id as Any,"user")
//            })
//            //            if (object != nil) {
//            //                print(id.self as Any,"登陆成功")
//            //            }else{
//            //                print(error!,"weibo")
//            //            }
//        }, toPlatform: AVOSCloudSNSType.snsSinaWeibo)
//


//    AVUser.login(withAuthData: weibo, platform: <#T##String!#>, block: <#T##AVUserResultBlock!##AVUserResultBlock!##(AVUser?, Error?) -> Void#>)


//        AVUser.loginOrSignUp(withAuthData: authData, platform: AVOSCloudSNSPlatformWeiBo) { (avuser, error) in
//            if (error){
//                print(error,"error")
//            }else{
//                print("登陆跳转成功")
//            }
//        }
//        AVUser.login(withAuthData: authData, platform: AVOSCloudSNSPlatformWeiBo) { (avuser, error) in
//            if ((error) != nil){
//                print(error,"error")
//            }else{
//                print("登陆跳转成功")
//            }
//        }

//        AVOSCloudSNS.login(callback: nil, toPlatform: AVOSCloudSNSType.snsSinaWeibo)

    }
    
    @IBAction func back123(segue : UIStoryboardSegue){
        
        if segue.identifier == "back"{
            //获取返回的控制器
            let backVC = segue.source as! xqTableViewController
            backVC.breaa = creas
            self.tableView.reloadData(czwk())
            return czwk()
        }
    }
    
    
//    
    var areas:[AreaMO] = []
    
    var crea: AVObject!
    
    var brea : AVObject!
        
    let currentUser = AVUser.current()
    
//    var fetchResultController: NSFetchedResultsController<AreaMO>!
    var countrySearchController = UISearchController()


    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.navigationController?.navigationBar.barTintColor = UIColor.black

        self.ctrlsel = self.creas
        //设置代理
//        self.searchbar.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // 注册TableViewCell
        self.countrySearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchBar.delegate = self  //两个样例使用不同的代理
//            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
//            controller.definesPresentationContext = true
            definesPresentationContext = true
            controller.searchBar.barStyle = .default
//            controller.searchBar.showsBookmarkButton = true
//            controller.searchBar.setImage(#imageLiteral(resourceName: "avatar_male_70"), for: .bookmark, state: .normal)
//            controller.searchBar.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
            
//            controller.searchBar.tintColor = UIColor(displayP3Red: 0.12, green: 0.74, blue: 0.13, alpha: 1.00)
//            controller.view.backgroundColor = UIColor (red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
            controller.searchBar.placeholder = "请输入搜索内容"
            controller.navigationController?.isNavigationBarHidden = true
            controller.searchBar.searchBarStyle = .minimal
            controller.searchBar.sizeToFit()
            controller.searchBar.setValue("取消", forKey:"_cancelButtonText")
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
    
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
//        searchbar.sizeToFit()
        sousou()
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        guanzhu()
//        weibo()
//        bangdinguser()
//        let fetchRequest: NSFetchRequest<AreaMO> = AreaMO.fetchRequest()
//        // 2
//        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
//        fetchRequest.sortDescriptors = [sortDescriptor]
//        if let appDelegate = (UIApplication.shared.delegate as? AppDelegate) {
//            let context = appDelegate.persistentContainer.viewContext
//            fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//            fetchResultController.delegate = self
//        }
        
//        do {
//            // 3
//            try fetchResultController.performFetch()
//            if let fetchedObjects = fetchResultController.fetchedObjects {
//                // 4
//                areas = fetchedObjects
//            }
//        } catch {
//            print(error)
//        }
        
//        if currentUser == nil {
//            let sb = UIStoryboard(name: "Main", bundle:nil)
//            let vc = sb.instantiateViewController(withIdentifier: "SecondViewController") as! dlTableViewController
//
//            self.present(vc, animated: true, completion: nil)
//
//        }
        
        
        let cc = AVFile()
        
        cc.clearCachedFile()
        
        let ccc = AVQuery()
        
        ccc.clearCachedResult()
        
        let deviceName = UIDevice.current.name  //获取设备名称 例如：梓辰的手机
        let sysName = UIDevice.current.systemName //获取系统名称 例如：iPhone OS
        let sysVersion = UIDevice.current.systemVersion //获取系统版本 例如：9.2
        let dev = UIDevice.current.identifierForVendor?.uuidString
        let deviceModel = UIDevice.current.model //获取设备的型号 例如：iPhone
        let mode = UIDevice.current.model

        print(deviceName,sysName,sysVersion,dev as Any,deviceModel,mode,"mode")
        
        let now = NSDate()
        
        let dform = DateFormatter()
        dform.dateFormat = "yyyy年MM月dd日 HH:mm:ss"
        print("当前日期：\(dform.string(from: now as Date))")
        prepareNotification()
        
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        
        refreshControl = UIRefreshControl()
        
        refreshControl?.addTarget(self, action: #selector(self.refreshData), for:.valueChanged)
        
        czwk()
                
        print(currentUser?.username! as Any)
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
                
        shuaxin()
        
//        self.searchbar.searchBarStyle = UISearchBarStyle.minimal
        
        self.tableView?.reloadData(czwk())
        
        
//        return czwk()

        
//        self.tableView.reloadData(czwk())
        
//        return czwk()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
 
    
    @IBAction func close(segue:UIStoryboardSegue) {

    }
    
    @IBAction func unwindToHomeScreen(segue:UIStoryboardSegue) {

    }
    func prepareNotification() {
        if creas.count <= 0 {
            return
        }
        // 1
        let randomNum = Int(arc4random_uniform(UInt32(creas.count)))
        let suggestedRestaurant = creas[randomNum]
        // 2
        let content = UNMutableNotificationContent()
        content.title = "Restaurant Recommendation"
        content.subtitle = "Try new food today"
        content.body = "I recommend you to check out \(suggestedRestaurant.className).The restaurant is one of your favorites. It is located at \(suggestedRestaurant.className). Would you like to give it a try?"
        content.sound = UNNotificationSound.default()
        // 3
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats:
            false)
        let request = UNNotificationRequest(identifier: "foodpin.restaurantSuggestion", content: content, trigger: trigger)
        // Schedule the notification
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    
    func chaxunusername(){
        let current = AVUser.current()
        
        
        current?.fetchInBackground{ (results,error) in
            
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
    
    func shuaxin(){
        OperationQueue.main.addOperation {
            
            self.tableView.reloadData()
        }
    }
    
    
    func refreshData() {
        czwk(needUpdate: true)
    }
    
       func czwk(needUpdate : Bool = false){
        
        let query = AVQuery(className : "cs")
        
        query.order(byDescending: "createdAt")
        
        if needUpdate{
            query.cachePolicy = .ignoreCache
        }else{
            query.cachePolicy = .cacheElseNetwork
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
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AreaTableViewCell
        
        let crea = creas[indexPath.row]
        
        cell.namelabel.text = crea["Name"] as? String
        
//        cell.contentlabel.text = crea["content"] as? String
        
        tableView.sectionFooterHeight = 20

        if let imgFile = crea["images"] as? AVFile{
            cell.tupianimage.image = UIImage(data: imgFile.getData()!)
        }
        
        
//        if creas.count < creas.count + 1 {
//
//            cell.tishi.isHidden = true
//        }
        
        // Configure the cell...
        
        return cell
    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.ctrls.count
//    }
//
//    // 创建各单元显示内容(创建参数indexPath指定的单元）
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
//        -> UITableViewCell {
//            // 为了提供表格显示性能，已创建完成的单元需重复使用
//            let identify:String = "cell"
//            // 同一形式的单元格重复使用，在声明时已注册
//            let cell = tableView.dequeueReusableCell(withIdentifier: identify,
//                                                     for: indexPath)
//            cell.accessoryType = .disclosureIndicator
//            //            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
//
//            let ccc = self.ctrls[indexPath.row]
//
//            //            if searchBar.text == ccc["Name"] as? String {
//            //                cell.textLabel?.text = ccc["Name"] as? String
//            //
//            //            }
//
//            cell.textLabel?.text = ccc["Name"] as? String
//
//
//
//            //            if self.ctrls[indexPath.row] != nil {
//            //                cell.textLabel?.text = "no"
//            //            }
//
//
//            return cell
//    }
    
    func sousou() {
        let ccc = AVQuery(className: "cs")
        
        ccc.findObjectsInBackground { (results, error) in
            if let results = results as? [AVObject] {
                self.ctrlsel = results
                print(self.ctrlsel,"self")
                
                
            }
        }
        
        
    }
    
    
    // 搜索代理UISearchBarDelegate方法，每次改变搜索内容时都会调用
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
//        self.searchbar.showsCancelButton = false
//        self.searchBar.showsCancelButton = true

        // 没有搜索内容时显示全部组件
        if searchText == "" {
//            self.searchbar.showsCancelButton = true
//            let uibutton = searchbar.value(forKey: "cancelButton") as! UIButton
//            uibutton.setTitle("取消", for: .normal)
//             self.creas = self.ctrls
//            czwk()
//            self.tableView.reloadData()
            
        }
        else { // 匹配用户输入内容的前缀(不区分大小写)
//            self.searchbar.showsCancelButton = true
//            let uibutton = searchbar.value(forKey: "cancelButton") as! UIButton
//            uibutton.setTitle("取消", for: .normal)

            
            self.creas = []
            
            for ctrl in self.ctrlsel {
                
                let ccc = ctrl["Name"] as? String
                print(ccc as Any,"results")
                
                if (ccc?.lowercased().hasPrefix(searchText.lowercased()))! {
                    self.creas.append(ctrl)
                }
                
//                let aaa = ctrl["content"] as? String
//                
//                if (aaa?.lowercased().hasPrefix(searchText.lowercased()))! != (ccc?.lowercased().hasPrefix(searchText.lowercased()))! {
//                }
//                

            }
            
            //
        }
        // 刷新Table View显示
        self.tableView.reloadData()
    }
    
    // 书签按钮触发事件
    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
//        self.searchbar.showsCancelButton = true

        print("搜索历史")
    }
    
    
    // 取消按钮触发事件
    
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            // 搜索内容置空
//            searchbar.text = nil
//            searchbar.resignFirstResponder()
//            self.searchbar.showsCancelButton = true
//            let uibutton = searchbar.value(forKey: "cancelButton") as! UIButton
//            uibutton.setTitle("取消", for: .normal)
            czwk()
            self.tableView.reloadData()
        }
    
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//     searchbar.resignFirstResponder()
//     }
    
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    //点击其他地方  收回键盘
//     func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        searchbar.resignFirstResponder()
//    }
//
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showxq"{
            
            let dest = segue.destination as! xqTableViewController
            dest.crea = creas[tableView.indexPathForSelectedRow!.row]
            dest.ccea = creas
        }
        
        if segue.identifier == "AddArea" {
            let destinationNavigationController = segue.destination as! UINavigationController
            let destinationController = destinationNavigationController.topViewController as! AddAreaTableViewController
        
//            let dest = segue.destination as! AddAreaTableViewController
            destinationController.brea = creas
//            dest.brea = [creas[tableView.indexPathForSelectedRow!.row]]

        }

    }
}
