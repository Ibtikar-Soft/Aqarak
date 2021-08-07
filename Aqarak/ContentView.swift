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
    var body: some View {
//       Splash()
//        SignIn()
//        TestButton()
//        if isValidEmailAddress(emailAddressString: "awad619@hotmail.com"){
//            Home()
        PlanetDetails(id: 2)
//        Fav()
        
//        }
//       ? }
            .onAppear{
                requestPermission()
                GMSServices.provideAPIKey("AIzaSyBApEGRGZKAVt2_b3U7Yur7qccgnCLjsf0")
                GMSPlacesClient.provideAPIKey("AIzaSyBApEGRGZKAVt2_b3U7Yur7qccgnCLjsf0")
            }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
