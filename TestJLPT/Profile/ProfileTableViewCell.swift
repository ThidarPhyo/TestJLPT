//
//  ProfileTableViewCell.swift
//  TestJLPT
//
//  Created by cmStudent on 10/01/2023.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var iconImg: UIImageView!
    
    @IBOutlet weak var nameLB: UILabel!
    
    
    @IBOutlet weak var arrowImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
