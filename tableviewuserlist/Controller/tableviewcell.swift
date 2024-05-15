//
//  tableviewcell.swift
//  tableviewuserlist
//
//  Created by MANSVITA on 02/09/22.
//

import UIKit

class tableviewcell: UITableViewCell {

  
  
    
    @IBOutlet weak var lbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // lbl.sizeToFit()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

   
    
}

