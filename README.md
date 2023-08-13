[![Language](https://img.shields.io/badge/language-Swift%205.7.2-skyblue.svg)](https://swift.org)
![UI](https://img.shields.io/badge/UI-SwiftUI-blue.svg)
![Xcode](https://img.shields.io/badge/Xcode-14.2+-green)
![Version](https://img.shields.io/badge/iOS-13.0+-yellow)

inspired by [Esat GÖZCÜ](https://github.com/esatgozcu/SwiftUI-Custom-TextField) CustomTextField 🙇🏻‍♂️

# Cassette
⚠️ It's still a developing Lib. (Last Update: 2023.08.14)

Cassette is an Custom View library written in SwiftUI.

- Requirements
  - iOS 13.0+
- [Installation](#installation)
- [features](#features)
  - [Button](#button)
    - [Customize config](#customize-config)
    - [Usage](#usage)
 
<!--
  - PorgressView
  - Switch
  - TextField
 
- 메인 카테고리
  - 하위 카테고리 1
  - 하위 카테고리 2
  - 하위 카테고리 3
 
- 메인 카테고리
  - 하위 카테고리 1
  - 하위 카테고리 2
  - 하위 카테고리 3


-->

# Installation
### Swift Package Manager
```swift
.package(url: "https://github.com/ios-carki/Cassette.git", from: "main")
```
# Features
I will guide you on how to use CustomViews in SwiftUI.
## Button
### Customize config
- SwiftUI Interface
```swift
import SwiftUI

import Cassette // *

@main
struct LibTestApp: App {
    init() {
        //MARK: ** Default Setting 
        let shared = BtnCassetteConfig.shared
        shared.defaultButtonTextColor = .white
        shared.defaultButtonTextFont = .semiBold16()
        shared.defaultButtonBackgroundColor = .mainOrangeColor
    } // Here is important!
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

```

- StoryBoard Interface
```swift
import UIKit

import Cassette // *

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        ...

        // Here is important!
        let shared = BtnCassetteConfig.shared
        shared.defaultButtonTextColor = .white
        shared.defaultButtonTextFont = .semiBold16()
        shared.defaultButtonBackgroundColor = .mainOrangeColor

        ...
        
        return true
    }

    ...
}
```

## Button - Set Default Variable

#### Default Text Setting
```swift
    //Text
    public var defaultButtonText: String = "Set Title First"
    public var defaultButtonTextColor: Color = .yellow
    public var defaultButtonTextFont: Font = .callout
```

#### Default Border Setting
```swift
    //Design
    //Border
    public var defaultButtonCornerRadius: CGFloat = 12
    public var defaultBorderWidth: CGFloat = 1
    public var defaultBorderColor: Color = .white
```

#### Default Background Setting
```swift
    //Background
    public var defaultButtonBackgroundColor: Color = .black
    public var defaultbuttonDisableBackgroundColor: Color = .gray
```

#### Default Frame Setting
```swift
    //Frame
    public var defaultButtonHeight: CGFloat = 50
```

## Usage
- Code
```swift
import SwiftUI

import Cassette

struct ContentView: View {
    var body: some View {
        VStack {
            BtnCassette()
                .setMode(mode: .clear)
                .setTitle(text: "send")
                .setBackgroundColor(color: .red)
                .setBoderWidth(width: 2)
                .setDisable(disable: .constant(false))
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mainBackgroundColor.ignoresSafeArea()
            ContentView()
        }
    }
}

```
- Result Image
  
![Result](https://github.com/ios-carki/Cassette/assets/44957712/1dbfee6f-8759-477d-ae0d-3c4f9d6ccd0e)







