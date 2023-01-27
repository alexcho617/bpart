//
//  NeedsView.swift
//  bpart
//
//  Created by Alex Cho on 2023/01/27.
//

import SwiftUI

struct NeedsView: View {
    let tagCategorys: [String] = [
        "교육", "난민 문제", "전쟁", "피해자 보상", "국가적 피해",
        "소상공인", "캠페인", "장애인", "불평등", "정의"]
    
    @State private var searchString = ""
    
    var needsDataList: [NeedsData] = []
    
    init(){
        needsDataList = NeedsData.all()
    }
    
    
    
    let columns : [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        VStack {
            Spacer().frame(height: 1)
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    Image("logo").resizable().frame(width: 60, height: 19.23).padding(EdgeInsets(top: 12, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                        .frame(height:20.77)
                    Text("따뜩한 관심이,").font(.customheading1)
                    Spacer()
                        .frame(height:13)
                    Text("필요한 이야기를 나눕니다.").font(.customheading1)
                        .frame(height:13)
                }.padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 0))
                
                TextField("검색어를 임력해주세요", text: $searchString) // TODO : ADD Label
                    .frame(height: 50)
                    .background(Color(red: 252/255, green: 252/255, blue: 252/255))
                    .padding(EdgeInsets(top: 30, leading: 20, bottom: 20, trailing: 0))
                
                HStack{
                    Spacer()
                    MyButtonView(tagname: "교육")
                    MyButtonView(tagname: "난민 문제")
                    MyButtonView(tagname: "전쟁")
                    MyButtonView(tagname: "피해자 보상")
                    MyButtonView(tagname: "국가적 피해")
                    Spacer()
                }
                HStack{
                    Spacer()
                    MyButtonView(tagname:"소상공인")
                    MyButtonView(tagname:"캠페인")
                    MyButtonView(tagname:"장애인")
                    MyButtonView(tagname:"불펼등")
                    MyButtonView(tagname:"정의")
                    Spacer()
                }
                
                
                ScrollView {
                    LazyVGrid(columns:columns) {
                        ForEach(self.needsDataList, id: \.self) { needsData in
                            VStack(alignment: .leading){
                                VStack(alignment: .leading){
                                    HStack(alignment: .top){
                                        
                                        Image(needsData.orgURL)
                                            .resizable()
                                            .frame(width:20, height:20)
                                        Text(needsData.organization)
                                            .foregroundColor(.white)
                                        Spacer()
                                        
                                        
                                    }
                                    
                                    Text(needsData.description)
                                        .foregroundColor(.white)
                                    Spacer()

                                    Text("\(needsData.numLikes)명이 \n공감하고 있어요")
                                        .foregroundColor(.white)
                                        .font(.custombody4)
                                        .padding(4)
                                    HStack{
                                        Text(needsData.timestamp)
                                            .foregroundColor(.white)
                                            .font(.customtitle7)
                                        
                                        Spacer()
                                        
                                        HStack{
                                            Image(systemName:"bubble.left")
                                                .font(.customtitle7)
                                                .foregroundColor(.white)
                                            Text("\(needsData.numComments)")
                                                .foregroundColor(.white)
                                                .font(.customtitle7)
                                        }
                                    }
                                    
                                }.padding(20)
                                
                            }.background(Image(needsData.imageURL))
                                .frame(width: 190, height: 190)
                                .cornerRadius(30)
                            
                        }
                    }
                }
            }
        }
    }
}

struct MyButtonView: View{
    var tagname : String
    
    var body: some View{
        Button(action: {}){
            Text(self.tagname)
                .font(.custombody4)
                .foregroundColor(.teal)
                .padding(EdgeInsets(top: 2, leading: 16, bottom: 2, trailing: 16))
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(Color.teal, lineWidth: 1)
                ).padding(0)
        }.padding(0)
    }
}
struct NeedsView_Previews: PreviewProvider {
    static var previews: some View {
        NeedsView()
    }
}
