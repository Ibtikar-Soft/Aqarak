//
//  PlanetViewModal.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct PlanetViewModal: View {
    var section:plantModal
//     var animation:Namespace.ID
    var body: some View {
//        Button(action: {}, label: {
            VStack{
//                Spacer()
//                Image( ?? "logo_1")
//                RemoteImage(url: getImage(img:section.image! ?? "logo_1")  )
//                RemoteImage(url: getImage(img:)  )
                AsyncImage(
                    url: URL(string://AppImageBase+section.imageURL)!,
                                getImage(img: ""))!,
                                    placeholder: { Image("logo_1")},
                                    image: { Image(uiImage: $0).resizable() }
                                 )
//                        .resizable()
                        .frame(width: 165, height: 150)
                    .aspectRatio(contentMode: .fit)
                    
                    
                
//                Spacer()
//Spacer()
                Text(section.name)
                    .foregroundColor(.AppPrimaryColor)
                    .padding(.vertical,5)
                Spacer()
            }.frame(width: 179, height: 261)
//        })
            
            
        
    }
    func getImage(img:String) -> String {
        print(img)
        guard let parsedURL = URL(string: img) else {
//            return "https:\\\\freepngimg.com\\thumb\\food\\1-2-food-free-png-image.png"
            return "https://freepngimg.com/thumb/food/1-2-food-free-png-image.png"
        }

        return img
    }
}

