//
//  RepositoryCell.swift
//  AboutMe
//
//  Created by Adam on 16/03/2023.
//

import UIKit

class RepositoryCell: UITableViewCell {

    @IBOutlet private weak var mainView: UIView!
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var langLogoImageView: UIImageView!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
		
		mainView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
		self.selectionStyle = .none
    }
    
}
