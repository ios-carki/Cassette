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
    private var isOn: Binding<Bool>?
    
    private var height: CGFloat?
    
    public init(text: Binding<String>?, isOn: Binding<Bool>?) {
        self.bindingTitleText = text
        self.isOn = isOn
    }
    
    public var body: some View {
        HStack {
            Text(bindingTitleText?.wrappedValue ?? "")
                .foregroundColor((isOn?.wrappedValue ?? false) ? titleTextOnColor : titleTextOffColor)
                .font(titleTextFont)

            Spacer()
            
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 50, height: 30)
                .foregroundColor((isOn?.wrappedValue ?? false) ? switchOnBackgroundColor : switchOffBackgroundColor)
                .overlay(
                    Circle()
                        .frame(width: 26, height: 26)
                        .foregroundColor(switchControllerColor)
                        .offset(x: (isOn?.wrappedValue ?? false) ? 12 : -12)
                        .animation(.easeInOut)
                        .padding((isOn?.wrappedValue ?? false) ? .trailing : .leading, 4)
                )
                .padding(2)
                .onTapGesture {
                    withAnimation {
                        isOn?.wrappedValue.toggle()
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
        SwitchCassette(text: .constant("asd"), isOn: .constant(false))
    }
}
