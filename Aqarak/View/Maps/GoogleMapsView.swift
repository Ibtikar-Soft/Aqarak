//
//  GoogleMapsView.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//
import Foundation
import SwiftUI

import GoogleMaps
var  latitude=0.0
var  longitude=0.0
var mapView = GMSMapView()
var marker = GMSMarker()
    struct GoogleMapsView: UIViewRepresentable {
        // 1
        @State         var shop_log:Double
        @State  var shop_lat:Double
           @ObservedObject var locationManager = LocationManager()
           private let zoom: Float = 14.0
        let marker2 = GMSMarker()
           // 2
           func makeUIView(context: Self.Context) -> GMSMapView {
               let camera = GMSCameraPosition.camera(withLatitude: shop_lat, longitude: shop_log, zoom: zoom)
             mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
//            let configuration = UIImage.SymbolConfiguration(pointSize: 1)
//            var image = UIImage(named:"restaurant", in: .none, with: configuration)
//            marker.icon = self.imageWithImage(image: image!, scaledToSize: CGSize(width: 50.0, height: 50.0))
            
//            marker.position = CLLocationCoordinate2D(latitude:  shop_lat, longitude:shop_log)
            
//                marker.map = mapView
            
            
//            let configuration = UIImage.SymbolConfiguration(pointSize: 1)
            
//             image = UIImage(named:"customer", in: .none, with: configuration)
////            marker2.icon=image
//            marker2.icon = self.imageWithImage(image: image!, scaledToSize: CGSize(width: 50.0, height: 50.0))
//            marker2.position = CLLocationCoordinate2D(latitude:  latitude, longitude:longitude)
//            marker2.map = mapView
               return mapView
           }
           // 3
           func updateUIView(_ mapView: GMSMapView, context: Context) {
//            let bounds = GMSCoordinateBounds(coordinate: marker2.position, coordinate: marker.position)
//            let camera: GMSCameraUpdate = GMSCameraUpdate.fit(bounds)
//            mapView.animate(with: camera)
           }
        func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
            UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
            image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
            let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return newImage
        }
    }

struct Show_map_for_coming_order: UIViewRepresentable {
    // 1
    
    @State  var shop_latitude:Double
    @State  var shop_longitude:Double
    @State  var delevary_latitude:Double
    @State  var delevary_longitude:Double
    
    
//       @ObservedObject var locationManager = LocationManager()
       private let zoom: Float = 14.0
    let marker2 = GMSMarker()
       // 2
       func makeUIView(context: Self.Context) -> GMSMapView {
           let camera = GMSCameraPosition.camera(withLatitude: shop_latitude, longitude: shop_longitude, zoom: zoom)
           let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
            let marker = GMSMarker()
        let configuration = UIImage.SymbolConfiguration(pointSize: 20)
        
        var image = UIImage(named:"restaurant", in: .none, with: configuration)
//            marker2.icon=image
        marker.icon = self.imageWithImage(image: image!, scaledToSize: CGSize(width: 50.0, height: 50.0))
            marker.position = CLLocationCoordinate2D(latitude:  shop_latitude, longitude:shop_longitude)
            marker.map = mapView
        marker2.position = CLLocationCoordinate2D(latitude:  delevary_latitude, longitude:delevary_longitude)
         image = UIImage(named:"customer", in: .none, with: configuration)
//            marker2.icon=image
        marker2.icon = self.imageWithImage(image: image!, scaledToSize: CGSize(width: 50.0, height: 50.0))
        marker2.map = mapView
           return mapView
       }
       
       // 3
       func updateUIView(_ mapView: GMSMapView, context: Context) {
        
        let bounds = GMSCoordinateBounds(coordinate: marker2.position, coordinate: marker.position)
        let camera: GMSCameraUpdate = GMSCameraUpdate.fit(bounds)
        //  let cameraWithPadding: GMSCameraUpdate = GMSCameraUpdate.fit(bounds, withPadding: 100.0) (will put inset the bounding box from the view's edge)

        mapView.animate(with: camera)
       }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
    
    func fetchRoute(from source: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D) {
        
        let session = URLSession.shared
        
        let url = URL(string: "https://maps.googleapis.com/maps/api/directions/json?origin=\(source.latitude),\(source.longitude)&destination=\(destination.latitude),\(destination.longitude)&sensor=false&mode=driving&key=AIzaSyBlYoTcGx0-Nz4EhzvIuu5ccmqlJo8sLbk")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let jsonResult = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] else {

                       print("error in JSONSerialization")
                       return

                   }
            print(jsonResult)
            guard let routes = jsonResult["routes"] as? [Any] else {
                return
            }
            
            guard let route = routes[0] as? [String: Any] else {
                return
            }

            guard let overview_polyline = route["overview_polyline"] as? [String: Any] else {
                return
            }
            
            guard let polyLineString = overview_polyline["points"] as? String else {
                return
            }
            
            //Call this method to draw path on map
            self.drawPath(from: polyLineString)
        })
        task.resume()
    }
    func drawPath(from polyStr: String){
        let path = GMSPath(fromEncodedPath: polyStr)
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 3.0
        polyline.map = mapView // Google MapView
    }
}
