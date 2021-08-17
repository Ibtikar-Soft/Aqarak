//
//  Fav.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI
import SwiftyJSON
struct Fav: View {
    @State var menue:[plantModal]=[
//        plantModal(id: 2, name: "", image: "", description: "", coordinations: "", planPieces: [planPieces(id: 1, pieceNo: "", coordination: "")])
        
    ]
    var body: some View {
        
        VStack(spacing:5){
        HStack{
            Image("AppLogo").resizable().frame(width: 40, height: 40)
//                .padding(10)

            Spacer()
            BackButton().frame(width: 40, height: 40)
        }.padding(.horizontal,20)
        .padding(.top,20)
            HStack{
                Spacer()
                Text("المفضلة")
                    .font(.custom(Fount_name.b.rawValue, size: 24))
                    .foregroundColor(.AppFount).padding(.trailing,30)
            }
            
            if menue.count > 0{
                ScrollView( showsIndicators: false){
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 10), count: 1), spacing: 10) {
                    ForEach(menue){
                        section in
                        HStack{
                                
                            VStack(alignment: .center, spacing: 0){
                                HStack{
                                    Image("Close").resizable().frame(width: 20, height: 20, alignment: .center).offset( x:10, y: -10)
                                        .onTapGesture {
                                            deleteFav(id:"\(section.id)")
                                        }
                                    Spacer()
                                    Text(section.name)
                                        .font(.custom(Fount_name.l.rawValue, size: 14))
                                        .multilineTextAlignment(.trailing)
                                        .foregroundColor(.black)
                                    
                                }.padding(.top,8)
                                Text(section.description)
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
                                url: URL(string:AppImageBase+section.image)!,
            //                                getImage(img: AppImageBase+section.image))!,
                                                placeholder: { Image("AppLogo")},
                                                image: { Image(uiImage: $0).resizable() }
                                             )
            //                        .resizable()
                                    .frame(width: 115, height: 145)
                                .aspectRatio(contentMode: .fit)
                        }.frame(width: 350, height: 145)

                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 0.4)
                                    .shadow(color: Color.gray.opacity(0.7), radius: 20, x: 5, y: 5)
                                        .shadow(color: Color.gray.opacity(0.3), radius: -20, x: -5, y: -5)
                            ).onTapGesture {
//                                withAnimation(.spring()){
//                                    selectedSection=section
//                                selectedPlanetId=section.id
//                                    selectedSection=true
//                                }
                            }
                            
                    }
                }
                }.padding(.top,20)
            }
            Spacer()
        }.onAppear{
//            VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.Favorate, Val: "")
            getFav()
        }
    }
    func deleteFav(id:String){
    print(Connection().getUrl(word: "DeleteFavor")+id)
    RestAPI().postData(endUrl: Connection().getUrl(word: "DeleteFavor")+id, parameters: [:]) { result in
        
        let sectionR = JSON(result!)
        print(sectionR)
        if sectionR["responseCode"].int == 200{
            let jsonDatas = try! JSONEncoder().encode(sectionR["response"])
            let menus = try! JSONDecoder().decode([plantModal].self, from: jsonDatas)
//            menue=menus
            getFav()
            removeTHis(id:id)
//            print(menue)
        }
        else if sectionR["responseCode"].int == 410{
            
        }
    } onError: { error in
        print(error!)
    }
    
}
    func removeTHis(id:String){
        
        if VarUserDefault.SysGlobalData.getGlobalInt(key: VarUserDefault.SysGlobalData.user_id) > 0{
                ////
              let nn=VarUserDefault.SysGlobalData.getGlobal(key: VarUserDefault.SysGlobalData.Favorate)
            VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.Favorate, Val: "")
            var sd=""//nn+"#\(id.id)#,"
              var useFav=nn.components(separatedBy:",")
              var faveIndex=0
              if useFav.count>0{
                  for iteam in 0...useFav.count-1{
                    if "#\(id)#" != useFav[iteam] {
                        var sd=sd+"#\(useFav[iteam])#,"
                      }
                  }
              }
//              if(!minato){
                
                VarUserDefault.SysGlobalData.setGlobal(Key: "Favorate", Val: sd)
                print(VarUserDefault.SysGlobalData.getGlobal(key:VarUserDefault.SysGlobalData.Favorate))
//                addToFavorate(plan_id:id.id)
//              }
            }

        
    }
    func getFav(){
        
    print(Connection().getUrl(word: "GetFavor"))
    RestAPI().getData(endUrl: Connection().getUrl(word: "GetFavor"), parameters: [:]) { result in
        
        let sectionR = JSON(result!)
        print(sectionR)
        if sectionR["responseCode"].int == 200{
            let jsonDatas = try! JSONEncoder().encode(sectionR["response"])
            let menus = try! JSONDecoder().decode([plantModal].self, from: jsonDatas)
            menue=menus
            print(menue)
        }
    } onError: { error in
        print(error!)
    }
    
}
}


struct Fav_Previews: PreviewProvider {
    static var previews: some View {
        Fav()
    }
}
