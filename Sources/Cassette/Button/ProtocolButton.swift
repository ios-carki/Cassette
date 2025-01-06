//
//  File.swift
//
//
//  Created by OWEN on 1/6/25.
//

import SwiftUI

internal protocol ProtocolButton {
    var text: String? { get set }
    var buttonMode: ButtonMode { get set }
    var imageDirection: ImageDirection? { get set }
    var imageType: ImageType? { get set }
    
    
    //Text
    var bindingText: Binding<String>? { get set }
    var textColor: Color { get set }
    var disableTextColor: Color { get set }
    var textFont: Font { get set }
    
    //Image
    var imageName: String? { get set }
    
    //Design
    //Border
    var buttonCornerRadius: CGFloat { get set }
    var buttonBorderWidth: CGFloat { get set }
    var buttonBorderColor: Color { get set }
    
    //Background
    var gradientStartPoint: UnitPoint { get set }
    var gradientEndPoint: UnitPoint { get set }
    var buttonBackgroundColor: Color { get set }
    var buttonLinearBackgroundColors: [Color] { get set }
    var buttonDisableBackgroundColor: Color { get set }
    var buttonDisableLinearBackgroundColors: [Color] { get set }
    
    //Frame
    var buttonHeight: CGFloat { get set }
    
    //Action
    var clickAction: (() -> ())? { get set }
    var disabled : Binding<Bool>? { get set }
}

extension ProtocolButton {
    var textColor: Color {
        get { BtnCassetteConfig.shared.defaultButtonTextColor }
        set { BtnCassetteConfig.shared.defaultButtonTextColor = newValue }
    }
    
    var disableTextColor: Color {
        get { BtnCassetteConfig.shared.defaultDisableTextColor }
        set { BtnCassetteConfig.shared.defaultDisableTextColor = newValue }
    }
    
    var textFont: Font {
        get { BtnCassetteConfig.shared.defaultButtonTextFont }
        set { BtnCassetteConfig.shared.defaultButtonTextFont = newValue }
    }
    
    var buttonCornerRadius: CGFloat {
        get { BtnCassetteConfig.shared.defaultButtonCornerRadius }
        set { BtnCassetteConfig.shared.defaultButtonCornerRadius = newValue }
    }
    
    var buttonBorderWidth: CGFloat {
        get { BtnCassetteConfig.shared.defaultBorderWidth }
        set { BtnCassetteConfig.shared.defaultBorderWidth = newValue }
    }
    var buttonBorderColor: Color {
        get { BtnCassetteConfig.shared.defaultBorderColor }
        set { BtnCassetteConfig.shared.defaultBorderColor = newValue }
    }
    
    //Background
    var gradientStartPoint: UnitPoint {
        get { BtnCassetteConfig.shared.defaultGradientStartPoint }
        set { BtnCassetteConfig.shared.defaultGradientStartPoint = newValue }
    }
    
    var gradientEndPoint: UnitPoint {
        get { BtnCassetteConfig.shared.defaultGradientEndPoint }
        set { BtnCassetteConfig.shared.defaultGradientEndPoint = newValue }
    }
    
    var buttonBackgroundColor: Color {
        get { BtnCassetteConfig.shared.defaultButtonBackgroundColor }
        set { BtnCassetteConfig.shared.defaultButtonBackgroundColor = newValue }
    }
    
    var buttonLinearBackgroundColors: [Color] {
        get { BtnCassetteConfig.shared.defaultButtonLinearBackgroundColors }
        set { BtnCassetteConfig.shared.defaultButtonLinearBackgroundColors = newValue }
    }
    
    var buttonDisableBackgroundColor: Color {
        get { BtnCassetteConfig.shared.defaultbuttonDisableBackgroundColor }
        set { BtnCassetteConfig.shared.defaultbuttonDisableBackgroundColor = newValue }
    }
    var buttonDisableLinearBackgroundColors: [Color] {
        get { BtnCassetteConfig.shared.defaultButtonDisableLinearBackgroundColors }
        set { BtnCassetteConfig.shared.defaultButtonDisableLinearBackgroundColors = newValue }
    }
    
    //Frame
    var buttonHeight: CGFloat {
        get { BtnCassetteConfig.shared.defaultButtonHeight }
        set { BtnCassetteConfig.shared.defaultButtonHeight = newValue }
    }
}
