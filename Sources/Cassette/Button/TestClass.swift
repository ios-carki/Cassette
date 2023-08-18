//
//  TestClass.swift
//  
//
//  Created by HESSEGG on 2023/08/18.
//

import SwiftUI

final class TestClass: ObservableObject {
    @Published var bindingTextMode = ButtonMode.bindingText
    @Published var variable = BtnCassette()
    
    public func setBingText() {
        
    }
}
