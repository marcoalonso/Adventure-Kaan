//
//  VideoCell.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var tituloVideoLabel: UILabel!
    @IBOutlet weak var imagenVideo: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagenVideo.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
