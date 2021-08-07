//
//  SignIn.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI
import SwiftyJSON
struct SignIn: View {
    @ObservedObject var textBindingManager = TextBindingManager(limit: 10)
    @State  var  showsAlert:Bool=false
    @State  var  message:String=""
    @State var phoneNumberError:Bool=false
    @State var isSignInPressed:Bool=false
    
    var body: some View {
        ZStack{
        VStack{
            Image("Mobile_apps")
                .resizable()
                .renderingMode(.original)
                .frame(width:320, height: 260)
                .padding(.top,50)
            Spacer()
            Text("مرحبا بك")
                .font(.custom(Fount_name.b.rawValue, size: 36))
                .foregroundColor(.AppPrimaryColor)
//                .bold()
//                .foregroundColor(Color(red: 41 / 255, green: 52 / 255, blue: 73 / 255))
//                .padding(.top,50)
            Text("سجل دخولك الى عقارك وتمتع بافضل واسهل وارخص الخدمات")
                .font(.custom(Fount_name.l.rawValue, size: 20))
                .multilineTextAlignment(.trailing)

                .frame(maxWidth: 300)
                .foregroundColor(.AppGrayFount)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)
//            Spacer()
            VStack(alignment: .trailing, spacing: 0){
                Text("ادخل رقم الهاتف")
                    .font(.custom(Fount_name.l.rawValue, size: 14))
                TextField("05xxxxxxxx", text: $textBindingManager.text, onEditingChanged: onEditingChanged(_:), onCommit: onCommit)
                    .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $phoneNumberError))
                    .modifier(customFountCR())
                    .foregroundColor(.AppGrayFount)
                    .keyboardType(.phonePad)

            }.padding(.top,30)
            
            Button(action: {
                if FormValidation(){
//                checkUserSignIn()
                    VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.isLogin,Val: true)
                    isSignInPressed=true
                }
            }, label: {
                Text("تسجيل دخول")
                    .font(.custom(Fount_name.l.rawValue, size: 20))
                    
                    .foregroundColor(.white)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    .frame(width: 320, height: 50)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(
                                Color.AppPrimaryColor
                                
                            )
                    )
                
            })
            .padding(.top,20)
            Spacer()
        }
        }
        .onTapGesture {
            hideKeyboard()
        }
        
        .fullScreenCover(isPresented: $isSignInPressed, content: {
            Home()
        })
        .alert(isPresented: self.$showsAlert) {
            Alert(title: Text(message).font(.custom(Fount_name.b.rawValue, size: 16)) )
        }
    }
    func onCommit() {
        
           print("commit")
       }
       func onEditingChanged(_ changed: Bool) {
           print(changed)
       }
    func FormValidation() -> Bool {
        
        self.phoneNumberError = (self.textBindingManager.text.isEmpty || self.textBindingManager.text.count != 10 || !self.textBindingManager.text.hasPrefix("05")) ? true : false
        
        if phoneNumberError{
            message="خطاء في رقم الجوال"
            showsAlert=true
        }
        return (!self.phoneNumberError)
    }
    func checkUserSignIn(){
//        IsError=false
        
        let prams = ["PhoneNo": StringFunction().numberStrToEnglish(numberStr: self.textBindingManager.text)]
//                let prams = ["PhoneNo": self.textBindingManager.text,"Password": password]

        //                let prams = ["PhoneNo": "+966122222223","Password": "123456"]
        RestAPI().postData(endUrl: Connection().getUrl(word: "login"), parameters: prams) { result in
//            showSandalLoadingIndicater=false
           let sectionR = JSON(result!)
            print(Connection().getUrl(word: "login"))
                  print(prams)
            print(sectionR)
         
            if sectionR["responseCode"].int == 200{
//
                VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.isLogin,Val: true)
                isSignInPressed = true
            
                
            }
            else if sectionR["responseCode"].int == 405{ // user not active
//                displayItem=1
//                reSendVerification()
            }
            else if sectionR["responseCode"].int == 404{//user not found
                message = " هذا المستخدم غير موجود"
                showsAlert=true
            }
            else if sectionR["responseCode"].int == 406{//user not found
                message = "خطاء في بيانات الحساب"
                showsAlert=true
            }
            else{
                message = sectionR["responseMasg"].stringValue
                showsAlert=true
            }
            
        } onError: { error in
            print(error)
//            showSandalLoadingIndicater=false
        }

        

    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
