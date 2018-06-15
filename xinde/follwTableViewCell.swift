//
//  follwTableViewCell.swift
//  xinde
//
//  Created by 李力 on 2018/4/3.
//  Copyright © 2018年 李力. All rights reserved.
//

import UIKit
import AVOSCloud
import LeanCloud
import LeanCloudSocial

class follwTableViewCell: UITableViewCell {
//    @IBOutlet weak var Call: UIView!
    @IBOutlet weak var useravt: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        username.text = "666"
        
        useravt.frame.size.width = 66
        
        useravt.frame.size.height = 66
        
//        Call.frame.size.width = 375
//
//        Call.frame.size.height = 78.5
    
        // Initialization code
    }

    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
