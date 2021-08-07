//
//  Fav.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct Fav: View {
    @State var menue:[plantModal]=[
        plantModal(id: 1, name: "ds", imageURL: "", typeID: 2, createAt: "ds"),
        plantModal(id: 2, name: "ds", imageURL: "", typeID: 2, createAt: "ds"),
        plantModal(id: 3, name: "ds", imageURL: "", typeID: 2, createAt: "ds"),
        plantModal(id: 4, name: "ds", imageURL: "", typeID: 2, createAt: "ds"),
        plantModal(id: 5, name: "ds", imageURL: "", typeID: 2, createAt: "ds"),
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
                        FaveorateViewModal(section: section)
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
        }
    }
}


struct Fav_Previews: PreviewProvider {
    static var previews: some View {
        Fav()
    }
}
