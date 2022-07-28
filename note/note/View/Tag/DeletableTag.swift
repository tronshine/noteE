//
//  DeletableTag.swift
//  note
//
//  Created by James on 2022/7/28.
//

import SwiftUI

struct DeletableTag: View {
    var entity: TagEntity

    var body: some View {
        HStack {
            Text(entity.name)
            Image(systemName: "multiply.square")
        }
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
        .background(entity.color.swiftUIColor)
        .cornerRadius(4)
    }
}

 struct DeletableTag_Previews: PreviewProvider {
     static var entity = TagEntity(id: UUID(), name: "gray", color: CodableUIColor(uiColor: .gray))
    static var previews: some View {
        DeletableTag(entity: entity)
    }
 }
