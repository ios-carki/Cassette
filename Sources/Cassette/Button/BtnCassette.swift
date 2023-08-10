//
//  BtnCassette.swift
//  
//
//  Created by carki on 2023/08/09.
//

import SwiftUI

@available(iOS 13.0, *)
public struct BtnCassette: View {
    //Text
    private var buttonText: String?
    private var buttonTextColor: Color = BtnCassetteConfig.shared.defaultButtonTextColor
    private var buttonTextFont: Font = BtnCassetteConfig.shared.defaultButtonTextFont
    
    //Design
    //Border
    private var buttonCornerRadius: CGFloat = BtnCassetteConfig.shared.defaultButtonCornerRadius
    private var buttonBorderWidth: CGFloat = BtnCassetteConfig.shared.defaultBorderWidth
    private var buttonBorderColor: Color = BtnCassetteConfig.shared.defaultBorderColor
    
    
    //Background
    private var buttonBackgroundColor: Color = BtnCassetteConfig.shared.defaultButtonBackgroundColor
    private var buttonDisableBackgroundColor: Color = BtnCassetteConfig.shared.defaultbuttonDisableBackgroundColor
    
    //Frame
    private var buttonHeight: CGFloat = BtnCassetteConfig.shared.defaultButtonHeight
    
    //Action
    private var clickAction: (() -> ())?
    private var disabled : Binding<Bool>?
    
    //Setting
    private var buttonMode: ButtonMode?
    
    public init() {
        
    }
    
    public var body: some View {
        Button {
            clickAction?()
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Text(buttonText ?? BtnCassetteConfig.shared.defaultButtonText)
                    .foregroundColor(buttonTextColor)
                    .font(buttonTextFont)
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 12)
            .frame(height: buttonHeight, alignment: .center)
            .frame(maxWidth: .infinity)
            .background((disabled?.wrappedValue ?? false) ? buttonDisableBackgroundColor : buttonBackgroundColor)
            .cornerRadius(buttonCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: buttonCornerRadius)
                    .inset(by: 0.5)
                    .stroke(buttonBorderColor, lineWidth: buttonBorderWidth)
            )
        }.disabled(disabled?.wrappedValue ?? false)
    }
}

@available(iOS 13.0, *)
extension BtnCassette {
    
    // Mode
    public func setMode(mode: ButtonMode?) -> Self {
        var copy = self

        if mode == .normal {

        }

        if mode == .clear {
            copy.buttonBackgroundColor = .clear
        }

        return copy
    }
    
    // Text
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

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Color.gray.ignoresSafeArea()
            } else {
                // Fallback on earlier versions
            }
            BtnCassette()
                .padding(.horizontal, 20)
        }
    }
}
