//
//  ViewController.swift
//  ExpandedCell
//
//  Created by Daniyal Yousuf on 9/25/18.
//  Copyright © 2018 Daniyal Yousuf. All rights reserved.
//

import UIKit
let resuseIndentifierSection  = "basiccellHeader"
class ViewController: UIViewController {
    let resuseIdentifier = "basiccell"
    var expanded : Bool! = false
    var tDArray : [[String]] = [["1","2","3","4","5"] , ["1","2","3"] , ["1","2","3","4","5", "6" , "7" , "8" , "9" , "0" ] , ["1","2","3","4","5"] , ["1","2","3","4","5"], ["1","2","3","4","5"] , ["1","2","3","4","5"] , ["1","2","3","4","5"] ,["1","2","3","4","5"] ,["1","2","3","4","5"]]
    
    @IBOutlet weak var basetableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.basetableView.register(UINib.init(nibName: "BasicCellA", bundle: nil), forCellReuseIdentifier: "BasicCellA")
        self.basetableView.register(UINib.init(nibName: "BasicViewHeaderFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: "basiccellHeader")
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 && expanded {
            return 3
        } else if section == 2 && !expanded {
            return 9
        }
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let basisCell = tableView.dequeueReusableCell(withIdentifier: "BasicCellA") as! BasicCellA
        basisCell.delegate = self
        basisCell.lblTitle.text = self.tDArray[indexPath.section][indexPath.row]
        return basisCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
         return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let basicHeader : BasicViewHeaderFooterView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "basiccellHeader") as! BasicViewHeaderFooterView
        basicHeader.delegate = self
        basicHeader.currentSection = section
        return basicHeader
    }
}

extension ViewController : BasicCellADelegate {
    
    func didTapExpand() {
        
    }
}

extension ViewController : BasicViewHeaderFooterViewDelegate {
    func didTapExpand(section: NSInteger) {
        if section == 2 {
            expanded = !expanded
            basetableView.reloadSections(IndexSet.init(integer: 2), with: .none)
        }
    }
}
