//
//  TagHStack.swift
//  note
//
//  Created by James on 2022/7/28.
//

import SwiftUI

struct TagHStack: View {
    var tags: [TagEntity]
    var action: ((TagEntity) -> Void)?
    var deletable = false

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Spacer()
                ForEach(tags, id: \.id) { tag in
                    if deletable {
                        DeletableTag(entity: tag)
                            .onTapGesture { action?(tag) }
                    } else {
                        Tag(entity: tag)
                            .onTapGesture { action?(tag) }
                    }

                }
                Spacer()

            }
        }
        .frame(minHeight: 60)
    }
}

 struct TagHStack_Previews: PreviewProvider {
     static var blue = TagEntity(id: UUID(), name: "blue", color: CodableUIColor(uiColor: .blue))
     static var yellow = TagEntity(id: UUID(), name: "yellow", color: CodableUIColor(uiColor: .yellow))
     static var red = TagEntity(id: UUID(), name: "red", color: CodableUIColor(uiColor: .red))
     static var previews: some View {
        TagHStack(tags: [blue, yellow, red])
    }
 }
