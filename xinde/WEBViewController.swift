//
//  WEBViewController.swift
//  xinde
//
//  Created by 李力 on 2018/1/23.
//  Copyright © 2018年 李力. All rights reserved.
//

import UIKit
import WebKit

class WEBViewController: UIViewController,WKUIDelegate {
    
    var webView: WKWebView!

    func setUpWKwebView() {
        
        let webConfiguration = WKWebViewConfiguration()
        let myURL = URL(string: "https://weibo.com")
        webView = WKWebView(frame: view.bounds, configuration: webConfiguration)
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        view.addSubview(webView)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpWKwebView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
