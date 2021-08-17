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
                ZStack(alignment:.bottom){
                AsyncImage(
                    url: URL(string:AppImageBase+section.image)!,
//                                getImage(img: section.image))!,
                                    placeholder: { Image("AppLogo")},
                                    image: { Image(uiImage: $0).resizable() }
                                 )
                        .frame(width: 165, height: 150)
                    .aspectRatio(contentMode: .fit)
                    
                    
                Text(section.name)
                    .font(.custom(Fount_name.b.rawValue, size: 16))
                    .foregroundColor(.AppFount)
                    .padding(.vertical,5).frame(width:  179, height: 50, alignment: .center)
                    .background(Color.gray.opacity(0.83))
                }
                VStack{
                    Text(section.description)
                        .font(.custom(Fount_name.l.rawValue, size: 10))
                        .multilineTextAlignment(.trailing)

                        .frame(maxWidth: 179)
                        .foregroundColor(.AppGrayFount)
                        .padding(5)
                }.background(Color.white)
            }.frame(width: 179)
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

