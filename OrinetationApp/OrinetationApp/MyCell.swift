//
//  MyCell.swift
//  OrinetationApp
//
//  Created by Yogendra Tandel on 30/12/18.
//  Copyright © 2018 Yogendra Tandel. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    @IBOutlet weak var lbl_Title: UILabel!
    @IBOutlet weak var btn_Click: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
