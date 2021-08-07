//
//  Mapview.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct Mapview: View {
    var body: some View {
        VStack(){
        HStack{
            Image("AppLogo").resizable().frame(width: 40, height: 40)
//                .padding(10)

            Spacer()
            BackButton().frame(width: 40, height: 40)
        }.padding(.horizontal,20)
            
            GoogleMapsView(shop_log:21.3996239, shop_lat:39.7858474)//.frame(width: 314, height: 164).cornerRadius(20)
        }
    }
}
