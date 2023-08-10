//
//  BtnCassetteConfig.swift
//  
//
//  Created by HESSEGG on 2023/08/09.
//

import SwiftUI

@available(iOS 13.0, *)
public class BtnCassetteConfig {
    public static var shared = BtnCassetteConfig()
    
    private init() {}
    //Text
    public var defaultButtonText: String = "Set Title First"
    public var defaultButtonTextColor: Color = .yellow
    public var defaultButtonTextFont: Font = .callout
    
    //Design
    //Border
    public var defaultButtonCornerRadius: CGFloat = 12
    
    //Background
    public var defaultButtonBackgroundColor: Color = .black
    public var defaultbuttonDisableBackgroundColor: Color = .gray
    
    //Frame
    public var defaultButtonHeight: CGFloat = 50
}
