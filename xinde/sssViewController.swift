//
//  sssViewController.swift
//  xinde
//
//  Created by 李力 on 2018/4/26.
//  Copyright © 2018年 李力. All rights reserved.
//

import UIKit

class sssViewController: UIViewController,UITableViewDelegate,UISearchBarDelegate {

    //展示列表
    var tableView: UITableView!
    
    //搜索控制器
    var countrySearchController = UISearchController()
    
    //原始数据集
    let schoolArray = ["123","北京大学","中国人民大学","北京交通大学","北京工业大学",
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
//        self.tableView!.dataSource = self as! UITableViewDataSource
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

//extension ViewController: UITableViewDataSource
//{
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//        if self.countrySearchController.isActive {
//            
//            return self.searchArray.count
//            
//        } else {
//            
//            return self.schoolArray.count
//            
//        }
//        
//    }
//    
//    
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
//        
//        -> UITableViewCell {
//            
//            //为了提供表格显示性能，已创建完成的单元需重复使用
//            
//            let identify:String = "MyCell"
//            
//            //同一形式的单元格重复使用，在声明时已注册
//            
//            let cell = tableView.dequeueReusableCell(withIdentifier: identify,
//                                                     
//                                                     for: indexPath)
//            
//            
//            
//            if self.countrySearchController.isActive {
//                
//                cell.textLabel?.text = self.searchArray[indexPath.row]
//                
//                return cell
//                
//            } else {
//                
//                cell.textLabel?.text = self.schoolArray[indexPath.row]
//                
//                return cell
//                
//            }
//            
//    }
//    
//}
//
//
//
//extension sssViewController: UITableViewDelegate
//    
//{
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        tableView.deselectRow(at: indexPath, animated: true)
//        
//    }
//    
//}
//
//
//
//extension ViewController: UISearchBarDelegate {
//    
//    //点击搜索按钮
//    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        
//        self.searchArray = self.schoolArray.filter { (school) -> Bool in
//            
//            return school.contains(searchBar.text!)
//            
//        }
//        
//    }
//    
//    
//    
//    //点击取消按钮
//    
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        
//        self.searchArray = self.schoolArray
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


