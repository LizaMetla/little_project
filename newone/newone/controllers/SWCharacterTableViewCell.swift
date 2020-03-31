//
//  SWCharacterTableViewCell.swift
//  newone
//
//  Created by Елизавета Метла on 3/31/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class SWCharacterTableViewCell: UITableViewCell {
    @IBOutlet weak var nameFolder: UILabel!
    @IBOutlet weak var birthDateFolder: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
