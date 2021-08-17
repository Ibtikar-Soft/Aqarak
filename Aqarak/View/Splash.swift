//
//  Splash.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI
private var timer: Timer?
struct Splash: View {
     var isFirestOpen: Bool =  VarUserDefault.SysGlobalData.getGlobalBool(key: VarUserDefault.SysGlobalData.isFirestOpen)
    var isLogin: Bool =  VarUserDefault.SysGlobalData.getGlobalBool(key: VarUserDefault.SysGlobalData.isLogin)
    @State var logo_key=0
     var uAnimationDuration: Double { return 3.4 }
    var body: some View {
        ZStack{
        if logo_key == 0{
            Image("AppLogo").resizable().frame(width: 250, height: 175, alignment: .center).onAppear{
                restartAnimation()
            }
        }
        else if logo_key >= 1{
            if logo_key == 1 && !isFirestOpen {
                AppInto()
            }
             else{
            if !isLogin{
                SignIn()
                
            }
            else{
                    Home().edgesIgnoringSafeArea(.all)
            .onTapGesture {
                self.hideKeyboard()
              }
            }
             }
        }
        }
    }
    func restartAnimation(video_time:Double=0.0) {
        let deadline: DispatchTime = video_time != 0.0 ? .now() + video_time :.now() + uAnimationDuration
      DispatchQueue.main.asyncAfter(deadline: deadline) {
        if self.logo_key+1 == 2{
          self.logo_key += 1
        }
        else{
//        withAnimation(.easeIn(duration: uAnimationDuration)) {
            self.logo_key += 1
//            isPresented = self.logo_key == 2 ? true : false
//            restartAnimation()
           }
//        }
      }
    }
}


struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
