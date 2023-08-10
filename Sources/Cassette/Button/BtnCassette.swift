//
//  BtnCassette.swift
//  
//
//  Created by carki on 2023/08/09.
//

import SwiftUI

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
            .background(buttonBackgroundColor)
            .cornerRadius(buttonCornerRadius)
        }.disabled(disabled?.wrappedValue ?? false)
    }
}

extension BtnCassette {
    
    func click(_ click: (() -> Void)?) -> Self {
        var copy = self
        copy.clickAction = click
        return copy
    }
    
//    func setMode(mode: ButtonMode?) -> Self {
//        var copy = self
//
//        if mode == .normal {
//
//        }
//
//        if mode == .clear {
//            copy.buttonBackgroundColor = .clear
//        }
//
//        return copy
//    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BtnCassette()
    }
}
