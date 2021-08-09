//
//  Mapview.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct Mapview: View {
    var longitude = 24.754383
    var latitude = 46.757459
    var body: some View {
        
        VStack(){
        HStack{
            Image("AppLogo").resizable().frame(width: 40, height: 40)
//                .padding(10)

            Spacer()
            BackButton().frame(width: 40, height: 40)
        }.padding(.horizontal,20)
            
            GoogleMapsView(longitude: latitude, latitude: longitude).cornerRadius(20)
        }
    }
}
