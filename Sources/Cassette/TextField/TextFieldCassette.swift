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
        case system
        case custom
    }
    
    public enum TextFieldMode {
        case underLine(text: Binding<String>, title: String?, alignment: Alignment?)
        case rectangleBox(text: Binding<String>)
    }
    
    public var textFieldMode: TextFieldMode
    public var imageDirection: ImageDirection?
    public var imageType: ImageType?
    
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
    
    //Image
    private var imageName: String?
    
    //Design
    private var textFieldHeight: CGFloat = TextFieldCassetteConfig.shared.defaultTextFieldHeight
    private var rectangleFieldBackgroundColor: Color = TextFieldCassetteConfig.shared.defaultRectangleFieldBackgroundColor
    private var rectangleFieldCornerRadius: CGFloat = TextFieldCassetteConfig.shared.defaultRectangleFieldCornerRadius
    private var rectangleFieldBorderColor: Color = TextFieldCassetteConfig.shared.defaultRectangleFieldBorderColor
    private var rectangleFieldBorderWidth: CGFloat = TextFieldCassetteConfig.shared.defaultRectangleFieldBorderWidth
    
    //Action
    private var imageTapGesture: (() -> ())?
    
    public init(mode: TextFieldMode) {
        self.textFieldMode = mode
        
        switch self.textFieldMode {
        case .underLine(let text, let title, let alignment):
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
                .onTapGesture {
                    imageTapGesture?()
                }
        }
        
        return imageView
    }
    
    public func customImage(image: String) -> some View {
        var imageView: some View {
           Image(image)
                .onTapGesture {
                    imageTapGesture?()
                }
        }
        
        return imageView
    }
    
    public var textFieldView: some View {
        TextField("", text: text)
            .foregroundColor(textColor)
            .font(textFont)
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
                    
                    textFieldView
                    
                case .trailing:
                    
                    textFieldView
                    
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
                .stroke(rectangleFieldBorderColor, lineWidth: rectangleFieldBorderWidth)
            )
            
        }
    }
    
    
    public var body: some View {
        underLine
    }
}

extension TextFieldCassette {
    public func setImageButton(imageDirection: ImageDirection, imageType: ImageType, imageName: String, action: (() -> ())?) -> Self {
        var copy = self
        copy.imageDirection = imageDirection
        copy.imageType = imageType
        copy.imageName = imageName
        copy.imageTapGesture = action
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
    
    //Design
    public var defaultTextFieldHeight: CGFloat = 50
    public var defaultRectangleFieldBackgroundColor: Color = .yellow
    public var defaultRectangleFieldCornerRadius: CGFloat = 12
    public var defaultRectangleFieldBorderColor: Color = .orange
    public var defaultRectangleFieldBorderWidth: CGFloat = 2
}

public struct TextFieldCassette_Previews: PreviewProvider {
    public static var previews: some View {
        TextFieldCassette(mode: .underLine(text: .constant("asdf"), title: "title", alignment: nil))
            .setImageButton(imageDirection: .trailing, imageType: .system, imageName: "globe", action: {
                print("Hello")
            })
            .padding(.horizontal, 16)
            
    }
}
