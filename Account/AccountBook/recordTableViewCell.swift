//
//  recordTableViewCell.swift
//  AccountBook
//
//  Created by 陈华纲 on 2020/12/15.
//  Copyright © 2020 陈华纲. All rights reserved.
//

import UIKit

class recordTableViewCell: UITableViewCell {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
