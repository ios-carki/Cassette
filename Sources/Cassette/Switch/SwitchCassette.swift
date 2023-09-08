//
//  SwitchCassette.swift
//  
//
//  Created by HESSEGG on 2023/09/08.
//

import SwiftUI

public struct SwitchCassette: View {
    
    //Text
    private var bindingTitleText: Binding<String>?
    private var titleTextOnColor: Color = SwitchCassetteConfig.shared.defaultSwitchOnTextColor
    private var titleTextOffColor: Color = SwitchCassetteConfig.shared.defaultSwitchOffTextColor
    private var titleTextFont: Font = SwitchCassetteConfig.shared.defaultSwitchTextFont
    
    //Switch
    private var switchOffBackgroundColor: Color = SwitchCassetteConfig.shared.defaultSwitchOffBackgroundColor
    private var switchOnBackgroundColor: Color = SwitchCassetteConfig.shared.defaultSwitchOnBackgroundColor
    private var switchControllerColor: Color = SwitchCassetteConfig.shared.defaultSwitchControllerColor
    
    //Status
    private var isOn: Binding<Bool>
    
    //Spacer
    private var insertSpacer: Bool?
    private var spacing: CGFloat?
    
    public init(text: Binding<String>?, isOn: Binding<Bool>, spacing: CGFloat?) {
        self.bindingTitleText = text
        self.isOn = isOn
        self.spacing = spacing
    }
    
    public var body: some View {
        HStack(spacing: spacing) {
            if (bindingTitleText?.wrappedValue != nil) {
                Text(bindingTitleText?.wrappedValue ?? "")
                    .foregroundColor(isOn.wrappedValue ? titleTextOnColor : titleTextOffColor)
                    .font(titleTextFont)
            }

            if insertSpacer ?? false {
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 50, height: 30)
                .foregroundColor(isOn.wrappedValue ? switchOnBackgroundColor : switchOffBackgroundColor)
                .overlay(
                    Circle()
                        .frame(width: 26, height: 26)
                        .foregroundColor(switchControllerColor)
                        .offset(x: isOn.wrappedValue ? 12 : -12)
                        .animation(.easeInOut)
                        .padding(isOn.wrappedValue ? .trailing : .leading, 4)
                )
                .padding(2)
                .onTapGesture {
                    withAnimation {
                        isOn.wrappedValue.toggle()
                    }
                }
        }
    }
}

extension SwitchCassette {
    //Text
    public func setTitleTextOnColor(color: Color) -> Self {
        var copy = self
        copy.titleTextOnColor = color
        return copy
    }
    
    public func setTitleTextOffColor(color: Color) -> Self {
        var copy = self
        copy.titleTextOffColor = color
        return copy
    }
    
    public func setTitleTextFont(font: Font) -> Self {
        var copy = self
        copy.titleTextFont = font
        return copy
    }
    
    //Switch
    public func setSwitchOffBackgroundColor(color: Color) -> Self {
        var copy = self
        copy.switchOffBackgroundColor = color
        return copy
    }
    
    public func setSwitchOnBackgroundColor(color: Color) -> Self {
        var copy = self
        copy.switchOnBackgroundColor = color
        return copy
    }
    
    public func setSwitchControllerColor(color: Color) -> Self {
        var copy = self
        copy.switchControllerColor = color
        return copy
    }
    
    //Spacer
    public func insertSpacer(_ insert: Bool) -> Self {
        var copy = self
        copy.insertSpacer = insert
        return copy
    }
}

@available(iOS 13.0, *)
public final class SwitchCassetteConfig {
    public static var shared = SwitchCassetteConfig()
    
    private init() { }
    
    //Text
    public var defaultSwitchOffTextColor: Color = .black
    public var defaultSwitchOnTextColor: Color = .black
    public var defaultSwitchTextFont: Font = .callout
    
    //Switch
    public var defaultSwitchOnBackgroundColor: Color = .green
    public var defaultSwitchOffBackgroundColor: Color = .gray
    public var defaultSwitchControllerColor: Color = .white
}

public struct SwitchCassette_Previews: PreviewProvider {
    public static var previews: some View {
        SwitchCassette(text: nil, isOn: .constant(false), spacing: nil)
    }
}
