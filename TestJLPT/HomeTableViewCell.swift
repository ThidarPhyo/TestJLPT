//
//  HomeTableViewCell.swift
//  TestJLPT
//
//  Created by cmStudent on 22/12/2022.
//

import UIKit

protocol HomeTableCellDelegate : AnyObject {
    func didTapAction(with title : String)
}

class HomeTableViewCell: UITableViewCell {
    
    
    weak var delegate :HomeTableCellDelegate?
    @IBOutlet weak var btnLabel: UIButton!
    private var title: String = ""
    
    
    @IBAction func didTapAction(_ sender: Any) {
        delegate?.didTapAction(with: title)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnLabel.setTitleColor(.white, for: .normal)
    }
    override func layoutSubviews() {
          super.layoutSubviews()
          let bottomSpace: CGFloat = 10.0 // Let's assume the space you want is 10
          self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: bottomSpace, right: 0))
     }
    func config(with title: String){
        self.title = title
        btnLabel.setTitle(title, for: .normal)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
