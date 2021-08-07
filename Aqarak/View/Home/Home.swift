//
//  Home.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI
import SwiftyJSON

struct Home: View {
    @State var selectedPlanetId:Int = 0
    @State var selectedSection:Bool = false
    @State var menue:[plantModal]=[
        plantModal(id: 1, name: "ds", imageURL: "", typeID: 2, createAt: "ds"),
        plantModal(id: 2, name: "ds", imageURL: "", typeID: 2, createAt: "ds"),
        plantModal(id: 3, name: "ds", imageURL: "", typeID: 2, createAt: "ds"),
        plantModal(id: 4, name: "ds", imageURL: "", typeID: 2, createAt: "ds"),
        plantModal(id: 5, name: "ds", imageURL: "", typeID: 2, createAt: "ds"),
    ]
//    var animation:Namespace.ID
//    @Binding var sect:[Section]
    var body: some View {
        
        VStack{
            Menue_Button()
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
                                        .shadow(color: Color.gray.opacity(0.3), radius: -20, x: -5, y: -5)
                            ).onTapGesture {
//                                withAnimation(.spring()){
//                                    selectedSection=section
                                selectedPlanetId=section.id
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
            PlanetDetails(id: selectedPlanetId)
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

