//
//  BtnCassette.swift
//  
//
//  Created by carki on 2023/08/09.
//

import SwiftUI

struct BtnCassette: View {
    //Text
    private var buttonText: String?
    private var buttonTextColor: Color?
    private var buttonTextFont: Font?
    
    //Design
    //Border
    private var buttonCornerRadius: CGFloat?
    
    //Background
    private var buttonBackgroundColor: Color?
    private var buttonDisableBackgroundColor: Color?
    
    //Frame
    private var buttonHeight: CGFloat?
    
    //Action
    private var clickAction: (() -> ())?
    private var disabled : Binding<Bool>?
    
    //Setting
    private var buttonMode: ButtonMode?
    
    var body: some View {
        Button {
            clickAction?()
        } label: {
            HStack(alignment: .center, spacing: 10) {
                Text(buttonText ?? BtnCassetteConfig.shared.defaultButtonText)
                    .foregroundColor(buttonTextColor ?? BtnCassetteConfig.shared.defaultButtonTextColor)
                    .font(buttonTextFont ?? BtnCassetteConfig.shared.defaultButtonTextFont)
            }
            .padding(.horizontal, 22)
            .padding(.vertical, 12)
            .frame(height: buttonHeight ?? BtnCassetteConfig.shared.defaultButtonHeight, alignment: .center)
            .frame(maxWidth: .infinity)
            .background(buttonBackgroundColor ?? BtnCassetteConfig.shared.defaultButtonBackgroundColor)
            .cornerRadius(buttonCornerRadius ?? BtnCassetteConfig.shared.defaultButtonCornerRadius)
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
