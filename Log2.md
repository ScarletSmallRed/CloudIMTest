#  

[TOC]

# Chat and Conversation, CocoaPods and Storyboard

### Achievement of Private Chatting

* Common functions of a single conversation
* Text
* images
* Voice talk
* Send location

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