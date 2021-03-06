//
//  Profile.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI
import SwiftyJSON
struct Profile: View {
    @State var emailAddress = ""
    @State var emailAddressError = false
    
    @ObservedObject var textBindingManager = TextBindingManager(limit: 9)
    @State  var  showsAlert:Bool=false
    @State  var  message:String=""
    @State var phoneNumberError:Bool=false
    @State var isSignInPressed:Bool=false
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
                Text("الصفحة الشخصية")
                    .font(.custom(Fount_name.b.rawValue, size: 24))
                    .foregroundColor(.AppFount).padding(.trailing,30)
                
            }
            Image("profile_image").resizable().frame(width: 165, height: 165)
            Spacer()
            VStack{
//            Spacer()
//            VStack(alignment: .trailing, spacing: 0){
                Text("اضف بريد الكتروني")
                    .font(.custom(Fount_name.l.rawValue, size: 14))
//                TextField("05xxxxxxxx", text: $textBindingManager.text, onEditingChanged: onEditingChanged(_:), onCommit: onCommit)
//                    .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $phoneNumberError))
//                    .modifier(customFountCR())
//                    .foregroundColor(.AppGrayFount)
//                    .keyboardType(.phonePad)
                TextField("abc@abc.com", text: $emailAddress)
                    .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $emailAddressError))
                                        .modifier(customFountCR())
                                        .foregroundColor(.AppGrayFount)
                                        .keyboardType(.emailAddress)
                    .overlay(
                        HStack{
                            Spacer()
                            Image(systemName: "envelope.fill").frame(width: 40, height: 30, alignment: .center).padding(.horizontal,10)
                        }
                    )
            Text("تعديل رقم الهاتف")
                .font(.custom(Fount_name.l.rawValue, size: 14))
                TextField("5xxxxxxxx", text: $textBindingManager.text, onEditingChanged: onEditingChanged(_:), onCommit: onCommit)
                    .textFieldStyle(CTFStyleClearBackground(width: 320, cornerRadius: 20, height: 50, showError: $phoneNumberError))
                    .modifier(customFountCR())
                    .foregroundColor(.AppGrayFount)
                    .keyboardType(.phonePad)
                    .overlay(
                        HStack{
                            Text("+966")
                                .frame(width: 40, height: 30, alignment:.center)
                                .padding(.horizontal,10)
                            Spacer()
                            Image(systemName: "candybarphone").frame(width: 40, height: 30, alignment: .center).padding(.horizontal,10)
                        }
                    )
                Button(action: {
                    if FormValidation(){
    //                checkUserSignIn()
                        UpdateCustomer()
//                        isSignInPressed=true
                    }
                }, label: {
                    Text("تحديث")
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
            }
                Spacer()
                Spacer()
        }.onTapGesture {
            hideKeyboard()
        }
        .onAppear{
            self.textBindingManager.text =   VarUserDefault.SysGlobalData.getGlobal(key: VarUserDefault.SysGlobalData.PhoneNo)
            emailAddress = VarUserDefault.SysGlobalData.getGlobal(key: VarUserDefault.SysGlobalData.Email)
        }
        .alert(isPresented: self.$showsAlert) {
            Alert(title: Text(message).font(.custom(Fount_name.b.rawValue, size: 16)) )
        }
        
    }
//    {"Id" : "1", "" : "Ayman", "PhoneNo" : "+966566373972"}
    func UpdateCustomer(){
        let prams = ["PhoneNo": "+966"+StringFunction().numberStrToEnglish(numberStr: self.textBindingManager.text), "Name" : emailAddress,"Id":"\(VarUserDefault.SysGlobalData.getGlobalInt(key: VarUserDefault.SysGlobalData.user_id))"]
    print(Connection().getUrl(word: "UpdateCustomer"))
        print(prams)
    RestAPI().postData(endUrl: Connection().getUrl(word: "UpdateCustomer"), parameters:prams ) { result in
        
        let sectionR = JSON(result!)
        print(sectionR)
        if sectionR["responseCode"].int == 200{
            let jsonDatas = try! JSONEncoder().encode(sectionR["response"])
//            let menus = try! JSONDecoder().decode([plantModal].self, from: jsonDatas)
//            menue=menus
//            getFav()
//            print(menue)
            VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.PhoneNo,Val: StringFunction().numberStrToEnglish(numberStr: self.textBindingManager.text))
            VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.Email,Val: emailAddress)
            message = "تم التعديل بنجاح"
            showsAlert=true
        }
    } onError: { error in
        print(error!)
    }
    
}
    func FormValidation() -> Bool {
        self.phoneNumberError = (self.textBindingManager.text.isEmpty || self.textBindingManager.text.count != 9 || !self.textBindingManager.text.hasPrefix("5")) ? true : false
        emailAddressError =  !isValidEmailAddress(emailAddressString: emailAddress)
        if phoneNumberError{
            message="خطاء في رقم الجوال"
            showsAlert=true
        }
        else if emailAddressError{
            message="خطاء في البريد"
            showsAlert=true
        }
        return (!self.phoneNumberError || !emailAddressError)
    }
    func onCommit() {
        
           print("commit")
       }
       func onEditingChanged(_ changed: Bool) {
           print(changed)
       }
}
