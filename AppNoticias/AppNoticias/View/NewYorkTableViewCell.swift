//
//  NewYorkTableViewCell.swift
//
//
//  Created by ADRIANA DE SOUZA CORREIA DE OLIVEIRA on 01/03/22.
//

import UIKit

class NewYorkTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageNews: UIImageView!
    @IBOutlet weak var by: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageNews.layer.cornerRadius = 10
        imageNews.layer.borderWidth = 1
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state

    }

}
