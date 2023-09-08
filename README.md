[![Language](https://img.shields.io/badge/language-Swift%205.7.2-skyblue.svg)](https://swift.org)
![UI](https://img.shields.io/badge/UI-SwiftUI-blue.svg)
![Xcode](https://img.shields.io/badge/Xcode-14.2+-green)
![Version](https://img.shields.io/badge/iOS-13.0+-yellow)

inspired by [Esat GÖZCÜ](https://github.com/esatgozcu/SwiftUI-Custom-TextField) CustomTextField 🙇🏻‍♂️

# Cassette
⚠️ It's still a developing Lib. (Last Update: 2023.09.08)

Cassette is an Custom View library written in SwiftUI.

- Requirements
  - iOS 13.0+
- [Installation](#installation)
- [features](#features)
  - [Button](#button)
    - [Usage](#usage)
    - [Set Default Value](#set-default-value)
   
  - [Switch](#switch)
    - [Usage](#usage)
    - [Set Default Value](#set-default-value)
 
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
.package(url: "https://github.com/ios-carki/Cassette.git", from: "v1.0.4")
```
# Features
I will guide you on how to use BtnCassette(Button) in SwiftUI.

- Mode 1: normal Button

  ![스크린샷 2023-08-18 오후 9 34 39](https://github.com/ios-carki/Cassette/assets/44957712/56173751-76ea-4671-9636-ab0d31c1fe90)

  
- Mode 2: Binding Title Button

  ![스크린샷 2023-08-18 오후 9 34 57](https://github.com/ios-carki/Cassette/assets/44957712/46bb4c5e-f029-45ec-9967-363998f11ab0)

  
- Mode 3: Image Button

  ![스크린샷 2023-08-18 오후 10 49 46](https://github.com/ios-carki/Cassette/assets/44957712/cfe4994c-c18f-4df4-844c-a5c73a01dfce)




# Button
## Usage
- Basic
```swift
struct TestView: View {
    var body: some View {
        VStack(spacing: 20) {
            // Normal Button
            BtnCassette(buttonMode: .normal(text: "Normal Button"))

            // Image Button - Left Positioned Image
            BtnCassette(buttonMode: .imageButton(text: "Leading Image Button", imageDirection: .leading, imageType: .system, imageName: "globe"))

            // Image Button - Right Positioned Image
            BtnCassette(buttonMode: .imageButton(text: "Trailing Image Button", imageDirection: .trailing, imageType: .system, imageName: "person"))

            // Binding Text Button
            BtnCassette(buttonMode: .bindingText(text: .constant("Binding Text Button")))
            
        }.padding(.horizontal, 16)
    }
}
```
- Customizing
```swift
struct TestView: View {
    @StateObject private var viewModel = TestViewModel()
    var body: some View {
        VStack(spacing: 20) {
            BtnCassette(buttonMode: .normal(text: "Normal Button"))
                .setTitleTextColor(color: .blue)
                .setTitleTextFont(font: .title2)
                .setCornerRadius(20)
                .setBorderWidth(width: 2)
                .setBorderColor(color: .blue)
                .setButtonHeight(height: 80)
                .setBackgroundColor(color: .cyan)
                .setDisableBackgroundColor(color: .gray)
                .setDisable(disable: $viewModel.buttonDisable)
                .click {
                    viewModel.buttonDisable.toggle()
                }
            
        }.padding(.horizontal, 16)
    }
}
```

- Result
  
  ![스크린샷 2023-08-18 오후 9 55 08](https://github.com/ios-carki/Cassette/assets/44957712/f4a7e595-46eb-4ec2-ae33-fde1934b7a72)

- Disable Button Result
  
  ![스크린샷 2023-08-18 오후 9 55 41](https://github.com/ios-carki/Cassette/assets/44957712/3c4ffa61-ce2d-48a5-a56b-d92669e4f84d)

## Set Default Value
If you set default value, you don't need to set customizing function every views

- For Storyboard Interface Project
  
```swift
import UIKit

import Cassette

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Here is important!
        let shared = BtnCassetteConfig.shared
        shared.defaultButtonTextColor = .blue
        shared.defaultButtonTextFont = .title2
        shared.defaultButtonCornerRadius = 20
        shared.defaultBorderWidth = 2
        shared.defaultBorderColor = .blue
        shared.defaultButtonHeight = 80
        shared.defaultButtonBackgroundColor = .cyan
        shared.defaultbuttonDisableBackgroundColor = .gray

        
        return true
    }

    .
    .
    .

}


```

- For SwiftUI Interface Project

```swift
import SwiftUI

import Cassette

@main
struct MyProjectApp: App {

    // Here is important!
    init() {
        let shared = BtnCassetteConfig.shared
        shared.defaultButtonTextColor = .blue
        shared.defaultButtonTextFont = .title2
        shared.defaultButtonCornerRadius = 20
        shared.defaultBorderWidth = 2
        shared.defaultBorderColor = .blue
        shared.defaultButtonHeight = 80
        shared.defaultButtonBackgroundColor = .cyan
        shared.defaultbuttonDisableBackgroundColor = .gray
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

```

- With Using Default Variable
```swift
import SwiftUI

import Cassette

struct TestView: View {
    @StateObject private var viewModel = TestViewModel()
    var body: some View {
        VStack(spacing: 20) {
            BtnCassette(buttonMode: .normal(text: "Normal Button"))
                .setDisable(disable: $viewModel.buttonDisable)
                .click {
                    viewModel.buttonDisable.toggle()
                }
            
        }.padding(.horizontal, 16)
    }
}
```

The result is the same as above, but the code is much shorter.

![스크린샷 2023-08-18 오후 10 34 34](https://github.com/ios-carki/Cassette/assets/44957712/12d76ad8-06d5-42dc-b383-9a5d6469295f)

# Switch
## Usage
- Basic
```swift
SwitchCassette(text: Binding<String>?, isOn: Binding<Bool>, spacing: CGFloat?)
```

- Customizing
```swift
import SwiftUI

import Cassette

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModeel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                SwitchCassette(text: $viewModel.text, isOn: $viewModel.isOn, spacing: 12)
                    .setSwitchControllerColor(color: .blue)
                    .setTitleTextOffColor(color: .blue)
                    .setTitleTextOnColor(color: .red)
                    .setSwitchOnBackgroundColor(color: .indigo)
                    .insertSpacer(true)
            }
        }
        .padding(.horizontal, 16)
    }
}
```

<img width="266" alt="스크린샷 2023-09-08 오후 2 44 24" src="https://github.com/ios-carki/Cassette/assets/44957712/701470e8-ee56-4f7e-917c-c5dc991dd832">

---

```swift
import SwiftUI

import Cassette

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModeel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                SwitchCassette(text: $viewModel.text, isOn: $viewModel.isOn, spacing: 12)
                    .setSwitchControllerColor(color: .blue)
                    .setTitleTextOffColor(color: .blue)
                    .setTitleTextOnColor(color: .red)
                    .setSwitchOnBackgroundColor(color: .indigo)
                    .insertSpacer(false) // here is changed!
            }
        }
        .padding(.horizontal, 16)
    }
}
```

<img width="274" alt="스크린샷 2023-09-08 오후 2 45 46" src="https://github.com/ios-carki/Cassette/assets/44957712/8b458160-25f2-47a4-9db2-7cc4f434746d">

---

```swift
import SwiftUI

import Cassette

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModeel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                SwitchCassette(text: $viewModel.text, isOn: $viewModel.isOn, spacing: 100) // spacing value changed!
                    .setSwitchControllerColor(color: .blue)
                    .setTitleTextOffColor(color: .blue)
                    .setTitleTextOnColor(color: .red)
                    .setSwitchOnBackgroundColor(color: .indigo)
                    .insertSpacer(false)
            }
        }
        .padding(.horizontal, 16)
    }
}
```

<img width="268" alt="스크린샷 2023-09-08 오후 2 46 57" src="https://github.com/ios-carki/Cassette/assets/44957712/b396f564-3a2e-41f6-967a-fb3f1dd1df9d">

## Set Default Value
If you set default value, you don't need to set customizing function every views

- For Storyboard Interface Project
  
```swift
import UIKit

import Cassette

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        // Here is important!
        let shared = SwitchCassetteConfig.shared
        shared.defaultSwitchOffTextColor = .blue
        shared.defaultSwitchOnTextColor = .red
        shared.defaultSwitchTextFont = .callout
        shared.defaultSwitchOnBackgroundColor = .indigo
        shared.defaultSwitchOffBackgroundColor = .gray
        shared.defaultSwitchControllerColor = .blue

        
        return true
    }

    .
    .
    .

}


```

- For SwiftUI Interface Project

```swift
import SwiftUI

import Cassette

@main
struct MyProjectApp: App {

    // Here is important!
    init() {
        let shared = SwitchCassetteConfig.shared
        shared.defaultSwitchOffTextColor = .blue
        shared.defaultSwitchOnTextColor = .red
        shared.defaultSwitchTextFont = .callout
        shared.defaultSwitchOnBackgroundColor = .indigo
        shared.defaultSwitchOffBackgroundColor = .gray
        shared.defaultSwitchControllerColor = .blue
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```
- With Using Default Variable
```swift
import SwiftUI

import Cassette

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModeel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                SwitchCassette(text: $viewModel.text, isOn: $viewModel.isOn, spacing: 100)
                    .insertSpacer(false)
            }
            
        }
        .padding(.horizontal, 16)
    }
}
```

The result is the same as above, but the code is much shorter.

<img width="268" alt="스크린샷 2023-09-08 오후 2 54 53" src="https://github.com/ios-carki/Cassette/assets/44957712/f85eec65-d4c8-4013-a173-a4d0187d20da">

<!--
```swift

```
```swift

```
```swift

```
```swift

```


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

-->





