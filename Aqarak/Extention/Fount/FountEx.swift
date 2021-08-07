//
//  FountEx.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct customFountCR : ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.custom(Fount_name.l.rawValue, size: 20))
        }
    }
struct customFountCB : ViewModifier {
        func body(content: Content) -> some View {
            content
                .font(.custom(Fount_name.b.rawValue, size: 16))
        }
    }
