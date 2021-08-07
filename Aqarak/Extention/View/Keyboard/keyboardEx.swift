//
//  keyboardEx.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI
#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
