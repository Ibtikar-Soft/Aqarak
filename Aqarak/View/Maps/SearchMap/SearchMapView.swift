//
//  SearchMapView.swift
//  Aqarak
//
//  Created by Sandal on 07/01/1443 AH.
//

import Foundation
import SwiftUI
import GoogleMaps
var mapViews = GMSMapView()
var markers = GMSMarker()
    struct SearchMapView: UIViewRepresentable {
        // 1
        @State         var longitude:Double
        @State  var latitude:Double
        @State var location_drow = [[24.760861,46.761074],[24.758121,46.755747],[24.746208,46.753554],[24.745750,46.756193],[24.746208,46.758050]]
           @ObservedObject var locationManager = LocationManager()
           private let zoom: Float = 18.0
        let marker2 = GMSMarker()
           // 2
           func makeUIView(context: Self.Context) -> GMSMapView {
            print(longitude)
               let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: zoom)
                mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
               
                let rectangle = GMSPolyline(path: get_GMSMutablePath())
                rectangle.strokeColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
                rectangle.map = mapView
            //// Marker
            let marker = GMSMarker()
        let configuration = UIImage.SymbolConfiguration(pointSize: 20)
            var image = UIImage(named:"AppLogo", in: .none, with: configuration)
            marker.icon = self.imageWithImage(image: image!, scaledToSize: CGSize(width: 30.0, height: 30.0))
                marker.position = CLLocationCoordinate2D(latitude:  latitude, longitude:longitude)
                marker.map = mapView
            
    //            marker2.icon=image
            
                return mapView
           }
           
           func updateUIView(_ mapView: GMSMapView, context: Context) {
           }
        func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
            UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
            image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
            let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return newImage
        }
        func get_GMSMutablePath()->GMSMutablePath{
            let rectanglePath = GMSMutablePath()
            for pieces in location_drow
            {
                
                rectanglePath.add(CLLocationCoordinate2D(latitude: pieces[0], longitude: pieces[1]))
                
                
            }
            rectanglePath.add(CLLocationCoordinate2D(latitude: location_drow[0][0], longitude: location_drow[0][1]))
//            rectanglePath.add(CLLocationCoordinate2D(latitude: location_drow[4][0], longitude: location_drow[4][1]))
//            rectanglePath.add(CLLocationCoordinate2D(latitude: location_drow[0][0], longitude: location_drow[0][1]))
//            rectanglePath.add(CLLocationCoordinate2D(latitude: location_drow[1][0], longitude: location_drow[1][1]))
//            rectanglePath.add(CLLocationCoordinate2D(latitude: location_drow[2][0], longitude: location_drow[2][1]))
//            rectanglePath.add(CLLocationCoordinate2D(latitude: location_drow[3][0], longitude: location_drow[3][1]))
//            rectanglePath.add(CLLocationCoordinate2D(latitude: location_drow[4][0], longitude: location_drow[4][1]))
            return rectanglePath
        }
    }


