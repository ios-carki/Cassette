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
    - [Variable & Function](#variable-function)
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

## Variable Function

#### Button Mode
- Set Mode
```swift
    // Mode
    public func setMode(mode: ButtonMode?, setImageType: ImageType? = nil) -> Self {
        var copy = self

        if mode == .normal {
            copy.buttonMode = .normal
            copy.buttonBorderColor = .white
            copy.buttonBackgroundColor = .black
            copy.buttonTextColor = .white
        }

        if mode == .clear {
            copy.buttonMode = .clear
            copy.buttonBorderColor = .gray
            copy.buttonBackgroundColor = .clear
            copy.buttonTextColor = .gray
        }
        
        if mode == .negative {
            copy.buttonMode = .negative
            copy.buttonBorderColor = .red
            copy.buttonBackgroundColor = .clear
            copy.buttonTextColor = .red
        }
        
        if mode == .trailingImage {
            copy.buttonMode = .trailingImage
            if setImageType == .system {
                copy.imageType = .system
            } else if setImageType == .custom {
                copy.imageType = .custom
            }
        }
        
        if mode == .leadingImage {
            copy.buttonMode = .leadingImage
            if setImageType == .system {
                copy.imageType = .system
            } else if setImageType == .custom {
                copy.imageType = .custom
            }
        }
        
        if mode == .bindingText {
            copy.buttonMode = .bindingText
            
        }

        return copy
    }
```

#### Default Text Setting
- Set Variable
```swift
    //Text
    public var defaultButtonText: String = "Set Title First"
    public var defaultButtonTextColor: Color = .yellow
    public var defaultButtonTextFont: Font = .callout
```

- Function
```swift
    // Text
    public func setBindingText(text: Binding<String>?) -> Self {
        var copy = self
        copy.bindingText = text
        return copy
    }

    public func setTitle(text: String?) -> Self {
        var copy = self
        copy.buttonText = text
        return copy
    }
    
    public func setTitleTextColor(color: Color) -> Self {
        var copy = self
        copy.buttonTextColor = color
        return copy
    }
    
    public func setTitleTextFont(font: Font) -> Self {
        var copy = self
        copy.buttonTextFont = font
        return copy
    }
```

- Binding Mode Example
```swift
      BtnCassette()
          .setMode(mode: .bindingText) // * Set Mode First
          .setBindingText(text: $viewModel.bindingText) // Here is important!
          .setBackgroundColor(color: .red)
          .setBorderWidth(width: 2)
          .click {
              viewModel.counting()
          }
```


https://github.com/ios-carki/Cassette/assets/44957712/952cf6db-f039-4b3f-8316-dae8f7b23252


#### Default Border Setting
- Set Variable
```swift
    //Design
    //Border
    public var defaultButtonCornerRadius: CGFloat = 12
    public var defaultBorderWidth: CGFloat = 1
    public var defaultBorderColor: Color = .white
```
- Function
```swift
    // Design
    // Border
    public func setCornerRadius(_ radius: CGFloat) -> Self {
        var copy = self
        copy.buttonCornerRadius = radius
        return copy
    }
    
    public func setBoderWidth(width: CGFloat) -> Self {
        var copy = self
        copy.buttonBorderWidth = width
        return copy
    }
    
    public func setBorderColor(color: Color) -> Self {
        var copy = self
        copy.buttonBorderColor = color
        return copy
    }
```

#### Default Background Setting
- Set Variable
```swift
    //Background
    public var defaultButtonBackgroundColor: Color = .black
    public var defaultbuttonDisableBackgroundColor: Color = .gray
```

- Function
```swift
    // Background
    public func setBackgroundColor(color: Color) -> Self {
        var copy = self
        copy.buttonBackgroundColor = color
        return copy
    }
    
    public func setDisableBackgroundColor(color: Color) -> Self {
        var copy = self
        copy.buttonDisableBackgroundColor = color
        return copy
    }
```

#### Default Frame Setting / Function
- Set Variable
```swift
    //Frame
    public var defaultButtonHeight: CGFloat = 50
```

#### Action Function
```swift
    // Action
    public func click(_ click: (() -> Void)?) -> Self {
        var copy = self
        copy.clickAction = click
        return copy
    }
    
    public func setDisable(disable: Binding<Bool>?) -> Self {
        var copy = self
        copy.disabled = disable
        return copy
    }
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







