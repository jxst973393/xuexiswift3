//
//  listTableViewCell.swift
//  xinde
//
//  Created by 李力 on 2018/5/3.
//  Copyright © 2018年 李力. All rights reserved.
//

import UIKit
import AVOSCloud

class listTableViewCell: UITableViewCell {
    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var Cell: UIView!
    @IBOutlet weak var images: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        images.clipsToBounds = true
        
        images.layer.cornerRadius = 20
        
        //        Cell.layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10)
        
        Cell.layer.shadowColor = UIColor(white: 000000, alpha: 0.3).cgColor
        
        Cell.layer.shadowOffset = CGSize(width: -7, height: 7)
        
        Cell.layer.shadowOpacity = 1
        
        Cell.clipsToBounds = false
        
        Name.textColor = UIColor.white
        
        Name.clipsToBounds = false
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
