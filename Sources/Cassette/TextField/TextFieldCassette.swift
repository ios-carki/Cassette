//
//  TextFieldCassette.swift
//
//
//  Created by carki on 2023/09/13.
//

import SwiftUI

public struct TextFieldCassette: View {
    
    public enum ImageDirection {
        case trailing
        case leading
    }
    
    public enum ImageType {
        case system(color: Color)
        case custom
    }
    
    public enum TextFieldMode {
        case underLine(placeHolder: String?, text: Binding<String>, title: String?, alignment: Alignment?)
        case rectangleBox(text: Binding<String>)
    }
    
    public var textFieldMode: TextFieldMode
    public var imageDirection: ImageDirection?
    public var imageType: ImageType?
    
    //SecureField
    @State public var isSecure: Bool = false
    
    //Title
    private var titleText: String?
    private var titleTextFont: Font = TextFieldCassetteConfig.shared.defaultTitleTextFont
    private var titleTextColor: Color = TextFieldCassetteConfig.shared.defaultTitleTextColor
    private var titleTextSpacing: CGFloat = TextFieldCassetteConfig.shared.defaultTitleTextSpacing
    private var titleTextAlignment: Alignment = TextFieldCassetteConfig.shared.defaultTitleTextAlignment
    
    //Text
    private var text: Binding<String>
    private var textFont: Font = TextFieldCassetteConfig.shared.defaultTextFont
    private var textColor: Color = TextFieldCassetteConfig.shared.defaultTextColor
    private var textAlignment: Alignment = TextFieldCassetteConfig.shared.defaultTextAlignment
    
    //PlaceHolder
    private var placeHolderText: String?
    private var placeHolderTextColor: Color = TextFieldCassetteConfig.shared.defaultPlaceHolderTextColor
    private var placeHolderTextFont: Font = TextFieldCassetteConfig.shared.defaultPlaceHolderTextFont
    private var placeHolderTextAlignment: Alignment = TextFieldCassetteConfig.shared.defaultPlaceHolderTextAlignment
    
    //Image
    private var imageName: String?
    private var imageColor: Color?
    
    //Design
    private var textFieldHeight: CGFloat = TextFieldCassetteConfig.shared.defaultTextFieldHeight
    private var rectangleFieldBackgroundColor: Color = TextFieldCassetteConfig.shared.defaultRectangleFieldBackgroundColor
    private var rectangleFieldCornerRadius: CGFloat = TextFieldCassetteConfig.shared.defaultRectangleFieldCornerRadius
    private var rectangleFieldBorderColor: Color = TextFieldCassetteConfig.shared.defaultRectangleFieldBorderColor
    private var rectangleFieldBorderWidth: CGFloat = TextFieldCassetteConfig.shared.defaultRectangleFieldBorderWidth
    
    //Error
    private var isError: Binding<Bool>?
    private var errorColor: Color = TextFieldCassetteConfig.shared.defaultErrorColor
    
    //Action
    private var imageTapGesture: (() -> ())?
    
    public init(mode: TextFieldMode) {
        self.textFieldMode = mode
        
        switch self.textFieldMode {
        case .underLine(let placeHolder, let text, let title, let alignment):
            self.placeHolderText = placeHolder
            self.text = text
            self.titleText = title
            self.titleTextAlignment = alignment ?? .leading
            
        case .rectangleBox(let text):
            self.text = text
        }
    }
    
    public func systemImage(image: String) -> some View {
        var imageView: some View {
           Image(systemName: image)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundColor(imageColor ?? .black)
                .onTapGesture {
                    imageTapGesture?()
                }
        }
        
        return imageView
    }
    
    public func customImage(image: String) -> some View {
        var imageView: some View {
           Image(image)
                .resizable()
                .frame(width: 24, height: 24)
                .onTapGesture {
                    imageTapGesture?()
                }
        }
        
        return imageView
    }
    
    public var textFieldView: some View {
        TextField("", text: text)
            .placeholder(when: text.wrappedValue.isEmpty, alignment: placeHolderTextAlignment, placeholder: {
                Text(placeHolderText ?? "")
                    .foregroundColor(placeHolderTextColor)
                    .font(placeHolderTextFont)
            })
            .foregroundColor(textColor)
            .font(textFont)
    }
    
    public var secureTextFieldView: some View {
        SecureField("", text: text)
    }
    
    public var underLine: some View {
        VStack(spacing: titleTextSpacing) {
            if titleText != nil {
                Text(titleText ?? "")
                    .foregroundColor(titleTextColor)
                    .font(titleTextFont)
                    .frame(maxWidth: .infinity, alignment: titleTextAlignment)
            }
            
            HStack {
                if imageDirection != nil && imageType != nil {
                    switch imageDirection {
                    case .leading:
                        switch imageType {
                        case .system:
                            systemImage(image: imageName ?? "")
                            Spacer()
                        case .custom:
                            customImage(image: imageName ?? "")
                            Spacer()
                        default:
                            EmptyView()
                            
                        }
                        
                        textFieldType()
                        
                    case .trailing:
                        
                        textFieldType()
                        
                        switch imageType {
                        case .system:
                            Spacer()
                            systemImage(image: imageName ?? "")
                        case .custom:
                            Spacer()
                            customImage(image: imageName ?? "")
                        default:
                            EmptyView()
                        }
                        
                    default:
                        EmptyView()
                    }
                } else {
                    textFieldType()
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .frame(height: textFieldHeight)
            .frame(maxWidth: .infinity, alignment: textAlignment)
            .background(rectangleFieldBackgroundColor)
            .cornerRadius(rectangleFieldCornerRadius)
            .overlay(
              RoundedRectangle(cornerRadius: rectangleFieldCornerRadius)
                .inset(by: 0.5)
                .stroke((isError?.wrappedValue ?? false) ? getBorderColor() : rectangleFieldBorderColor, lineWidth: rectangleFieldBorderWidth)
            )
            
        }
    }
    
    
    public var body: some View {
        underLine
    }
    
    private func textFieldType() -> AnyView {
        if isSecure {
            return AnyView(secureTextFieldView)
        } else {
            return AnyView(textFieldView)
        }
    }
    
    private func getBorderColor() -> Color {
        
        if (isError?.wrappedValue ?? false) {
            return getErrorColor()
        } else if isError == nil {
            return rectangleFieldBorderColor
        }
        
        return .red
    }
    
    private func getErrorColor() -> Color {
        return (isError?.wrappedValue ?? false) ? errorColor : rectangleFieldBorderColor
    }
}

extension TextFieldCassette {
    //SecureField
    public func setSecureField(isSecure: Bool) -> Self {
        var copy = self
        copy._isSecure = State(initialValue: isSecure)
        return copy
    }
    
    //Title
    public func setTitleTextFont(_ font: Font) -> Self {
        var copy = self
        copy.titleTextFont = font
        return copy
    }
    
    public func setTitleTextColor(_ color: Color) -> Self {
        var copy = self
        copy.titleTextColor = color
        return copy
    }
    
    public func setTitleTextSpacing(spacing: CGFloat) -> Self {
        var copy = self
        copy.titleTextSpacing = spacing
        return copy
    }
    
    public func setTitleTextAlignment(alignment: Alignment) -> Self {
        var copy = self
        copy.titleTextAlignment = alignment
        return copy
    }
    
    //Text
    public func setTextFont(_ font: Font) -> Self {
        var copy = self
        copy.textFont = font
        return copy
    }
    
    public func setTextColor(_ color: Color) -> Self {
        var copy = self
        copy.textColor = color
        return copy
    }
    
    public func setTextAlignment(alignment: Alignment) -> Self {
        var copy = self
        copy.textAlignment = alignment
        return copy
    }
    
    //PlaceHolder
    public func setPlaceHolderTextColor(_ color: Color) -> Self {
        var copy = self
        copy.placeHolderTextColor = color
        return copy
    }
    
    public func setPlaceHolderTextFont(_ font: Font) -> Self {
        var copy = self
        copy.placeHolderTextFont = font
        return copy
    }
    
    public func setPlaceHolderTextAlignment(alignment: Alignment) -> Self {
        var copy = self
        copy.placeHolderTextAlignment = alignment
        return copy
    }
    
    //Design
    public func setTextFieldHeight(_ height: CGFloat) -> Self {
        var copy = self
        copy.textFieldHeight = height
        return copy
    }

    public func setReactangleFieldBackgroundColor(_ color: Color) -> Self {
        var copy = self
        copy.rectangleFieldBackgroundColor = color
        return copy
    }
    
    public func setRectangleFieldCornerRadius(_ radius: CGFloat) -> Self {
        var copy = self
        copy.rectangleFieldCornerRadius = radius
        return copy
    }
    
    public func setRectangleFieldBorderColor(_ color: Color) -> Self {
        var copy = self
        copy.rectangleFieldBorderColor = color
        return copy
    }
    
    public func setRectangleFieldBorderWidth(_ width: CGFloat) -> Self {
        var copy = self
        copy.rectangleFieldBorderWidth = width
        return copy
    }
    
    //Error
    public func setError(isError: Binding<Bool>, errorColor: Color) -> Self {
        var copy = self
        copy.isError = isError
        
        if isError.wrappedValue {
            copy.errorColor = errorColor
        } else {
            copy.errorColor = rectangleFieldBorderColor
        }
        
        return copy
    }
    
    //Image
    public func setImageButton(imageDirection: ImageDirection, imageType: ImageType, imageName: String, action: (() -> ())?) -> Self {
        var copy = self
        copy.imageDirection = imageDirection
        copy.imageType = imageType
        copy.imageName = imageName
        copy.imageTapGesture = action
        
        switch imageType {
        case .system(let color):
            copy.imageColor = color
        case .custom:
            break
        }
        
        return copy
    }
}

public final class TextFieldCassetteConfig {
    public static var shared = TextFieldCassetteConfig()
    
    private init() {}
    
    //Title
    public var defaultTitleTextFont: Font = .callout
    public var defaultTitleTextColor: Color = .black
    public var defaultTitleTextSpacing: CGFloat = 8
    public var defaultTitleTextAlignment: Alignment = .leading
    
    //Text
    public var defaultTextFont: Font = .callout
    public var defaultTextColor: Color = .black
    public var defaultTextAlignment: Alignment = .leading
    
    //PlaceHolder
    public var defaultPlaceHolderTextColor: Color = .gray
    public var defaultPlaceHolderTextFont: Font = .callout
    public var defaultPlaceHolderTextAlignment: Alignment = .leading
    
    //Design
    public var defaultTextFieldHeight: CGFloat = 50
    public var defaultRectangleFieldBackgroundColor: Color = .yellow
    public var defaultRectangleFieldCornerRadius: CGFloat = 12
    public var defaultRectangleFieldBorderColor: Color = .orange
    public var defaultRectangleFieldBorderWidth: CGFloat = 2
    
    //Error
    public var defaultErrorColor: Color = .red
}

public struct TextFieldCassette_Previews: PreviewProvider {
    public static var previews: some View {
        VStack {
            TextFieldCassette(mode: .underLine(placeHolder: "이것은 플레이스 홀더", text: .constant("asdf"), title: "title", alignment: nil))
                .setImageButton(imageDirection: .trailing, imageType: .system(color: .red), imageName: "globe", action: {
                    print("Hello")
                })
                .setSecureField(isSecure: false)
            
        }
        .padding(.horizontal, 16)
    }
}

extension View {
    fileprivate func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
