//
//  Constants.swift
//  
//
//  Created by HESSEGG on 2023/08/09.
//

import SwiftUI

public struct Constants {
    
}

public enum ButtonMode {
    case normal
    case leadingImage
    case trailingImage
    case clear
    case negative
    case bindingText
    
    func setBindText(text: Binding<String>?) -> BtnCassette {
        switch self {
        case .bindingText:
            var copy = BtnCassette()
            copy.bindingText = text
            return copy
        default:
            return BtnCassette()
        }
    }
    
    //v2
    case justImage
    case justKFImage
    case leadingKFImage
    case trailingKFImage
    case normalGradient
    case justIcon
    
    
    
}

public enum ImageType {
    case system
    case custom
}
