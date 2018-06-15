//
//  webwViewController.swift
//  xinde
//
//  Created by 李力 on 2018/1/23.
//  Copyright © 2018年 李力. All rights reserved.
//

import UIKit
import WebKit

class webwViewController: UIViewController {

//    var webView = WKWebView()
    
//    @IBOutlet weak var webwiew: UIWebView!
    
    
    @IBOutlet weak var web: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let safariController = webwViewController(URL: url!,entersReaderIfAvailable: true)
//        
//        presentViewController(safariController, animated: true, completion: nil)
        
//        let url = URL(string: "https://weibo.com/1653478050/profile?rightmod=1&wvr=6&mod=personnumber/")
        
        let url = URL(string: "https://piaw5dpd.api.lncld.net/1.1/go/com.leancloud.pIaW5DPdhbEqv5NBz200eaug-gzGzoHsz/classes/cs/5acc517b9f54542bb236f791")
        
        // 2.建立网络请求
        let request = URLRequest(url: url!)
        
        // 3.加载网络请求
        web.loadRequest(request)
        
        self.navigationController?.navigationBar.prefersLargeTitles = false

        //        webv.load(request)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//    func setUpWKwebView() {
//
//        let webConfiguration = WKWebViewConfiguration()
//        let myURL = URL(string: "https://weibo.com")
//        webView = WKWebView(frame: view.bounds, configuration: webConfiguration)
//        let myRequest = URLRequest(url: myURL!)
//        webView.load(myRequest)
//        view.addSubview(webView)
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
