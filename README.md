# MovieDB
* App to show info about TV Shows 

## Quick Start 📦
1. Install [Pod](https://cocoapods.org/) 
2. Execute the next command in the current project for install RxSwift through Pods

    ```
    pod install
    ```
3. Open the MovieDB.xcworkspace file.

## Features 🧰
 * Launch
 * TV Show Feed
 * Filter by Segmented Controller
 * TV Show Preview

## Architecture 🏛
+ MVVM
+ Coordinators - Navigation logic from TV Show Feed to TV Show Preview
+ Factory - To create a view controller
+ Builders - To create UIKit UI easier
+ Reactive Programming - RxSwift with UIKit and Combine with SwiftUI
+ Modular - Same project
+ Frameworks - SDWebImageSwiftUI to render images from URL
