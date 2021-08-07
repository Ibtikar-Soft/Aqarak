//
//  Menue_Button.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct Menue_Button: View {
    
    var body: some View {
        HStack{
            Image("AppLogo").resizable().frame(width: 40, height: 40)
//                .padding(10)

            Spacer()
            TestButton()
        }.padding(.horizontal,20)
    }
}

struct Menue_Button_Previews: PreviewProvider {
    static var previews: some View {
        Menue_Button()
    }
}

struct TestButton: View {
    @State private var open=false
    var offsetY:Double = 0.0
    var offsetX:Double = -80.0
    
    @State var isViewFav:Bool = false
    @State var isViewPro:Bool = false
    @State var isViewAbout:Bool = false
    var body: some View {
        HStack(){
            Spacer()
        ZStack(alignment: .trailing){
            Button(action: {self.open.toggle()}){
                Image(systemName: "list.dash").renderingMode(.original).resizable().frame(width: 30, height: 30).padding(10)
                    .rotationEffect(.degrees(open ? 45 : 0))
                    .foregroundColor(.AppPrimaryColor)
                    .font(.system(size:30,weight:.bold))
                    .animation(.spring(response: 0.1, dampingFraction: 0.5, blendDuration: 0))
            }.padding(0)//.background(Color.AppPrimaryColor).mask(Circle()).shadow(color:Color.AppPrimaryColor, radius: 3)
            .zIndex(10)
            MenueButtons(open: $open, viewToOpen: $isViewPro, delay: 0.2 ,offsetX: offsetX, offsetY:offsetY, icon: menue_button_name.Profile.rawValue, color: Color.green)
            
            
            MenueButtons(open: $open, viewToOpen: $isViewFav, delay: 0.4,offsetX: offsetX*2, offsetY:offsetY, icon: menue_button_name.Fav.rawValue, color: Color.blue)
            
            
            MenueButtons(open: $open, viewToOpen: $isViewAbout, delay: 0.6,offsetX: offsetX*3, offsetY:offsetY, icon: menue_button_name.About.rawValue, color: Color.yellow)

        }
            
        }
        .fullScreenCover(isPresented: $isViewFav) {
            Fav()
        }
        .fullScreenCover(isPresented: $isViewAbout) {
            About()
        }
        .fullScreenCover(isPresented: $isViewPro) {
            Profile()
        }
    }
}


struct MenueButtons:View {
    @Binding var open:Bool
    @Binding var viewToOpen:Bool
    var delay=0.0
    var offsetX=0.0
    var offsetY=0.0
    var icon=""
    var color=Color.red

    var body: some View{
        Button(action:{
            if (self.icon == "iteam_1") {
                print("iteam_1")
                viewToOpen = true
            }
            else if ( self.icon == "iteam_2") {
                           print("iteam_2")
                viewToOpen = true
                       }
            else if ( self.icon == "iteam_3") {
                print("iteam_3")
                viewToOpen = true
            }
            
        }){
            Image(icon).resizable().frame(width: 30, height: 30).padding(10)
                .foregroundColor(Color.AppPrimaryColor)
                .font(.system(size:30,weight:.bold))
        }.padding(0)
            //            .background(Color.AppPrimaryColor)
            .mask(Circle())
            .offset(x:CGFloat((open ? offsetX : 0)),y:CGFloat((open ? offsetY : 0)))
            .scaleEffect(open ? 1:0)
            .animation(Animation.spring(response: 0.2, dampingFraction: 0.5, blendDuration: 0).delay(delay))
        
    }
}
