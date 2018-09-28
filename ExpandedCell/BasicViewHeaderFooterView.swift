//
//  BasicViewHeaderFooterView.swift
//  ExpandedCell
//
//  Created by Daniyal Yousuf on 9/25/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit


protocol BasicViewHeaderFooterViewDelegate :  class {
    func didTapExpand(section : NSInteger)
}

class BasicViewHeaderFooterView: UITableViewHeaderFooterView {
    var currentSection : NSInteger  = 0 {
        didSet {
            
        }
    }
    var delegate : BasicViewHeaderFooterViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func didTappedExpand(_ sender: UIButton) {
        self.delegate?.didTapExpand(section: currentSection)
    }
    
}
