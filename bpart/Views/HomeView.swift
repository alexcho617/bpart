//
//  HomeView.swift
//  bpart
//
//  Created by Alex Cho on 2023/01/27.
//

import SwiftUI

struct HomeView: View {
    //    @EnvironmentObject var firestoreFundingManager: FirestoreFundingManager
    //    @State private var showPopUp = false
    
    @State var funding = Funding(title: "가나 교육사업 프로젝트", description: "\"저희 동네에도 학교가 지어졌지만,\n선생님이 안계셔서 공부를 할 수 없어요\"",currentAmount: 74, targetAmount: 100, id: "1111", media: "sample", milestones: [Milestone(what: "학교건설", who: "현대건설",isDone: true),Milestone(what: "기기지원", who: "Samsung",isDone: false),],participationCount: 262)
    
    init(){
    }
    
    var body: some View {
//        NavigationStack {
            ScrollView {
                VStack(alignment: .leading){
                    Image("logo").resizable().frame(width: 60, height: 19.23)
                    Spacer()
                    Text("비파트님,\n당신의 따듯한 후원 덕분에\n오늘 3개의 학교가 세워졌어요.").font(.customheading1)
                    Spacer()
                    
                    NavigationLink {
                        FundingResult()
                    } label: {
                        Text("후원 결과 확인하기")
                            .font(.body)
                            .foregroundColor(.teal)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.teal, lineWidth: 2)
                            )
                    }
                    
                    Spacer()
                    
                    HStack{
                        VStack{
                            Button {
                                //
                            } label: {
                                VStack{
                                    Image(systemName:"star")
                                    Text("전체")
                                }
                                VStack{
                                    Image(systemName:"wonsign.circle")
                                    Text("교육")
                                }
                            }

                        }
                    }
                    //list of CARDS
                    
                    
                    VStack(alignment: .leading){
                        //imagegraph view
                        ImageGraph(funding: self.$funding)
                        
                        //card
                        HStack {
                            VStack(alignment: .leading) {
                                Text(funding.title).font(.title3)
                                
                                Text(funding.description).font(.custombody2)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            VStack{
                                Button {
                                    //heart"
                                } label: {
                                    Image(systemName: "heart").foregroundColor(.teal)
                                }
                                Spacer()
                                NavigationLink {
                                    FundingDetailView()
                                } label: {
                                    Text("함께하기")
                                        .font(.body)
                                        .foregroundColor(.teal)
                                        .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 30)
                                                .stroke(Color.teal, lineWidth: 2)
                                        )
                                }
                            }
                        }
                    }
                }
                
            }.padding()
        }
        
//    }
    
}

struct ImageGraph: View {
    
    @Binding var funding : Funding
    
    var body: some View {
        
        ZStack(alignment: .bottomLeading){
            Image(funding.media).resizable()
                .frame(width: 348, height: 178)
                .cornerRadius(8)
            HStack{
                ZStack{
                    
                    Rectangle().frame(width:60,height: 4).foregroundColor(.blue).offset(y:17).padding(12)
                    
                    HStack{
                        ForEach(funding.milestones, id: \.self){ milestone in
                            VStack{
                                Text(milestone.what).foregroundColor(.white).font(.bargraphLarge)
                                Text(milestone.who).foregroundColor(.white).font(.bargraphSmall)
                                
                                Image(systemName: "checkmark")
                                    .foregroundColor(milestone.isDone ? .white : .blue)
                                    .font(.bargraphLarge)
                                    .padding(4)
                                    .background(milestone.isDone ? .blue : .cyan)
                                    .clipShape(Circle())
                                
                                
                            }
                        }
                    }
                    
                }
                
                
                
                
                Spacer()
                Text("\(funding.participationCount)명이\n후원에 동참했어요")
                    .font(.bargraphTitle).foregroundColor(.white)
                    .padding(12)
                    .multilineTextAlignment(.trailing)
                
            }
        }
        
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
