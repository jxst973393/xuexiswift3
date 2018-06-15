//
//  xqTableViewCell.swift
//  xinde
//
//  Created by 李力 on 2017/9/11.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import AVOSCloud

class xqTableViewCell: UITableViewCell {


    let currentUser = AVUser.current()
    var crea:AVObject!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var nametext: UILabel!
    @IBOutlet weak var userimage: UIImageView!
    @IBOutlet weak var hfusername: UILabel!
    @IBOutlet weak var qitausername: UILabel!
    @IBOutlet weak var hftext: UILabel!
    @IBOutlet weak var yc: UILabel!
    @IBOutlet weak var huifu: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        huifu.text = nil
                
        username.textColor = UIColor(red: 44/255, green: 80/255, blue: 228/255, alpha: 1)
        
        qitausername.textColor = UIColor(red: 44/255, green: 80/255, blue: 228/255, alpha: 1)
        
        
        // Initialization code
//        userimage.isUserInteractionEnabled = true
                
//        self.oldFrame = userimage.frame
//        var show = UITapGestureRecognizer(target: self, action: "showImage:")
//        userimage.addGestureRecognizer(show)
        
    }
    
//        func showImage(sender: UITapGestureRecognizer){
//            var image = userimage.image
//            var window = UIApplication.shared.keyWindow
//            var backgroundView = UIView(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
//            backgroundView.backgroundColor = UIColor.black
//            backgroundView.alpha = 0
//            var imageView = UIImageView(frame: userimage.frame)
//
//            imageView.image = image
//            imageView.tag = 1
//            backgroundView.addSubview(imageView)
//            window?.addSubview(backgroundView)
//            var hide = UITapGestureRecognizer(target: self, action: "hideImage:")
//
//            imageView.isUserInteractionEnabled = true
//            imageView.addGestureRecognizer(hide)
//            UIView.animate(withDuration: 0.3, animations:{ () in
//                var vsize = UIScreen.main.bounds.size
//                imageView.frame = CGRect(x:0.0, y: 0.0, width: vsize.width, height: vsize.height)
//                imageView.contentMode = .scaleAspectFit
//    //            backgroundView.alpha = 1
//            }, completion: {(finished:Bool) in })
//
//        }
//        var imageWidth:Int!
//        var imageHeight:Int!
//        var oldFrame:CGRect!;
//        required init(coder aDecoder:NSCoder){
//            super.init(coder: aDecoder)!
//        }
//
//
//        func hideImage(sender: UITapGestureRecognizer){
//            var backgroundView = sender.view as UIView?
//            if let view = backgroundView{
//                UIView.animate(withDuration: 0.3,
//                                           animations:{ () in
//                                            var imageView = view.viewWithTag(1) as! UIImageView
//                                            imageView.frame = self.oldFrame
//                                            imageView.alpha = 0
//
//                },
//                                           completion: {(finished:Bool) in
//                                            view.alpha = 0
//                                            view.superview?.removeFromSuperview()
//                                            view.removeFromSuperview()
//                })
//            }
//        }
//
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
