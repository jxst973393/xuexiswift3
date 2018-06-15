//
//  AreaTableViewCell.swift
//  xinde
//
//  Created by 李力 on 2017/8/17.
//  Copyright © 2017年 李力. All rights reserved.
//

import UIKit
import CoreData
import AVOSCloud

class AreaTableViewCell: UITableViewCell {

    @IBOutlet weak var tishi: UILabel!
    @IBOutlet weak var Cell: UIView!
    @IBOutlet weak var namelabel: UILabel!
    @IBOutlet weak var tupianimage: UIImageView!
//    @IBAction func backSegue123(segue : UIStoryboardSegue){
//        if segue.identifier == "backMainForP123"{
//            //获取返回的控制器
//            let backVC = segue.source as! AddAreaTableViewController
//            //            let bac = UITableViewCell() as! AreaTableViewCell
//            let crrr = backVC.crea
//            
//            if let tudou = crrr!["images"] as? AVFile {
//                tupianimage.image = UIImage(data: tudou.getData()!)
//            }
//            
//            
//            //           bac.namelabel.text  = backVC.backSting
//            //            cell.tupianimage.image  = backVC.tupianimages.image
//            
//        }
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tupianimage.clipsToBounds = true
        
        tupianimage.layer.cornerRadius = 20
        
        //        Cell.layoutMargins = UIEdgeInsetsMake(10, 10, 10, 10)
        
        Cell.layer.shadowColor = UIColor(white: 000000, alpha: 0.3).cgColor
        
        Cell.layer.shadowOffset = CGSize(width: -7, height: 7)
        
        Cell.layer.shadowOpacity = 1
        
        Cell.clipsToBounds = false
        
        namelabel.textColor = UIColor.white
        
        namelabel.clipsToBounds = false
        
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
