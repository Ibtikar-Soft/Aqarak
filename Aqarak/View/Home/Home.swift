//
//  Home.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI
import SwiftyJSON

struct Home: View {
    @State var selectedPlanetId:plantModal = plantModal(id: 2, name: "", image: "", description: "", coordinations: "", planPieces: [])
    @State var selectedSection:Bool = false
    @State var menue:[plantModal]=[
    ]
//    var animation:Namespace.ID
//    @Binding var sect:[Section]
    var body: some View {
        
        VStack{
            Menue_Button().padding(.top,20)
            Spacer()
            if menue.count > 0{
                ScrollView( showsIndicators: false){
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(),spacing: 10), count: 2), spacing: 5) {
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
            getSection()
        }
        .fullScreenCover(isPresented: $selectedSection) {
            PlanetDetails(id: $selectedPlanetId)
        }
    }
    func getSection(){
        print(Connection().getUrl(word: "GetPlans"))
        RestAPI().getData(endUrl: Connection().getUrl(word: "GetPlans"), parameters: [:]) { result in
            
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

