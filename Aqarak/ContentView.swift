//
//  ContentView.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI
import GoogleMaps
import GooglePlaces
struct ContentView: View {
    @State var data : Data?
    
    var body: some View {
        var longitude = 24.754383
        var latitude = 46.757459
//        GoogleMapsView(longitude: latitude, latitude: longitude).cornerRadius(20)
       Splash()
        .onAppear{
//            VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.Favorate, Val: "")
        }
//        SignIn()
//        TestButton()
//        if isValidEmailAddress(emailAddressString: "awad619@hotmail.com"){
//            Home()
//        PlanetDetails(id: 2)
//        Fav()
        
//        }
//       ? }
            
    }
    func requestPermission() -> Void {
        UNUserNotificationCenter
            .current()
            .requestAuthorization(options: [.sound, .badge, .alert]) { granted, error in
                if granted == true && error == nil {
                    
                }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
