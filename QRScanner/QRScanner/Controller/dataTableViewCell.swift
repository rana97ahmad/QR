//
//  dataTableViewCell.swift
//  QRScanner
//
//  Created by Rana Alahmedi on 6/19/19.
//  Copyright © 2019 KM, Abhilash. All rights reserved.
//

import UIKit

class dataTableViewCell: UITableViewCell {


    @IBOutlet weak var data2: UILabel!
    @IBOutlet weak var data1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
