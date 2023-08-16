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
    private var imageType: ImageType?
    
    //Image
    private var buttonImage: String?
    
    public init() {
        
    }
    
    public var body: some View {
        Button {
            clickAction?()
        } label: {
            HStack(alignment: .center, spacing: 10) {
                if buttonMode == .leadingImage {
                    if imageType == .system {
                        Image(systemName: buttonImage ?? "Error: Check your image name")
                            .foregroundColor(.white)
                    } else if imageType == .custom {
                        Image(buttonImage ?? "Error: Check your image name")
                            .foregroundColor(.white)
                    }
                }
                
                Text(buttonText ?? BtnCassetteConfig.shared.defaultButtonText)
                    .foregroundColor(buttonTextColor)
                    .font(buttonTextFont)
                
                if buttonMode == .trailingImage {
                    if imageType == .system {
                        Image(systemName: buttonImage ?? "Error: Check your image name")
                            .foregroundColor(.white)
                    } else if imageType == .custom {
                        Image(buttonImage ?? "Error: Check your image name")
                            .foregroundColor(.white)
                    }
                }
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
    public func setMode(mode: ButtonMode?, setImageType: ImageType? = nil) -> Self {
        var copy = self

        if mode == .normal {
            copy.buttonMode = .normal
            copy.buttonBorderColor = .white
            copy.buttonBackgroundColor = .black
            copy.buttonTextColor = .white
        }

        if mode == .clear {
            copy.buttonMode = .clear
            copy.buttonBorderColor = .black
            copy.buttonBackgroundColor = .clear
            copy.buttonTextColor = .black
        }
        
        if mode == .trailingImage {
            copy.buttonMode = .trailingImage
            if setImageType == .system {
                copy.imageType = .system
            } else if setImageType == .custom {
                copy.imageType = .custom
            }
        }
        
        if mode == .leadingImage {
            copy.buttonMode = .leadingImage
            if setImageType == .system {
                copy.imageType = .system
            } else if setImageType == .custom {
                copy.imageType = .custom
            }
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
    
    //Setting
    public func setButtonImage(imageName: String) -> Self {
        var copy = self
        copy.buttonImage = imageName
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
                .setMode(mode: .trailingImage, setImageType: .system)
                .setButtonImage(imageName: "globe")
                .padding(.horizontal, 20)
                
        }
    }
}
