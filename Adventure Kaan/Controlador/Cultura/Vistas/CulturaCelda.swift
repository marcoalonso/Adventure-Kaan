//
//  CulturaCelda.swift
//  Adventure Kaan
//
//  Created by Marco Alonso Rodriguez on 16/05/23.
//

import UIKit

class CulturaCelda: UITableViewCell {
    
    
    @IBOutlet weak var nombreTemaCultura: UILabel!
    @IBOutlet weak var imagenCultura: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imagenCultura.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
