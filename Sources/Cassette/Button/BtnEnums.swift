//
//  File.swift
//  
//
//  Created by OWEN on 1/6/25.
//

import SwiftUI

public enum ImageDirection {
    case trailing
    case leading
}

public enum ImageType {
    case system
    case custom
}

public enum ButtonMode {
    case normal(text: String)
    case normalGradient(text: String)
    case imageButton(text: String, imageDirection: ImageDirection, imageType: ImageType, imageName: String)
    case bindingText(text: Binding<String>)
}
