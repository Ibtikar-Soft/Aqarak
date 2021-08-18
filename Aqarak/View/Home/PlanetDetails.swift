//
//  PlanetDetails.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI
import SwiftyJSON
struct PlanetDetails: View {
    @State var emailAddressError = false
    @State var latitude_longitude_change = false
    
    @State var data : Data?
   @Binding var id:plantModal
    @State var search_text = ""
    
    @ObservedObject var textBindingManager = TextBindingManager(limit: 10)
    @State  var  showsAlert:Bool=false
    @State  var  message:String=""
    @State var phoneNumberError:Bool=false
    @State var isSignInPressed:Bool=false
    @State var isGoToMap:Bool=false
    @State var changeViewMode:Bool=false
    @State var inInLocalFav:Bool=false
    
    @State var isShareViewRepresentesd:Bool=false
    @State var plan_number:String=""
    
    @State var longitude = 24.754383
    @State var latitude = 46.757459
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
//            AsyncImage(
//                url: URL(string://AppImageBase+section.imageURL)!,
//                            getImage(img: id.imageURL))!,
//                                placeholder: { Image("AppLogo")},
//                                image: { Image(uiImage: $0).resizable() }
//                             )
//            ZStack{
//                if changeViewMode{
            VStack(spacing:5){
                HStack(alignment:.center,spacing: 0){

                TextField("", text: $plan_number)
                    .textFieldStyle(CTFStyleClearBackground(width: (UIScreen.width*0.8)+40, cornerRadius: 20, height: 50, showError: $emailAddressError))
                                        .modifier(customFountCR())
                                        .foregroundColor(.AppGrayFount)
                                        .keyboardType(.numberPad)
                    .overlay(


                
                        HStack{
                            Spacer()
                Image(systemName: "magnifyingglass.circle.fill").resizable().foregroundColor(.AppFount).frame(width: 30, height: 30, alignment: .center).offset(x: -10).onTapGesture {
                        if gitPlanCordination(plan_id: plan_number){
                                                latitude_longitude_change.toggle()
                        }
                }
                }
                                )
                
//                HStack{
//                    Spacer()
//                    Button {
//                        longitude+=20
////                        latitude_longitude_change.toggle()
//                    } label: {
//
//                    }
//                    .padding(.horizontal,10)
//                }
            }//.background(Color.red)
                .frame(width: UIScreen.width*0.8)
//
//            }.frame(width: UIScreen.width*0.8, height: 40, alignment: .center)
                
//                SearchMapView(longitude: $latitude, latitude: $longitude)
                if latitude_longitude_change{
                    SearchMap(longitude: longitude, latitude: latitude, location_drow: id.cord)
                        .frame(width: UIScreen.width*0.8, alignment: .center)
                        .cornerRadius(20)//.background(Color.blue)
                }else{
                    SearchMap(longitude: longitude, latitude: latitude ,location_drow: id.cord)
                        .frame(width: UIScreen.width*0.8, alignment: .center)
                    .cornerRadius(20)//.background(Color.red)
                }
//                .onLongPressGesture {
//                    changeViewMode.toggle()
//                }
            }
            //.padding(20)
//
//                }
//                else{
//                    if ((data?.isEmpty) != nil){
//                    PDFKitRepresentedView(data!) .padding(20).onLongPressGesture {
//                        changeViewMode.toggle()
//                    }
//                    }
//                    else{
//                        Text("sa").onAppear{
//                            self.data = try? Data(contentsOf: URL(string: "https://www.clickdimensions.com/links/TestPDFfile.pdf")!)
//                        }
//                    }
//
//                }
//            }
//            Spacer()
            HStack{
                Image(inInLocalFav ? Planet_Action_Button.redheart.rawValue : Planet_Action_Button.heart.rawValue).resizable().frame(width: 50, height: 50, alignment: .center).onTapGesture {
                    addToLocalFav()
//                    addToFavorate(plan_id:id.id)
                }
                Spacer()
                Image(Planet_Action_Button.maps.rawValue).resizable().frame(width: 50, height: 50, alignment: .center).onTapGesture {
                    isGoToMap = true
                }
                Spacer()
                Image(Planet_Action_Button.share.rawValue).resizable().frame(width: 50, height: 50, alignment: .center).onTapGesture {
//                    actionSheet()
                    isShareViewRepresentesd = true
                }
                .sheet(isPresented: $isShareViewRepresentesd) {
                    ActivityViewController(itermToShare: [URL(string: "awad619@hotmail.com")!])
                }
            }.padding(.horizontal,20)
            .padding(.bottom,20)
            
        }.onAppear{
            print(id)
            print(id.inInLocalFav)
            inInLocalFav=id.inInLocalFav
            print(id.cord[0][1])
            longitude = id.cord[0][0]
                latitude = id.cord[0][1]
        }
        .alert(isPresented: self.$showsAlert) {
            Alert(title: Text(message).font(.custom(Fount_name.b.rawValue, size: 16)) )
        }
        .fullScreenCover(isPresented:$isGoToMap, content: {
            Mapview(longitude: longitude, latitude: latitude, location_drow: id.cord)
            
        })
        }.onTapGesture {
            hideKeyboard()
        }
    }
    func deleteFav(id:String){
    print(Connection().getUrl(word: "DeleteFavor")+id)
    RestAPI().postData(endUrl: Connection().getUrl(word: "DeleteFavor")+id, parameters: [:]) { result in
        
        let sectionR = JSON(result!)
        print(sectionR)
        if sectionR["responseCode"].int == 200{
            let jsonDatas = try! JSONEncoder().encode(sectionR["response"])
//            let menus = try! JSONDecoder().decode([plantModal].self, from: jsonDatas)
//            menue=menus
//            getFav()
            inInLocalFav.toggle()
            removeTHis(id:id)
//            print(menue)
        }
        else if sectionR["responseCode"].int == 410{
            
        }
    } onError: { error in
        print(error!)
    }
    
}
    
    func removeTHis(id:String){
        
        if VarUserDefault.SysGlobalData.getGlobalInt(key: VarUserDefault.SysGlobalData.user_id) > 0{
                ////
              let nn=VarUserDefault.SysGlobalData.getGlobal(key: VarUserDefault.SysGlobalData.Favorate)
//            VarUserDefault.SysGlobalData.setGlobal(Key: VarUserDefault.SysGlobalData.Favorate, Val: "")
            var sd=""//nn+"#\(id.id)#,"
              var useFav=nn.components(separatedBy:",")
              var faveIndex=0
              if useFav.count>0{
                  for iteam in 0...useFav.count-1{
                    if "#\(id)#" != useFav[iteam] {
                        var sd=sd+"#\(useFav[iteam])#,"
                      }
                  }
              }
//              if(!minato){
                
                VarUserDefault.SysGlobalData.setGlobal(Key: "Favorate", Val: sd)
                print(VarUserDefault.SysGlobalData.getGlobal(key:VarUserDefault.SysGlobalData.Favorate))
//                addToFavorate(plan_id:id.id)
//              }
            }

        
    }
    func addToFavorate(plan_id:Int){
        
        let prams = ["CustomerID" : VarUserDefault.SysGlobalData.getGlobalInt(key: VarUserDefault.SysGlobalData.user_id), "PlanID" : plan_id]
        RestAPI().postData(endUrl: Connection().getUrl(word: "AddFavor"), parameters: prams) { result in
//            showSandalLoadingIndicater=false
           let sectionR = JSON(result!)
            print(Connection().getUrl(word: "login"))
                  print(prams)
            print(sectionR)
         
            if sectionR["responseCode"].int == 200{
                message = "تمت  الاضافة الى المفضلة"
                showsAlert=true
//                addToLocalFav()
                inInLocalFav.toggle()
            }
            else if sectionR["responseCode"].int == 405{ // user not active
//                displayItem=1
//                reSendVerification()
            }
            else if sectionR["responseCode"].int == 404{//user not found
//                message = " هذا المستخدم غير موجود"
//                showsAlert=true
            }
            else if sectionR["responseCode"].int == 406{//user not found
//                message = "خطاء في بيانات الحساب"
//                showsAlert=true
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
    func addToLocalFav(){
        
        if VarUserDefault.SysGlobalData.getGlobalInt(key: VarUserDefault.SysGlobalData.user_id) > 0{
                ////
                var minato=false
              var nn=VarUserDefault.SysGlobalData.getGlobal(key: VarUserDefault.SysGlobalData.Favorate)
              var useFav=nn.components(separatedBy:",")
              var faveIndex=0
            print(useFav)
              if useFav.count>0{
                  for iteam in 0...useFav.count-1{
                    if "#\(id.id)#" == useFav[iteam] {
                          faveIndex=iteam
                          minato=true
                            message=" تمت ازالة العنصر من المفضلة"
                            showsAlert=true
                            deleteFav(id: "\(id.id)")
                          break
                      }
                  }
              }
              if(!minato){
                var sd=nn+"#\(id.id)#,"
                VarUserDefault.SysGlobalData.setGlobal(Key: "Favorate", Val: sd)
                print(VarUserDefault.SysGlobalData.getGlobal(key:VarUserDefault.SysGlobalData.Favorate))
                addToFavorate(plan_id:id.id)
                
              }
            }
            else{
//                // to Login
            }
        
    //
    }
    func gitPlanCordination(plan_id:String) -> Bool {
        
        for pieces in id.planPieces
        {
            if plan_id == pieces.pieceNo {
                
                longitude = pieces.plan_coordination.coordinate.latitude
                latitude =  pieces.plan_coordination.coordinate.longitude
                print("item found")
                
                return true
                
            }
            
        }
        print("item not found")
        print(id.planPieces)
        print(plan_id)
        return false
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
struct ActivityViewController:UIViewControllerRepresentable {
    var itermToShare:[Any]
    var serviceToSh:[UIActivity]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> some UIActivityViewController {
        let controller = UIActivityViewController(activityItems: itermToShare, applicationActivities: serviceToSh)
        return controller
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    
}
func getImage(img:String) -> String {
    print(img)
    guard let parsedURL = URL(string: img) else {
//            return "https:\\\\freepngimg.com\\thumb\\food\\1-2-food-free-png-image.png"
        return "https://freepngimg.com/thumb/food/1-2-food-free-png-image.png"
    }

    return img
}
