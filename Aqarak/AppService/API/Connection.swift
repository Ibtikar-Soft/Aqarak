//
//  Connection.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import Foundation

let AppBase="https://kayanapp.ibtikar-soft.sa"
let AppImageBase="https://kayanapp.ibtikar-soft.sa/api/"
class Connection:NSData
{
    
     let baseUrl=AppBase+"/api/"
    
    func  getUrl(word:String) -> String{
        var link:String =    ""
        switch word {
        // Auth
        case "register":
            link = baseUrl+"Customer/CreateNew"
            break
        case "login":
            link = baseUrl+"Customer/Login"
            break
        default:
            break
        }
        return link
        
    }
}

