//
//  SearchMap.swift
//  Aqarak
//
//  Created by Sandal on 07/01/1443 AH.
//

import SwiftUI

struct SearchMap: View {
    
    @State var longitude:Double
    @State var latitude:Double
    @State var location_drow:[[Double]]
    var body: some View {
       
            SearchMapView(longitude: latitude, latitude: longitude,location_drow: location_drow).cornerRadius(20)//.disabled(true)
        
    }
}
