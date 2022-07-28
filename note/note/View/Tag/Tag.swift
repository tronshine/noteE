//
//  Tag.swift
//  note
//
//  Created by James on 2022/7/28.
//

import SwiftUI

struct Tag: View {
    var entity: TagEntity

    var body: some View {
        Text(entity.name)
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(entity.color.swiftUIColor)
            .cornerRadius(4)
    }
}

struct Tag_Previews: PreviewProvider {
    static var previews: some View {
        Tag(entity: TagEntity(name: "Memo", color: CodableUIColor(uiColor: UIColor.blue)))
    }
}
