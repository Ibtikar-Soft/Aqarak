//
//  About.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI
import SwiftyJSON
struct About: View {
    @State var GetAboutApp:String=""
    var body: some View {
        VStack{
        HStack{
            Image("AppLogo").resizable().frame(width: 40, height: 40)
//                .padding(10)

            Spacer()
            BackButton().frame(width: 40, height: 40)
        }.padding(.horizontal,20)
        .padding(.top,20)
            HStack{
                Spacer()
                Text("من نحن")
                    .font(.custom(Fount_name.b.rawValue, size: 24))
                    .foregroundColor(.AppFount).padding(.trailing,30)
                
            }
            HStack(){
//                Spacer()
                Text(GetAboutApp)
                .multilineTextAlignment(.trailing)
                .font(.custom(Fount_name.l.rawValue, size: 18))
                .frame(maxWidth:  UIScreen.width*0.8)
                .foregroundColor(.AppGrayFount)
//            Spacer(
            }.frame(width: UIScreen.width*0.8)
            Spacer()
        }.onAppear{
            getAbout()
        }
    }
    func getAbout(){
        
    print(Connection().getUrl(word: "GetAbout"))
    RestAPI().getData(endUrl: Connection().getUrl(word: "GetAbout"), parameters: [:]) { result in
        
        let sectionR = JSON(result!)
        print(sectionR)
        if sectionR["responseCode"].int == 200{
//            let jsonDatas = try! JSONEncoder().encode()
            self.GetAboutApp = sectionR["response"][0]["about1"].stringValue
            
        }
    } onError: { error in
        print(error!)
    }
    
}
}

struct About_Previews: PreviewProvider {
    static var previews: some View {
        About()
    }
}
