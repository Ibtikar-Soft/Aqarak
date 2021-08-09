//
//  Home.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI
import SwiftyJSON

struct Home: View {
    @State var selectedPlanetId:plantModal = plantModal(id: 1, name: "الاقتصادية من الرياض", imageURL: "https://www.aleqt.com/sites/default/files/styles/scale_660/public/rbitem/2020/08/13/1455461-1265213657.jpg?itok=xbjWauOT", typeID: 2, createAt: "ds")
    @State var selectedSection:Bool = false
    @State var menue:[plantModal]=[
        plantModal(id: 1, name: "الاقتصادية من الرياض", imageURL: "https://www.aleqt.com/sites/default/files/styles/scale_660/public/rbitem/2020/08/13/1455461-1265213657.jpg?itok=xbjWauOT", typeID: 2, createAt: "ds"),
        plantModal(id: 2, name: "ضاحية الرمال", imageURL: "https://pbs.twimg.com/media/DWpSBtJWsAAqpbS?format=jpg&name=900x900", typeID: 2, createAt: "ds"),
        plantModal(id: 3, name: "حلم العمر", imageURL: "https://mostaql.hsoubcdn.com/uploads/478566-abhnE-1539347839-03.PNG", typeID: 2, createAt: "ds"),
        plantModal(id: 4, name: "ضاحية الصندل", imageURL: "https://4.bp.blogspot.com/-8s8HGbPWwk0/WSMUZZ4ocTI/AAAAAAAAGPA/LR4ALK4B7V87kCyUNVF93bS8_qYLtfElACLcB/s1600/vill001_wm.png", typeID: 2, createAt: "ds"),
        plantModal(id: 5, name: "المرجانية", imageURL: "https://apollo-ireland.akamaized.net/v1/files/i0fav47j8n7w-EG/image;s=644x461;olx-st/_2_.jpg", typeID: 2, createAt: "ds"),
    ]
//    var animation:Namespace.ID
//    @Binding var sect:[Section]
    var body: some View {
        
        VStack{
            Menue_Button().padding(.top,20)
            Spacer()
            if menue.count > 0{
                ScrollView( showsIndicators: false){
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 10), count: 2), spacing: 10) {
                    ForEach(menue){
                        section in
                        PlanetViewModal(section: section)
                            .cornerRadius(20)
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.gray, lineWidth: 0.4)
                                    .shadow(color: Color.gray.opacity(0.7), radius: 20, x: 5, y: 5)
//                                        .shadow(color: Color.gray.opacity(0.3), radius: -20, x: -5, y: -5)
                            ).onTapGesture {
//                                withAnimation(.spring()){
//                                    selectedSection=section
                                selectedPlanetId=section
                                    selectedSection=true
//                                }
                            }
                            
                    }
                }
                }.padding(.top,20)
            }
            else{
                Text("no iteam")
            }
        }
        .onAppear{
//            getSection()
        }
        .fullScreenCover(isPresented: $selectedSection) {
            PlanetDetails(id: $selectedPlanetId)
        }
    }
    func getSection(){
        print(Connection().getUrl(word: "GetMenu"))
        RestAPI().getData(endUrl: Connection().getUrl(word: "GetMenu"), parameters: [:]) { result in
            
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

