//
//  plantModal.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//
import Foundation
struct plantModal:Identifiable, Decodable {
let id: Int
   let name, imageURL: String
   let typeID: Int
   let createAt: String

   enum CodingKeys: String, CodingKey {
       case id, name
       case imageURL = "imageUrl"
       case typeID, createAt
   }
}
