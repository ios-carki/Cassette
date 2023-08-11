[![Language](https://img.shields.io/badge/language-Swift%205.7.2-skyblue.svg)](https://swift.org)
![UI](https://img.shields.io/badge/UI-SwiftUI-blue.svg)
![Xcode](https://img.shields.io/badge/Xcode-14.2+-green)
![Version](https://img.shields.io/badge/iOS-13.0+-yellow)

inspired by [Esat GÖZCÜ](https://github.com/esatgozcu/SwiftUI-Custom-TextField) CustomTextField 🙇🏻‍♂️

# Cassette

Cassette is an Custom View library written in SwiftUI.

- Requirements
  - iOS 13.0+
- [Installation](#installation)
- [features](#features)
  - [Button](#button)
 
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

## Installation
## Features
I will guide you on how to use CustomViews in SwiftUI.
## Button
### Customize config
- SwiftUI Interface
```swift
import SwiftUI

import Cassette

@main
struct LibTestApp: App {
    init() {
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













