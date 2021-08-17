//
//  Mapview.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct Mapview: View {
    @State  var longitude:Double
    @State var latitude:Double
    @State var location_drow:[[Double]]
    var body: some View {
        
        VStack(){
        HStack{
            Image("AppLogo").resizable().frame(width: 40, height: 40)
//                .padding(10)

            Spacer()
            BackButton().frame(width: 40, height: 40)
        }.padding(.horizontal,20)
            
//            GoogleMapsView(longitude: latitude, latitude: longitude)
            SearchMap(longitude: longitude, latitude: latitude ,location_drow: location_drow)
                .frame(width: UIScreen.width*0.8, alignment: .center).cornerRadius(20)
        }
    }
}
