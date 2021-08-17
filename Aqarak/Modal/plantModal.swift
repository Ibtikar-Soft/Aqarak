//
//  plantModal.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//
import Foundation
import CoreLocation
struct plantModal:Identifiable, Decodable {
    let id: Int
   let name, image: String
   let description: String
    let coordinations:String
        let planPieces:[planPieces]
    var cord:[[Double]]{
        getcord(cord: coordinations)
      }
    var inInLocalFav:Bool{
        
        LocalFav(id:id)
      }
    

   enum CodingKeys: String, CodingKey {
       case id, name
       case image = "image"
       case description
        case coordinations
        case planPieces
   }
    func getcord(cord:String) -> [[Double]] {
        let c = cord.split(separator: "-")
        var locations:[[Double]] = []
        for x in c {
            let y = x.split(separator: ",")
//            locations.append([x[0],x[1]])
            locations.append([Double(y[0]) ?? 0.0, Double(y[1]) ?? 0.0])
        }
        return locations
    }
    func LocalFav(id:Int)->Bool{
        print(VarUserDefault.SysGlobalData.getGlobalInt(key: VarUserDefault.SysGlobalData.user_id))
        if VarUserDefault.SysGlobalData.getGlobalInt(key: VarUserDefault.SysGlobalData.user_id) != 0{

              let nn=VarUserDefault.SysGlobalData.getGlobal(key: VarUserDefault.SysGlobalData.Favorate)
              let useFav=nn.components(separatedBy:",")
              if useFav.count>0{
                  for iteam in 0...useFav.count-1{
                    if "#\(id)#" == useFav[iteam] {
                          return true
                          break
                      }
                  }
              }
            
              
            }
        return false
    
           
        
    //
    }
}
struct planPieces :Identifiable, Decodable {
    let id: Int
    let pieceNo: String
    let coordination :String
    var plan_coordination :CLLocation{
        get_plan_coordination(coordination:coordination)
    }
    func get_plan_coordination(coordination:String) -> CLLocation {
       
            let y = coordination.split(separator: ",")
//            locations.append([x[0],x[1]])
        let locations = CLLocation(latitude: Double(y[0]) ?? 0.0, longitude: Double(y[1]) ?? 0.0)
        
        return locations
    }
}
