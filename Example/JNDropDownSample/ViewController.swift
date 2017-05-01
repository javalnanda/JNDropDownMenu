//
//  ViewController.swift
//  JNDropDownSample
//
//  Created by Javal Nanda on 4/27/17.
//  Copyright © 2017 Javal Nanda. All rights reserved.
//

import UIKit
import JNDropDownMenu
class ViewController: UIViewController {

    
    var columnOneArray = ["All","C1-1","C1-2","C1-3","C1-4","C1-5"]
    var columnTwoArray = ["All","C2-1","C2-2"]
    
    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "JNDropDownMenu"
        // pass custom width or set as nil to use screen width
        let menu = JNDropDownMenu(origin: CGPoint(x: 0, y: 64), height: 40, width: self.view.frame.size.width)
        /*
        // Customize if required
        menu.textColor = UIColor.red
        menu.cellBgColor = UIColor.green
        menu.arrowColor = UIColor.black
        menu.cellSelectionColor = UIColor.white
        menu.textFont = UIFont.boldSystemFont(ofSize: 16.0)
        */
        menu.datasource = self
        menu.delegate = self
        self.view.addSubview(menu)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: JNDropDownMenuDelegate, JNDropDownMenuDataSource {
    func numberOfColumns(in menu: JNDropDownMenu) -> NSInteger {
        return 2
    }
    
    func numberOfRows(in column: NSInteger, for forMenu: JNDropDownMenu) -> Int {
        switch column {
        case 0:
            return columnOneArray.count
        case 1:
            return columnTwoArray.count
        default:
            return 0
        }
    }
    
    func titleForRow(at indexPath: JNIndexPath, for forMenu: JNDropDownMenu) -> String {
        switch indexPath.column {
        case 0:
            return columnOneArray[indexPath.row]
        case 1:
            return columnTwoArray[indexPath.row]
            
        default:
            return ""
        }
    }
    
    func didSelectRow(at indexPath: JNIndexPath, for forMenu: JNDropDownMenu) {
        var str = ""
        switch indexPath.column {
        case 0:
            str = columnOneArray[indexPath.row]
            break
        case 1:
            str = columnTwoArray[indexPath.row]
            break
        default:
            str = ""
        }
        label.text = str + " selected"
    }
}
