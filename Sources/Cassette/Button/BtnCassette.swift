//
//  BtnCassette.swift
//  
//
//  Created by carki on 2023/08/09.
//

import SwiftUI

@available(macOS 11.0, *)
@available(iOS 13.0, *)
public struct BtnCassette: View, ProtocolButton {
    var text: String?
    
    public var buttonMode: ButtonMode
    public var imageDirection: ImageDirection?
    public var imageType: ImageType?
    
    //Text
    private var bindingText: Binding<String>?
    internal var textColor: Color = BtnCassetteConfig.shared.defaultButtonTextColor
    internal var disableTextColor: Color = BtnCassetteConfig.shared.defaultDisableTextColor
    internal var textFont: Font = BtnCassetteConfig.shared.defaultButtonTextFont
    
    //Image
    private var imageName: String?
    
    //Design
    //Border
    internal var buttonCornerRadius: CGFloat = BtnCassetteConfig.shared.defaultButtonCornerRadius
    internal var buttonBorderWidth: CGFloat = BtnCassetteConfig.shared.defaultBorderWidth
    internal var buttonBorderColor: Color = BtnCassetteConfig.shared.defaultBorderColor
    
    //Background
    internal var gradientStartPoint: UnitPoint = BtnCassetteConfig.shared.defaultGradientStartPoint
    internal var gradientEndPoint: UnitPoint = BtnCassetteConfig.shared.defaultGradientEndPoint
    internal var buttonBackgroundColor: Color = BtnCassetteConfig.shared.defaultButtonBackgroundColor
    internal var buttonLinearBackgroundColors: [Color] = BtnCassetteConfig.shared.defaultButtonLinearBackgroundColors
    internal var buttonDisableBackgroundColor: Color = BtnCassetteConfig.shared.defaultbuttonDisableBackgroundColor
    internal var buttonDisableLinearBackgroundColors: [Color] = BtnCassetteConfig.shared.defaultButtonDisableLinearBackgroundColors
    
    //Frame
    internal var buttonHeight: CGFloat = BtnCassetteConfig.shared.defaultButtonHeight
    
    //Action
    internal var clickAction: (() -> ())?
    internal var disabled : Binding<Bool>?
    
    //Normal
    public init(buttonMode: ButtonMode) {
        self.buttonMode = buttonMode
        
        switch self.buttonMode {
        case .normal(let text):
            self.text = text
            
        case .normalGradient(let text):
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
                .foregroundColor((disabled?.wrappedValue == true) ? disableTextColor : textColor)
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
    
    public var normalGradientButton: some View {
        
        HStack(alignment: .center, spacing: 10) {
            Text(text ?? "")
                .foregroundColor((disabled?.wrappedValue == true) ? disableTextColor : textColor)
                .font(textFont)
        }
        .padding(.horizontal, 22)
        .padding(.vertical, 12)
        .frame(maxWidth: .infinity)
        .frame(height: buttonHeight, alignment: .center)
        .background((disabled?.wrappedValue == true) ? LinearGradient(colors: buttonDisableLinearBackgroundColors, startPoint: gradientStartPoint, endPoint: gradientEndPoint) : LinearGradient(colors: buttonLinearBackgroundColors, startPoint: gradientStartPoint, endPoint: gradientEndPoint))
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
                .foregroundColor((disabled?.wrappedValue == true) ? disableTextColor : textColor)
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
                        .foregroundColor((disabled?.wrappedValue == true) ? disableTextColor : textColor)
                        .font(textFont)
                    Image(systemName: imageName ?? "globe")
                case .leading:
                    Image(systemName: imageName ?? "globe")
                    Text(text ?? "")
                        .foregroundColor((disabled?.wrappedValue == true) ? disableTextColor : textColor)
                        .font(textFont)
                default:
                    EmptyView()
                }
            case .custom:
                switch imageDirection {
                case .trailing:
                    Text(text ?? "")
                        .foregroundColor((disabled?.wrappedValue == true) ? disableTextColor : textColor)
                        .font(textFont)
                    Image(imageName ?? "")
                case .leading:
                    Image(systemName: imageName ?? "")
                    Text(text ?? "")
                        .foregroundColor((disabled?.wrappedValue == true) ? disableTextColor : textColor)
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
            case .normalGradient:
                normalGradientButton
            case .bindingText:
                bindingTextButton
            case .imageButton:
                imageButton
            }
        }
        .disabled(disabled?.wrappedValue ?? false)
    }
}

@available(macOS 11.0, *)
struct BtnCassette_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            if #available(iOS 14.0, *) {
                Color.white.ignoresSafeArea()
            } else {
                // Fallback on earlier versions
            }
//            BtnCassette(buttonMode: .normal(text: "asdf"))
            BtnCassette(buttonMode: .normalGradient(text: "asdf"))
                .setLinearBackgroundColor(colors: [.black, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
    }
}
