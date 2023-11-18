[![Language](https://img.shields.io/badge/language-Swift%205.7.2-skyblue.svg)](https://swift.org)
![UI](https://img.shields.io/badge/UI-SwiftUI-blue.svg)
![Xcode](https://img.shields.io/badge/Xcode-14.2+-green)
![Version](https://img.shields.io/badge/iOS-13.0+-yellow)

inspired by [Esat GÖZCÜ](https://github.com/esatgozcu/SwiftUI-Custom-TextField) CustomTextField 🙇🏻‍♂️

# Cassette
⚠️ It's still a developing Lib. (Last Update: 2023.11.19)

Cassette is an Custom View library written in SwiftUI.

- Requirements
  - iOS 13.0+
- [Installation](#installation)
- [features](#features)
  - [Button](#button)
    - [Usage](#button-usage)
    - [Set Default Value](#button-set-default-value)
   
  - [Switch](#switch)
    - [Usage](#switch-usage)
    - [Set Default Value](#switch-set-default-value)
   
  - [TextField](#textfield)
    - [Usage](#textfield-usage)
    - [Set Default Value](#textfield-set-default-value)
    - [Function](#textfield-customizing-set-function)
 
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
.package(url: "https://github.com/ios-carki/Cassette.git", from: "v1.1.10")
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
## Button Usage
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

## Button Set Default Value
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
## Switch Usage
- Basic
 
<img width="100" alt="스크린샷 2023-09-12 오후 5 26 51" src="https://github.com/ios-carki/Cassette/assets/44957712/a66f74e5-ef57-4360-b57b-75c54915340a">

```swift
//normal
SwitchCassette(switchType: .normal(text: Binding<String>?, isOn: Binding<Bool>, spacing: CGFloat?))

//rectangle
SwitchCassette(switchType: .rectangle(text: Binding<String>?, isOn: Binding<Bool>, spacing: CGFloat?))
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

## Switch Set Default Value
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

# TextField
## TextField Usage
- Basic
```swift
TextFieldCassette(mode: .underLine(placeHolder: "asdfok", text: $viewModel.text, title: "Title", alignment: .leading))
```
![스크린샷 2023-09-18 오전 11 03 21](https://github.com/ios-carki/Cassette/assets/44957712/29cb9dec-df08-4dad-bdf1-45db471ffc3b)


- Customizing
```swift
//Customizing
TextFieldCassette(mode: .underLine(placeHolder: "asdfok", text: $viewModel.text, title: "Title", alignment: .leading))
    .setReactangleFieldBackgroundColor(.white) // SetBackgroundColor
    .setPlaceHolderTextColor(.blue) // SetPlaceHolderTextColor
    .setRectangleFieldBorderColor(.black) //SetBorderColor
    .setImageButton(imageDirection: .trailing, imageType: .system(color: .black), imageName: "person") {
        print("Hello") // SetImageButton
    }
```

- Result
  
![스크린샷 2023-09-18 오전 11 06 35](https://github.com/ios-carki/Cassette/assets/44957712/09377559-69b9-4a8a-b34b-02e4de23847e)

- SetError
```swift
struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModeel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack {
                TextFieldCassette(mode: .underLine(placeHolder: "asdfok", text: $viewModel.text, title: "Title", alignment: .leading))
                    .setSecureField(isSecure: false)
                    .setError(isError: $viewModel.isError, errorColor: .red)
            }
        }
        .padding(.horizontal, 16)
    }
}

final class ContentViewModeel: ObservableObject {
    @Published var isOn: Bool = false
    @Published var text: String = "" { didSet { setError()}}
    
    @Published var isError: Bool = false
    
    func setError() {
        if text == "abc" {
            isError = true
        } else {
            isError = false
        }
    }
}

```

- Error Result

https://github.com/ios-carki/Cassette/assets/44957712/d2909bdd-8d75-4ce6-bc38-0bde024a2eeb

## TextField Set Default Value
If you set default value, you don't need to set customizing function every views
```swift
    //Title
    public var defaultTitleTextFont: Font = .callout
    public var defaultTitleTextColor: Color = .black
    public var defaultTitleTextSpacing: CGFloat = 8
    public var defaultTitleTextAlignment: Alignment = .leading
    
    //Text
    public var defaultTextFont: Font = .callout
    public var defaultTextColor: Color = .black
    public var defaultTextAlignment: Alignment = .leading
    
    //PlaceHolder
    public var defaultPlaceHolderTextColor: Color = .gray
    public var defaultPlaceHolderTextFont: Font = .callout
    public var defaultPlaceHolderTextAlignment: Alignment = .leading
    
    //Design
    public var defaultTextFieldHeight: CGFloat = 50
    public var defaultRectangleFieldBackgroundColor: Color = .yellow
    public var defaultRectangleFieldCornerRadius: CGFloat = 12
    public var defaultRectangleFieldBorderColor: Color = .orange
    public var defaultRectangleFieldBorderWidth: CGFloat = 2
    
    //Error
    public var defaultErrorColor: Color = .red
```

### TextField Customizing Set Function
```swift
    //SecureField
    setSecureField(isSecure: Bool)
    
    //Title
    setTitleTextFont(_ font: Font)
    
    setTitleTextColor(_ color: Color)
    
    setTitleTextSpacing(spacing: CGFloat)
    
    setTitleTextAlignment(alignment: Alignment)
    
    //Text
    setTextFont(_ font: Font)
    
    setTextColor(_ color: Color)
    
    setTextAlignment(alignment: Alignment)
    
    //PlaceHolder
    setPlaceHolderTextColor(_ color: Color)
    
    setPlaceHolderTextFont(_ font: Font)
    
    setPlaceHolderTextAlignment(alignment: Alignment)
    
    //Design
    setTextFieldHeight(_ height: CGFloat)

    setReactangleFieldBackgroundColor(_ color: Color)
    
    setRectangleFieldCornerRadius(_ radius: CGFloat)
    
    setRectangleFieldBorderColor(_ color: Color)
    
    setRectangleFieldBorderWidth(_ width: CGFloat)
    
    //Error
    setError(isError: Binding<Bool>, errorColor: Color)
    
    //Image
    setImageButton(imageDirection: ImageDirection, imageType: ImageType, imageName: String, action: (() -> ())?)
```
<!--

```swift

```
```swift

```
```swift

```
-->
