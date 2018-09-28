//
//  BasicCellA.swift
//  ExpandedCell
//
//  Created by Daniyal Yousuf on 9/25/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit

protocol BasicCellADelegate : class {
    func didTapExpand()
}

class BasicCellA: UITableViewCell {
    var delegate: BasicCellADelegate?
    @IBOutlet weak var lblTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func didTappedExpand(_ sender: UIButton) {
            self.delegate?.didTapExpand()
    }
}
