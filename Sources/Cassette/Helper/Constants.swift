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
    
    //v2
    case justImage
    case justKFImage
    case leadingKFImage
    case trailingKFImage
    case normalGradient
    case justIcon
}

extension ButtonMode {
//    public func setBindingText(text: Binding<String>?) -> Self {
//        var copy = self
//        copy.bindingText = text
//        return copy
//    }
    func setBindingText(value: Binding<String>?) -> BtnCassette? {
        switch self {
        case .bindingText:
            // 여기서 value 변수를 사용할 수 있음
            var copy = BtnCassette()
            copy.bindingText = value
            return copy
        default:
            break
        }
        
        return nil
    }
}

public enum ImageType {
    case system
    case custom
}
