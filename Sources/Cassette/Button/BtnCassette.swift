//
//  BtnCassette.swift
//  
//
//  Created by carki on 2023/08/09.
//

import SwiftUI

@available(iOS 13.0, *)
public struct BtnCassette: View {
    
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
        case imageButton(text: String, imageDirection: ImageDirection, imageType: ImageType, imageName: String)
        case bindingText(text: Binding<String>)
    }
    
    public var buttonMode: ButtonMode
    public var imageDirection: ImageDirection?
    public var imageType: ImageType?
    
    //Text
    private var text: String?
    private var bindingText: Binding<String>?
    private var textColor: Color = BtnCassetteConfig.shared.defaultButtonTextColor
    private var textFont: Font = BtnCassetteConfig.shared.defaultButtonTextFont
    
    //Image
    private var imageName: String?
    
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
    
//    public init() {
//        buttonMode = .normal(text ?? "")
//    }
    //Normal
    public init(buttonMode: ButtonMode) {
        self.buttonMode = buttonMode
        
        switch self.buttonMode {
        case .normal(let text):
            self.text = text
            
        case .bindingText(let text):
            self.bindingText = text
            
        case .imageButton(let text, let imageDirection, let imageType, let imageName):
            self.text = text
            self.imageDirection = imageDirection
            self.imageType = imageType
            self.imageName = imageName
            
        }
    }
    
    public var normalButton: some View {
        
        HStack(alignment: .center, spacing: 10) {
            Text(text ?? "")
                .foregroundColor(textColor)
                .font(textFont)
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .frame(height: buttonHeight, alignment: .center)
        .background((disabled?.wrappedValue == true) ? buttonDisableBackgroundColor : buttonBackgroundColor)
        .cornerRadius(buttonCornerRadius)
        .overlay(
          RoundedRectangle(cornerRadius: buttonCornerRadius)
            .inset(by: 0.5)
            .stroke(buttonBorderColor, lineWidth: buttonBorderWidth)
        )
    }
    
    public var bindingTextButton: some View {
        HStack(alignment: .center, spacing: 10) {
            Text(bindingText?.wrappedValue ?? "")
                .foregroundColor(textColor)
                .font(textFont)
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .frame(height: buttonHeight, alignment: .center)
        .background((disabled?.wrappedValue == true) ? buttonDisableBackgroundColor : buttonBackgroundColor)
        .cornerRadius(buttonCornerRadius)
        .overlay(
          RoundedRectangle(cornerRadius: buttonCornerRadius)
            .inset(by: 0.5)
            .stroke(buttonBorderColor, lineWidth: buttonBorderWidth)
        )
    }
    
    public var imageButton: some View {
        HStack(alignment: .center, spacing: 10) {
            switch imageType {
            case .system:
                switch imageDirection {
                case .trailing:
                    Text(text ?? "")
                        .foregroundColor(textColor)
                        .font(textFont)
                    Image(systemName: imageName ?? "globe")
                case .leading:
                    Image(systemName: imageName ?? "globe")
                    Text(text ?? "")
                        .foregroundColor(textColor)
                        .font(textFont)
                default:
                    EmptyView()
                }
            case .custom:
                switch imageDirection {
                case .trailing:
                    Text(text ?? "")
                        .foregroundColor(textColor)
                        .font(textFont)
                    Image(imageName ?? "")
                case .leading:
                    Image(systemName: imageName ?? "")
                    Text(text ?? "")
                        .foregroundColor(textColor)
                        .font(textFont)
                default:
                    EmptyView()
                }
                
            default:
                EmptyView()
            }
            
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .frame(height: buttonHeight, alignment: .center)
        .background((disabled?.wrappedValue == true) ? buttonDisableBackgroundColor : buttonBackgroundColor)
        .cornerRadius(buttonCornerRadius)
        .overlay(
          RoundedRectangle(cornerRadius: buttonCornerRadius)
            .inset(by: 0.5)
            .stroke(buttonBorderColor, lineWidth: buttonBorderWidth)
        )
    }
    
    public var body: some View {
        Button {
            clickAction?()
        } label: {
            switch buttonMode {
            case .normal:
                normalButton
            case .bindingText:
                bindingTextButton
            case .imageButton:
                imageButton
            }
        }
        .disabled(disabled?.wrappedValue ?? false)
    }
}

extension BtnCassette {
    // Text
    public func setTitleTextColor(color: Color) -> Self {
        var copy = self
        copy.textColor = color
        return copy
    }
    
    public func setTitleTextFont(font: Font) -> Self {
        var copy = self
        copy.textFont = font
        return copy
    }
    
    // Design
    // Border
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
    
    public func setButtonHeight(height: CGFloat) -> Self {
        var copy = self
        copy.buttonHeight = height
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

@available(iOS 13.0, *)
public final class BtnCassetteConfig {
    public static var shared = BtnCassetteConfig()
        
        private init() {}
        //Text
        public var defaultButtonTextColor: Color = .blue
        public var defaultButtonTextFont: Font = .callout
        
        //Design
        //Border
        public var defaultButtonCornerRadius: CGFloat = 12
        public var defaultBorderWidth: CGFloat = 1
        public var defaultBorderColor: Color = .blue
        
        //Background
        public var defaultButtonBackgroundColor: Color = .white
        public var defaultbuttonDisableBackgroundColor: Color = .gray
        
        //Frame
        public var defaultButtonHeight: CGFloat = 50
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Color.white.ignoresSafeArea()
            } else {
                // Fallback on earlier versions
            }
            BtnCassette(buttonMode: .normal(text: "asdf"))
                
        }
    }
}
