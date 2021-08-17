//
//  VarUserDefault.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import Foundation

class VarUserDefault{
  
    var isLogin: String = "isLogin"
   var isFirestOpen:String = "isFirestOpen"
    var user_id:String = "user_id"
    var Favorate:String = "Favorate"
    
    
    //auth
    
    func getGlobal(key:String) -> String{
        let preferences = UserDefaults.standard
        if preferences.object(forKey: key) != nil{
            return   preferences.object(forKey: key) as! String
        }
        
        return ""
    }
    func getGlobalInt(key:String) -> Int{
        let preferences = UserDefaults.standard
        if preferences.object(forKey: key) != nil{
            return   preferences.object(forKey: key) as! Int
        }
        return 0
    }
    func setGlobal(Key:String,Val:Any) -> Bool{
        let preferences = UserDefaults.standard
        preferences.set(Val, forKey: Key)
        
        //  Save to disk
      return  preferences.synchronize()
        
       
    }
    func getGlobalBool(key:String) -> Bool{
        let preferences = UserDefaults.standard
        if preferences.object(forKey: key) != nil{
            return   preferences.object(forKey: key) as! Bool
        }
        return false
    }
//    func getGlobalObject(key:String)-> RegNewUser{
//        let userDefaults = UserDefaults.standard
//                                            do {
//                                                let playingItMyWay = try userDefaults.getObject(forKey: key, castTo: RegNewUser.self)
//                                                return playingItMyWay
//                                            } catch {
//                                                print(error.localizedDescription)
//                                            }
//        return RegNewUser(firstName: "", lastName: "", motherName: "", country: "", phoneNumber: "", email: "", gender: "", deviceId: "", pinCode: "", facePhoto: "", identity: Identity(type: "", number: "", issueDate: "", expiryDate: "", frontImage: "", backImage: ""),job: "",monthly_salary: "",annual_salary: "",address: "")
//    }
    class var SysGlobalData: VarUserDefault {
        struct Static {
            static let instance = VarUserDefault()
        }
        return Static.instance
    }
}
