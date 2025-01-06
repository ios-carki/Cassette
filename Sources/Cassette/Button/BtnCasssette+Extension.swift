//
//  File.swift
//  
//
//  Created by OWEN on 1/6/25.
//

import SwiftUI

//MARK: Text
extension BtnCassette {
    public func setTitleTextColor(color: Color) -> Self {
        var copy = self
        copy.textColor = color
        return copy
    }
    
    public func setDisableTitleTextColor(color: Color) -> Self {
        var copy = self
        copy.disableTextColor = color
        return copy
    }
    
    public func setTitleTextFont(font: Font) -> Self {
        var copy = self
        copy.textFont = font
        return copy
    }
}

//MARK: Border
extension BtnCassette {
    public func setCornerRadius(_ radius: CGFloat) -> Self {
        var copy = self
        copy.buttonCornerRadius = radius
        return copy
    }
    
    public func setBorderWidth(width: CGFloat) -> Self {
        var copy = self
        copy.buttonBorderWidth = width
        return copy
    }
    
    public func setBorderColor(color: Color) -> Self {
        var copy = self
        copy.buttonBorderColor = color
        return copy
    }
}

//MARK: Frame
extension BtnCassette {
    public func setButtonHeight(height: CGFloat) -> Self {
        var copy = self
        copy.buttonHeight = height
        return copy
    }
}

//MARK: Background
extension BtnCassette {
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
    
    public func setLinearBackgroundColor(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint) -> Self {
        var copy = self
        copy.buttonLinearBackgroundColors = colors
        copy.gradientStartPoint = startPoint
        copy.gradientEndPoint = endPoint
        return copy
    }
    
    public func setLinearDisableBackgroundColor(colors: [Color], startPoint: UnitPoint, endPoint: UnitPoint) -> Self {
        var copy = self
        copy.buttonDisableLinearBackgroundColors = colors
        copy.gradientStartPoint = startPoint
        copy.gradientEndPoint = endPoint
        return copy
    }
}

//MARK: Action
extension BtnCassette {
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
}
