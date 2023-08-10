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
        }.disabled(disabled?.wrappedValue ?? false)
    }
}

@available(iOS 13.0, *)
extension BtnCassette {
    
    public func setTitle(text: String?) -> Self {
        var copy = self
        copy.buttonText = text
        return copy
    }
    
    public func setDisable(disable: Binding<Bool>?) -> Self {
        var copy = self
        copy.disabled = disable
        return copy
    }
    
    public func click(_ click: (() -> Void)?) -> Self {
        var copy = self
        copy.clickAction = click
        return copy
    }
    
    public func setMode(mode: ButtonMode?) -> Self {
        var copy = self

        if mode == .normal {

        }

        if mode == .clear {
            copy.buttonBackgroundColor = .clear
        }

        return copy
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BtnCassette()
    }
}
