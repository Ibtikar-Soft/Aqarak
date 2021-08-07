//
//  PlanetDetails.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct PlanetDetails: View {
    var id:Int
    @State var search_text = ""
    
    @ObservedObject var textBindingManager = TextBindingManager(limit: 10)
    @State  var  showsAlert:Bool=false
    @State  var  message:String=""
    @State var phoneNumberError:Bool=false
    @State var isSignInPressed:Bool=false
    @State var isGoToMap:Bool=false
    
    var body: some View {
        ZStack{
        VStack{
        HStack{
            Image("AppLogo").resizable().frame(width: 40, height: 40)
//                .padding(10)

            Spacer()
            BackButton().frame(width: 40, height: 40)
        }.padding(.horizontal,20)
        .padding(.top,20)
            
//            TextField("", text: $textBindingManager.text, onEditingChanged: onEditingChanged(_:), onCommit: onCommit)
//                .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $phoneNumberError))
//                .modifier(customFountCR())
//                .foregroundColor(.AppGrayFount)
//                .keyboardType(.phonePad)
//                .overlay(
//                    HStack{
//                        Spacer()
//                        Image(systemName: "terminal").resizable().frame(width: 20, height: 20, alignment: .center).padding(.horizontal,8)
//                    }
//                ).padding(.top,20)
            
            Image("Rectangle").resizable().frame(width: 320, height: 470, alignment: .center)
                .padding(.top,20)
            Spacer()
            HStack{
                Image(Planet_Action_Button.heart.rawValue).resizable().frame(width: 50, height: 50, alignment: .center).onTapGesture {
                    
                }
                Spacer()
                Image(Planet_Action_Button.maps.rawValue).resizable().frame(width: 50, height: 50, alignment: .center).onTapGesture {
                    isGoToMap = true
                }
                Spacer()
                Image(Planet_Action_Button.share.rawValue).resizable().frame(width: 50, height: 50, alignment: .center).onTapGesture {
                    actionSheet()
                }
            }.padding(.horizontal,20)
            .padding(.bottom,20)
            
        }.onAppear{
            print(id)
        }
        .onTapGesture {
            hideKeyboard()
        }
        .fullScreenCover(isPresented:$isGoToMap, content: {
            Mapview()
        })
        }
       
    }
    func actionSheet() {
         guard let data = URL(string: "https://www.zoho.com") else { return }
         let av = UIActivityViewController(activityItems: [data], applicationActivities: nil)
         UIApplication.shared.windows.first?.rootViewController?.present(av, animated: true, completion: nil)
     }
    func onCommit() {
        
           print("commit")
       }
       func onEditingChanged(_ changed: Bool) {
           print(changed)
       }
}
