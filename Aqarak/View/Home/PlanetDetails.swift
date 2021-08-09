//
//  PlanetDetails.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct PlanetDetails: View {
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
    
    @State var isShareViewRepresentesd:Bool=false
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
            Image("Rectangle").resizable()
//                .onLongPressGesture {
//                    changeViewMode.toggle()
//                }
                .padding(20)
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
                Image(Planet_Action_Button.heart.rawValue).resizable().frame(width: 50, height: 50, alignment: .center).onTapGesture {
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
