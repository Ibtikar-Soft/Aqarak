//
//  CTFStyleClearBackground.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

public struct CTFStyleClearBackground : TextFieldStyle {
    var width:CGFloat=376
    var cornerRadius:CGFloat=20
    var height:CGFloat=50
    var lineWidth:CGFloat=0.6
    
    @Binding var showError:Bool
   public func _body(configuration: TextField<Self._Label>) -> some View {
       configuration
        .modifier(customFountCB())
           .foregroundColor(.AppGrayFount)
           .multilineTextAlignment(.center)
           .frame(width: width, height:height)
           .background(
               RoundedRectangle(cornerRadius: 10)
               .foregroundColor(Color.AppTextBackGround)
               .background(RoundedRectangle(cornerRadius: 10)
                            .stroke((showError ) ? Color(#colorLiteral(red: 0.8172891695, green: 0.3017711901, blue: 0.3019049658, alpha: 0.9075610017)) : Color.gray, lineWidth:showError  ? 1.5 : lineWidth)
               )
           )
        .shadow(radius: 10)
       
           

   }
}
