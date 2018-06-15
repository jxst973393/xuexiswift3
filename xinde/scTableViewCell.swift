//
//  scTableViewCell.swift
//  xinde
//
//  Created by 李力 on 2018/5/16.
//  Copyright © 2018年 李力. All rights reserved.
//

import UIKit

class scTableViewCell: UITableViewCell {

    @IBOutlet weak var username: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
