# 1 Git in Xcode

## 1.1 Basic Operation

* Creating a Git repository

* Committing changes

* Comparing Versions

* Branches

* Merging Branches

* Discarding Changes


<<<<<<< HEAD

=======
# 2 Bridge and CocoaPods Configuration

### Object

* Fast Integrate chat UI component and service framework.
* Use CocoaPods to configure third-party components.
* Use the bridge-header files to use Object-C code seamlessly.

## 2.1 IM Framwork Introduction

### RongCloudIMKit

* Integrate a complete group of chat UI.
* UI system and User system in the application are seperated.

### Some IM Cloud Examples

* Parse.com
* LeanCloud
* RongCloud

## 2.2 Create Project and Install CocoaPods

### Some Basic CocoaPods Commands

```shell
//Update Gem:
$ sudo gem update --system
//Switch CocoaPods date source:
$ gem sources --remove https://rubygems.org/
$ gem sources -a http://ruby.taobao.org/
$ gem sources -l
//Install CocoaPods:
$ sudo gem install cocoaPods
//Set pod repo:
$ pod setup
//Test:
//If there is a version number, then it is already installed successfully.
$ pod
//Install third-party framework:
$ pod install --no-repo-update
$ pod update --no-repo-update
```

## 2.3 Use Pod to Configure Workspace:

### Search RongCloud UI Component

In advance, you can view the versison information of the component through the search function, with the following command:

```shell
$ pod search RongCloudIMKit
```

To integrate RongCloudIMKit into Xcode project using CocoaPods, specify it in the `Podfile`:

```swift
target 'CloudIMTest' do
	pod 'RongCloudIMKit'
end
```

### Installation

Then, run the following command:

```shell
$ pod install
```
>>>>>>> dev
