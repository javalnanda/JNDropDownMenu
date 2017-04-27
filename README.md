# JNDropDownMenu
Swift version of https://github.com/dopcn/DOPDropDownMenu

Easy to use TableView style dropdown menu.

![image](https://github.com/javalnanda/JNDropDownMenu/blob/master/Example/JNDropDownSample/demo.gif)

## Setup
The only you thing you need to do is import `JNDropDownMenu`, create an instance and add it to your `View` and conform to its datasource and delegate.
```swift
import JNDropDownMenu
```
```swift
let menu = JNDropDownMenu(origin: CGPoint(x: 0, y: 64), height: 40)
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

Menu width will default to that of screensize.

Customization:
There are very minimal customization available currently. You can alter color and font before setting menu datasource as follow:

```swift
    let menu = JNDropDownMenu(origin: CGPoint(x: 0, y: 64), height: 40)
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

## Suggestions or feedback?

Feel free to create a pull request, open an issue or find me [on Twitter](https://twitter.com/javalnanda).
