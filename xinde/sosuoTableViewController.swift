////
////  sosuoTableViewController.swift
////  xinde
////
////  Created by 李力 on 2018/4/10.
////  Copyright © 2018年 李力. All rights reserved.
////
//
//import UIKit
//import AVOSCloud
//import LeanCloudSocial
//import LeanCloud
//
//class sosuoTableViewController: UITableViewController,UISearchBarDelegate {
//
//    @IBOutlet weak var searchbar: UISearchBar!
//
//    @IBOutlet weak var searchBar: UISearchBar!
//    var ctrls:[AVObject] = []
//
//    // 搜索匹配的结果，Table View使用这个数组作为datasource
//    var ctrlsel:[AVObject] = []
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.ctrlsel = self.ctrls
//        //设置代理
//        self.searchbar.delegate = self
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//        // 注册TableViewCell
//
//        tableView.tableFooterView = UIView(frame: CGRect.zero)
//
//
//        sousou()
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem
//    }
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
////            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
//
//            let ccc = self.ctrls[indexPath.row]
//
////            if searchBar.text == ccc["Name"] as? String {
////                cell.textLabel?.text = ccc["Name"] as? String
////
////            }
//
//            cell.textLabel?.text = ccc["Name"] as? String
//
//
//
////            if self.ctrls[indexPath.row] != nil {
////                cell.textLabel?.text = "no"
////            }
//
//
//            return cell
//    }
////
////    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        self.tableView!.deselectRow(at: indexPath, animated: true)
//////        let itemString = self.ctrls[indexPath.row]
//////
//////        var sb = UIStoryboard(name: "Main", bundle:nil)
//////        var vc = sb.instantiateViewController(withIdentifier: "showxqq") as! xqTableViewController
//////        self.navigationController?.pushViewController(vc, animated: true)
////
////        let secondViewController = xqTableViewController()
////        self.present(secondViewController, animated: true, completion: nil)
//////        self.performSegue(withIdentifier: "showxqq", sender: nil)
////    }
//
//    func sousou() {
//        let ccc = AVQuery(className: "cs")
//
//        ccc.findObjectsInBackground { (results, error) in
//            if let results = results as? [AVObject] {
//                self.ctrlsel = results
//                print(self.ctrlsel,"self")
//
//
//            }
//        }
//
//
//    }
//
//    // 搜索代理UISearchBarDelegate方法，每次改变搜索内容时都会调用
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        print(searchText)
//        // 没有搜索内容时显示全部组件
//        if searchText == "" {
//
////            self.ctrlsel = self.ctrls
//
//
//        }
//        else { // 匹配用户输入内容的前缀(不区分大小写)
//
//
//            self.ctrls = []
//
//            for ctrl in self.ctrlsel {
//
//              let ccc = ctrl["Name"] as? String
//                print(ccc as Any,"results")
//
//                if (ccc?.lowercased().hasPrefix(searchText.lowercased()))! {
//                    self.ctrls.append(ctrl)
//                }
//
////
////                if ctrl.lowercased().hasPrefix(searchText.lowercased()) {
////                    self.ctrlsel.append(ctrl)
////                }
//            }
//
////
//        }
//        // 刷新Table View显示
//        self.tableView.reloadData()
//    }
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//
//        searchbar.resignFirstResponder()
//    }
//
//    // 书签按钮触发事件
//    func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
//
//        print("搜索历史")
//    }
//
//    // 取消按钮触发事件
//
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        // 搜索内容置空
//        searchbar.text = ""
//        searchbar.resignFirstResponder()
//        self.ctrls = self.ctrlsel
//        self.tableView.reloadData()
//    }
//
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    // MARK: - Table view data source
//
//
//    /*
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
//    */
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//
//    // MARK: - Navigation
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//
//        if segue.identifier == "showxqq"{
//
//            let dest = segue.destination as! xqTableViewController
////            dest.crea = creas[tableView.indexPathForSelectedRow!.row]
////            dest.ccea = creas
////            dest.crea = self.ctrls[tableView.indexPathForSelectedRow!.row]
//        }
//
//    }
//
//
//}
import UIKit

class ViewController: UIViewController {
    
    //展示列表
    var tableView: UITableView!
    
    //搜索控制器
    var countrySearchController = UISearchController()
    
    //原始数据集
    let schoolArray = ["清华大学","北京大学","中国人民大学","北京交通大学","北京工业大学",
                       "北京航空航天大学","北京理工大学","北京科技大学","中国政法大学",
                       "中央财经大学","华北电力大学","北京体育大学","上海外国语大学","复旦大学",
                       "华东师范大学","上海大学","河北工业大学"]
    
    //搜索过滤后的结果集
    var searchArray:[String] = [String](){
        didSet  {self.tableView.reloadData()}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //创建表视图
        let tableViewFrame = CGRect(x: 0, y: 20, width: self.view.frame.width,
                                    height: self.view.frame.height-20)
        self.tableView = UITableView(frame: tableViewFrame, style:.plain)
        self.tableView!.delegate = self
        self.tableView!.dataSource = self
        //创建一个重用的单元格
        self.tableView!.register(UITableViewCell.self,
                                 forCellReuseIdentifier: "MyCell")
        self.view.addSubview(self.tableView!)
        
        //配置搜索控制器
        self.countrySearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchBar.delegate = self  //两个样例使用不同的代理
            controller.hidesNavigationBarDuringPresentation = false
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.searchBarStyle = .minimal
            controller.searchBar.sizeToFit()
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.countrySearchController.isActive {
            
            return self.searchArray.count
            
        } else {
            
            return self.schoolArray.count
            
        }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        
        -> UITableViewCell {
            
            //为了提供表格显示性能，已创建完成的单元需重复使用
            
            let identify:String = "MyCell"
            
            //同一形式的单元格重复使用，在声明时已注册
            
            let cell = tableView.dequeueReusableCell(withIdentifier: identify,
                                                     
                                                     for: indexPath)
            
            
            
            if self.countrySearchController.isActive {
                
                cell.textLabel?.text = self.searchArray[indexPath.row]
                
                return cell
                
            } else {
                
                cell.textLabel?.text = self.schoolArray[indexPath.row]
                
                return cell
                
            }
            
    }
    
}



extension ViewController: UITableViewDelegate
    
{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}



extension ViewController: UISearchBarDelegate {
    
    //点击搜索按钮
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchArray = self.schoolArray.filter { (school) -> Bool in
            
            return school.contains(searchBar.text!)
            
        }
        
    }
    
    
    
    //点击取消按钮
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        self.searchArray = self.schoolArray
        
    }
    
}
