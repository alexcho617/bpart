//
//  FundingResult.swift
//  bpart
//
//  Created by Alex Cho on 2023/01/27.
//

import SwiftUI

struct FundingResult: View {
    var body: some View {
        ScrollView {
            VStack(alignment:.leading){
                Image("logo").resizable().frame(width: 60, height: 19.23)
                Spacer()
                Text("비파트님,\n당신의 따듯한 후원 덕분에\n오늘 3개의 학교가 세워졌어요.").font(.customheading1)
            }.frame(width: .infinity)
            Text("후원 기업 현황")
            Text("따듯한 후원을 통해 나눔을 실천하는 기업들이 있어요.").foregroundColor(.gray)
        }
    }
}

struct FundingResult_Previews: PreviewProvider {
    static var previews: some View {
        FundingResult()
    }
}
