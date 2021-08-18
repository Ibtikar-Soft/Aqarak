//
//  Connection.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import Foundation

let AppBase="https://aaqarkapi.ibtikar-soft.com"
let AppImageBase="https://aaqark.ibtikar-soft.com/"
//App/
class Connection:NSData
{
    
     let baseUrl=AppBase+"/api/App/"
    
    func  getUrl(word:String) -> String{
        var link:String =    ""
        switch word {
        // Auth
        case "login":
            link = baseUrl+"Login"
            break
        case "GetPlans":
            link = baseUrl+"GetPlans"
            break
        case "AddFavor":
            link = baseUrl+"AddFavor"
            break
        case "GetFavor":
            link = baseUrl+"GetFavor/\(VarUserDefault.SysGlobalData.getGlobalInt(key: VarUserDefault.SysGlobalData.user_id))"
            break
        case "DeleteFavor":
            link = baseUrl+"DeleteFavor/\(VarUserDefault.SysGlobalData.getGlobalInt(key: VarUserDefault.SysGlobalData.user_id))/"
            break
        case "UpdateCustomer":
            link = baseUrl+"UpdateCustomer"
            break
        case "GetAbout":
            link = baseUrl+"GetAbout"
            break
            
            
            
            
        default:
            break
        }
        return link
        
    }
}

