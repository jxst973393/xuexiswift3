//
//  fdtppViewController.swift
//  xinde
//
//  Created by 李力 on 2017/12/13.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import AVOSCloud

class fdtppViewController: UIViewController,UIScrollViewDelegate {
    var currentUser = AVUser.current()
    var cuttr: AVUser!
    var crty :AVObject!
    var ccrea : AVObject!
    var crea : AVObject!
    var index:Int = 0
//    var xqimage : [String] = []
    var areas : [AVObject] = []
    var area : AreaMO!
    var creas : [AVObject] = []
    var scrollView:UIScrollView?
    var lastImageView:UIImageView?
    var originalFrame:CGRect!
    var isDoubleTap:ObjCBool!
    //使用sb拖控件显示图片
    @IBOutlet weak var myImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(showZoomImageView(tap:)))
        self.myImageView.addGestureRecognizer(tap)
    }
    
    func showZoomImageView( tap : UITapGestureRecognizer) {
        let bgView = UIScrollView.init(frame: UIScreen.main.bounds)
        bgView.backgroundColor = UIColor.black
        let tapBg = UITapGestureRecognizer.init(target: self, action: #selector(tapBgView(tapBgRecognizer:)))
        bgView.addGestureRecognizer(tapBg)
        let picView = tap.view as! UIImageView//view 强制转换uiimageView
        let imageView = UIImageView.init()
        imageView.image = picView.image;
        imageView.frame = bgView.convert(picView.frame, from: self.view)
        bgView.addSubview(imageView)
        UIApplication.shared.keyWindow?.addSubview(bgView)
        self.lastImageView = imageView
        self.originalFrame = imageView.frame
        self.scrollView = bgView
        self.scrollView?.maximumZoomScale = 1.5
        self.scrollView?.delegate = self
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            options: UIViewAnimationOptions.beginFromCurrentState,
            animations: {
                var frame = imageView.frame
                frame.size.width = bgView.frame.size.width
                frame.size.height = frame.size.width * ((imageView.image?.size.height)! / (imageView.image?.size.width)!)
                frame.origin.x = 0
                frame.origin.y = (bgView.frame.size.height - frame.size.height) * 0.5
                imageView.frame = frame
        }, completion: nil
        )
        
    }
    
    func tapBgView(tapBgRecognizer:UITapGestureRecognizer)
    {
        self.scrollView?.contentOffset = CGPoint.zero
        UIView.animate(withDuration: 0.5, animations: {
            self.lastImageView?.frame = self.originalFrame
            tapBgRecognizer.view?.backgroundColor = UIColor.clear
        }) { (finished:Bool) in
            tapBgRecognizer.view?.removeFromSuperview()
            self.scrollView = nil
            self.lastImageView = nil
        }
    }
    
    //正确代理回调方法
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.lastImageView
    }
    
    //错误代理回调方法
    //    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
    //        return self.lastImageView
    //    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

