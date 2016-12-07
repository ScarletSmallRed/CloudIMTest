# 4 Third Party Libraries

## 4.1 Fix Some UI Bugs

### Fix Some bugs of Tab Button Image

Adjust the image to the appropriate `Image Set`, showed as below:

![屏幕快照 2016-12-06 下午9.08.00](PicsForLog/屏幕快照 2016-12-06 下午9.08.00.png)

## 4.2 How to Find Good Third-Party Libraries

* Use the CocoaPods command:

```shell
$ pod search [LibraryName]
```

* Recommendation from Others.
* Vist the website: `CocoaPods.org`. For example, you can find third-party libraries such as web and UI on this site:

![屏幕快照 2016-12-06 下午9.21.11](PicsForLog/屏幕快照 2016-12-06 下午9.21.11.png)

![屏幕快照 2016-12-06 下午9.21.33](PicsForLog/屏幕快照 2016-12-06 下午9.21.33.png)

## 4.2 KxMenu

### PopMenu

Establish action connection between Add `UIBarButtonItem` and class `ConversationListViewController`:

```swift
@IBAction func showMenu(_ sender: UIBarButtonItem) {
        
        var frame = (sender.value(forKey: "view") as? UIView)?.frame
        frame?.origin.y += 30
        
        KxMenu.show(in: self.view, from: frame!, menuItems: [
            KxMenuItem(NSLocalizedString("Test1", comment: "Test1"),image: UIImage(named: "contact"), target:self, action: "ClickMenu1"),
            KxMenuItem(NSLocalizedString("Test2", comment: "Test2"),image: UIImage(named: "contact"), target:self,action: "ClickMenu2")
            ])
        
    }
```

![屏幕快照 2016-12-07 上午10.56.34](PicsForLog/屏幕快照 2016-12-07 上午10.56.34.png)

### Push ViewController Test

After tapping on Add `UIBarButtonItem`, navigation controller push the specified view controller(using 2 different methods to realize this function):

```swift
func ClickMenu1() {
        conversationViewController.targetId = "tester001"
        conversationViewController.title = "tester1"
        conversationViewController.conversationType = .ConversationType_PRIVATE
        
        performSegue(withIdentifier: "ShowConversationVC", sender: self)
    }
    
func ClickMenu2() {
        
        let conversationVC = RCConversationViewController()
        
        conversationVC.targetId = "tester002"
        conversationVC.title = "tester2"
        conversationVC.conversationType = .ConversationType_PRIVATE
        
        navigationController?.pushViewController(conversationVC, animated: true)
        
        tabBarController?.tabBar.isHidden = true
        
    }
```

![屏幕快照 2016-12-07 上午10.57.02](PicsForLog/屏幕快照 2016-12-07 上午10.57.02.png)