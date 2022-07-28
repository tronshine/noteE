//
//  info.swift
//  note
//
//  Created by James on 2022/7/28.
//

import SwiftUI

struct info: View {
    var body: some View {
        ScrollView{
            Button("1"){}.hidden()
            VStack{
                Image("E")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth:nil ,maxHeight: 100)
                    .shadow(radius: 5.0)

                Text("noteE")
                    .font(.custom("Chalkboard SE Regular",size:35))
                    .foregroundColor(Color.blue)
                Text("版本号：0.1.b1").font(.body).foregroundColor(Color.gray)
                Spacer()
                Text("主要部分由张旭晟完成构建").font(.body).foregroundColor(Color.gray)

                
                
            }
            
        }
        
    }
}

struct info_Previews: PreviewProvider {
    static var previews: some View {
        info()
    }
}
