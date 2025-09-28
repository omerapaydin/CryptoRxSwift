//
//  Cell.swift
//  CryptoRxSwift
//
//  Created by Ömer on 29.09.2025.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var textLabel2: UILabel!
    @IBOutlet weak var textLabel1: UILabel!
    @IBOutlet weak var imageView1: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
