//
//  HomeView.swift
//  bpart
//
//  Created by Alex Cho on 2023/01/27.
//

import SwiftUI
import Firebase

struct HomeView: View {
    //    @EnvironmentObject var firestoreFundingManager: FirestoreFundingManager
    //    @State private var showPopUp = false
    init(){
    }
    let steps = [0, 5, 10]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading){
                    Image("logo").resizable().frame(width: 60, height: 19.23)
                    Spacer()
                    Text("비파트님,\n당신의 따듯한 후원 덕분에\n오늘 3개의 학교가 세워졌어요.").font(.heading1)
                    
                    Spacer()
                    
                    HStack{
                        //ICONS
                    }
                    //list of CARDS
                    VStack(alignment: .leading){
                        
                        ImageGraph()
                        HStack {
                            VStack(alignment: .leading) {
                                Text("가나 교육사업 프로젝트").font(.title3)
                                
                                Text("\"저희 동네에도 학교가 지어졌지만,\n선생님이 안계셔서 공부를 할 수 없어요\"").font(.body2)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            VStack{
                                Button {
                                    //heart"
                                } label: {
                                    Image(systemName: "heart").foregroundColor(.buttonColor)
                                }
                                Spacer()
                                Button {
                                    //participate
                                } label: {
                                    Text("함께하기").foregroundColor(.buttonColor)
                                
                                }
                            }
                        }
                    }
                }
                
            }.padding()
        }
        
    }
  
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject((FirestoreFundingManager()))
    }
}

struct ImageGraph: View {
    var body: some View {
        let participationNumber: Int = 262
        ZStack(alignment: .bottomLeading){
            Image("sample").resizable()
                .frame(width: 348, height: 178)
                .cornerRadius(8)
            HStack{
                Text("GRAPH")
                Spacer()
                Text("\(participationNumber)명이\n후원에 동참했어요")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(12)
            }
        }
        
    }
}
