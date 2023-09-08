//
//  SwitchCassette.swift
//  
//
//  Created by HESSEGG on 2023/09/08.
//

import SwiftUI

public struct SwitchCassette: View {
    
    public var bindingTitleText: Binding<String>?
    public var titleTextColor: Color = SwitchCassetteConfig.shared.defaultSwitchTextColor
    private var isOn: Binding<Bool>?
    
    private var height: CGFloat?
    
    public init(text: Binding<String>?, isOn: Binding<Bool>?) {
        self.bindingTitleText = text
        self.isOn = isOn
    }
    
    public var body: some View {
        HStack {
            Text(bindingTitleText?.wrappedValue ?? "")
                .foregroundColor(isOn?.wrappedValue ?? false ? .green : .red) // 켜진 상태의 텍스트 색상 변경

            Spacer()

//            Button(action: {
//                withAnimation {
//                    isOn?.wrappedValue.toggle()
//                }
//            }) {
//                RoundedRectangle(cornerRadius: 16)
//                    .frame(width: 50, height: 30)
//                    .foregroundColor((isOn?.wrappedValue ?? false) ? .green : .gray) // 켜진 상태의 배경색 변경
//                    .overlay(
//                        Circle()
//                            .frame(width: 26, height: 26)
//                            .foregroundColor(.white)
//                            .offset(x: (isOn?.wrappedValue ?? false) ? 12 : -12)
//                            .animation(.easeInOut)
//                            .padding((isOn?.wrappedValue ?? false) ? .trailing : .leading, 4)
//                    )
//                    .padding(2)
//            }
            RoundedRectangle(cornerRadius: 16)
                .frame(width: 50, height: 30)
                .foregroundColor((isOn?.wrappedValue ?? false) ? .green : .gray) // 켜진 상태의 배경색 변경
                .overlay(
                    Circle()
                        .frame(width: 26, height: 26)
                        .foregroundColor(.white)
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
    public func setTitleText(text: Binding<String>) -> Self {
        var copy = self
        copy.bindingTitleText = text
        return copy
    }
}

@available(iOS 13.0, *)
public final class SwitchCassetteConfig {
    public static var shared = SwitchCassetteConfig()
    
    private init() { }
    
    //Text
    public var defaultSwitchTextColor: Color = .black
}

public struct SwitchCassette_Previews: PreviewProvider {
    public static var previews: some View {
        SwitchCassette(text: .constant("asd"), isOn: .constant(false))
    }
}
