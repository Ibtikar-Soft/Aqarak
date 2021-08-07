//
//  FaveorateViewModal.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct FaveorateViewModal: View {
    
    var section:plantModal=plantModal(id: 2, name: "dsadsa", imageURL: "", typeID: 2, createAt: "sa")
//     var animation:Namespace.ID
    var body: some View {
//        Button(action: {}, label: {
            HStack{
//                Spacer()
//                Image( ?? "logo_1")
//                RemoteImage(url: getImage(img:section.image! ?? "logo_1")  )
//                RemoteImage(url: getImage(img:)  )
                
                    
                    
                VStack(alignment: .center, spacing: 0){
                    HStack{
                        Image("Close").resizable().frame(width: 20, height: 20, alignment: .center).offset( x:10, y: -10)
                        Spacer()
                        Text(section.name)
                            .font(.custom(Fount_name.l.rawValue, size: 14))
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(.black)
                        
                    }.padding(.top,8)
                    Text("سجل دخولك الى عقارك وتمتع بافضل واسهل وارخص الخدمات")
                        .font(.custom(Fount_name.l.rawValue, size: 14))
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(.AppGrayFount)
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
                    Spacer()
                }
//                Spacer()
//Spacer()
                
                Spacer()
                AsyncImage(
                    url: URL(string://AppImageBase+section.imageURL)!,
                                getImage(img: ""))!,
                                    placeholder: { Image("AppLogo")},
                                    image: { Image(uiImage: $0).resizable() }
                                 )
//                        .resizable()
                        .frame(width: 115, height: 145)
                    .aspectRatio(contentMode: .fit)
            }.frame(width: 350, height: 145)
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


struct FaveorateViewModal_Previews: PreviewProvider {
    static var previews: some View {
        FaveorateViewModal()
    }
}
