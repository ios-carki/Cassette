//
//  File.swift
//  
//
//  Created by OWEN on 1/6/25.
//

import SwiftUI

public final class BtnCassetteConfig {
    public static var shared = BtnCassetteConfig()
        
    private init() {}
    //Text
    public var defaultButtonTextColor: Color = .blue
    public var defaultDisableTextColor: Color = .gray
    public var defaultButtonTextFont: Font = .callout
    
    //Design
    //Border
    public var defaultButtonCornerRadius: CGFloat = 12
    public var defaultBorderWidth: CGFloat = 1
    public var defaultBorderColor: Color = .blue
    
    //Background
    public var defaultButtonBackgroundColor: Color = .white
    public var defaultButtonLinearBackgroundColors: [Color] = [.white]
    public var defaultbuttonDisableBackgroundColor: Color = .gray
    public var defaultButtonDisableLinearBackgroundColors: [Color] = [.gray]
    public var defaultGradientStartPoint: UnitPoint = .topLeading
    public var defaultGradientEndPoint: UnitPoint = .bottomTrailing
    
    //Frame
    public var defaultButtonHeight: CGFloat = 50
}
