//
//  OnboardingViewOne.swift
//  Aqarak
//
//  Created by Sandal on 28/12/1442 AH.
//

import SwiftUI

struct OnboardingViewOne: View {
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(spacing: 0.0) {
            VStack {
                Image("onboarding-bg-1")
                    .resizable()
                    .scaledToFit()

//                Image("onboarding-object-1")
//                    .resizable()
//                    .scaledToFit()
//                    .offset(x: 0, y: 150)
                    .scaleEffect(isAnimating ? 1 : 0.9)
            }.frame(width: 350, height: 160).padding(.top,100)

           

            Text("عقارك علينا")
                .font(.custom(Fount_name.b.rawValue, size: 36))
                .foregroundColor(.AppPrimaryColor)
//                .bold()
//                .foregroundColor(Color(red: 41 / 255, green: 52 / 255, blue: 73 / 255))
                .padding(.top,50)

            Text("هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد.")
                .font(.custom(Fount_name.l.rawValue, size: 14))
                .multilineTextAlignment(.trailing)
            
                .frame(maxWidth: 300)
                .foregroundColor(.AppFount)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 2, y: 2)

            Spacer()

//            Button(action: {
//
//            }, label: {
//                Text("Get Started")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .padding(.horizontal, 50)
//                    .padding(.vertical, 16)
//                    .background(
//                        RoundedRectangle(cornerRadius: 20)
//                            .foregroundColor(
//                                Color(
//                                    red: 255 / 255,
//                                    green: 115 / 255,
//                                    blue: 115 / 255
//                                )
//                            )
//                    )
//            })
//            .shadow(radius: 10)

            Spacer()
        }
        .onAppear(perform: {
            isAnimating = false
            withAnimation(.easeOut(duration: 0.5)) {
                self.isAnimating = true
            }
        })
    }
}

struct OnboardingViewOne_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingViewOne()
    }
}
