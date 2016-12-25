//
//  CustomCell.swift
//  ReproductorMusica
//
//  Created by Walter Llano Suárez on 25/12/16.
//  Copyright © 2016 Walter Llano Suárez. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var foto: UIView!
    
    @IBOutlet weak var nombre: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
