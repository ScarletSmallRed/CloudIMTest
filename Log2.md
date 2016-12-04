

[TOC]

# 3 Chat and Conversation, CocoaPods and Storyboard

## 3.1 Elements of The Project

### User System Flow

* Application
* `RongCloud`(stores information of friend relationship and group relation)
* Server(stores user information)

### Set Current User Information

* User class `RCIMClient`(Singleton, Set the user logging in)

### Private Chatting UI

* User class `RCConversationViewController`(integrated in `RongCloud`)

### Private Chatting User Information

* targetId
* userName
* conversation Type
* navigation bar title

## 3.2 Achievement of Private Chatting

### Main Functions

- Common functions of a single conversation
- Text
- images
- Voice talk
- Send location

### User System Flow Test

View `My Application` on `RongCloud` official website and enter user's basic information in the API debugging section to get the testing token.

### Private Chatting UI

Create class `conversationViewController` inheriting class `RCConversationViewController` from `RongIMKit`:

```swift
class conversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
```

Build and run the current scheme:

![屏幕快照 2016-12-03 上午9.18.42](PicsForLog/屏幕快照 2016-12-03 上午9.18.42.png)

## 3.3 Set Up Private Chatting People and Test

### Initialize SDK

Need to add a SDK reference to project's Bridging-Header.h file.

```swift
#import <RongIMKit/RongIMKit.h>
```

Pass App Key,  getted in `RongCloud Development Center`, into function `initWithAppKey` to initialize SDK.

```swift
RCIM.sharedRCIM().initWithAppKey("YourTestAppKey")
```

### Connect Server

Through the RCIM of a single case, introduce the Token getted in the last step into function `RCIM.shared().connect(withToken: String!, success: ((String?) -> Void)!, error: ((RCConnectErrorCode) -> Void)!, tokenIncorrect: (() -> Void)!)`,  and then you can establish a connection with the server.

```swift
RCIM.sharedRCIM().connectWithToken("YourTestUserToken",
success: { (userId) -> Void in
    print("Successfully, ID：\(userId)")
}, error: { (status) -> Void in
    print("Wrong code:\(status.rawValue)")
}, tokenIncorrect: {
    print("Incorrect token.")
})
```

### Start The Chatting Interface

Create a class `ConversationViewController` ，subclass of  `RCConversationViewController` and set property such as `conversationType`, `targetId` and `title` to get start:

```swift
self.targetId = "tester002"
self.title = "tester002"
self.conversationType = .ConversationType_PRIVATE
```

### Test The Conversation

In `My Application`, you can use `API Debug` —> `Send Private Chatting Message` to test the application:

![屏幕快照 2016-12-04 上午11.04.11](PicsForLog/屏幕快照 2016-12-04 上午11.04.11.png)

![屏幕快照 2016-12-04 上午11.04.28](PicsForLog/屏幕快照 2016-12-04 上午11.04.28.png)




