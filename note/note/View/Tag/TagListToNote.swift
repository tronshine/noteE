//
//  TagListToNote.swift
//  note
//
//  Created by James on 2022/7/28.
//

import SwiftUI

struct TagListToNote: View {
    @ObservedObject var viewModel = TagListToNoteViewModel()

    var body: some View {
        if viewModel.noteDocument != nil {
            List {
                TagHStack(tags: viewModel.tagsToNote, action: viewModel.remove, deletable: true)
                Section(header: Text("选择一个你要添加到笔记的标签")) {
                    ForEach(viewModel.tagsNotToNote, id: \.id) { tag in
                        HStack {
                            Tag(entity: tag)
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            viewModel.add(tagName: tag)
                        }
                    }
                }
            }
        } else {
            Text("Couldn't found note data")
        }
    }
}

struct TagListToNote_Previews: PreviewProvider {
    static var previews: some View {
        TagListToNote()
    }
}
