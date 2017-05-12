# JNDropDownMenu

[![CI Status](http://img.shields.io/travis/javalnanda/JNDropDownMenu.svg?style=flat)](https://travis-ci.org/javalnanda/JNDropDownMenu)
[![Version](https://img.shields.io/cocoapods/v/JNDropDownMenu.svg?style=flat)](http://cocoapods.org/pods/JNDropDownMenu)
[![License](https://img.shields.io/cocoapods/l/JNDropDownMenu.svg?style=flat)](http://cocoapods.org/pods/JNDropDownMenu)
[![Platform](https://img.shields.io/cocoapods/p/JNDropDownMenu.svg?style=flat)](http://cocoapods.org/pods/JNDropDownMenu)
[![Twitter: @javalnanda](https://img.shields.io/badge/contact-@javalnanda-blue.svg?style=flat)](https://twitter.com/javalnanda)

## Overview

Swift version of https://github.com/dopcn/DOPDropDownMenu

Easy to use TableView style dropdown menu.

![image](https://github.com/javalnanda/JNDropDownMenu/blob/master/Example/JNDropDownSample/demo.gif)

## Setup
The only thing you need to do is import `JNDropDownMenu`, create an instance and add it to your `View` and conform to its datasource and delegate.
```swift
import JNDropDownMenu
```
```swift
// pass origin of menu, height - this will be height of collapsed menu not the expanded menu, width - it is optional, pass custom width or pass nil to utilize screen width
let menu = JNDropDownMenu(origin: CGPoint(x: 0, y: 64), height: 40, width: self.view.frame.size.width)
        menu.datasource = self
        menu.delegate = self
        self.view.addSubview(menu)
```

Just implement datasource and delegate same as that of Tableview

```swift
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
```
Customization:
There are very minimal customization available currently. You can alter color and font before setting menu datasource as follow:

```swift
    let menu = JNDropDownMenu(origin: CGPoint(x: 0, y: 64), height: 40, width: self.view.frame.size.width)
    //customize
    menu.textColor = UIColor.red
    menu.cellBgColor = UIColor.green
    menu.arrowColor = UIColor.black
    menu.cellSelectionColor = UIColor.white
    menu.textFont = UIFont.boldSystemFont(ofSize: 15.0)
    
    menu.datasource = self
    menu.delegate = self
    self.view.addSubview(menu)
```

##### Find the above displayed examples in the `Example` folder.

## Installation

### CocoaPods

JNDropDownMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "JNDropDownMenu"
```
## Change Log
V 0.1.4
- added support to pass custom width for menu
- expand menu now utilize entire screen height instead of 5 rows.

V 0.1.5
- added support to provide custom column title and disable change of title on row selection.

Set updateColumnTitleOnSelection flag to false. This will disable change of column title on row selection. 
Note: This will also disable highlight of last selected row item.
```swift
 menu.updateColumnTitleOnSelection = false
 ```
Override following function of JNDropDownMenuDataSource to provide custom title for column
```swift
func titleFor(column: Int, menu: JNDropDownMenu) -> String {
        return "Column \(column)"
    }
```
Note: If you don't override this, by default it will pick first object of column array as a column title and by default it will update the title of column on row selection.

## Suggestions or feedback?

Feel free to create a pull request, open an issue or find me [on Twitter](https://twitter.com/javalnanda).
