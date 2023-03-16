//
//  RepositoryCell.swift
//  AboutMe
//
//  Created by Adam on 16/03/2023.
//

import UIKit

class RepositoryCell: UITableViewCell {

    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var languageLogo: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
