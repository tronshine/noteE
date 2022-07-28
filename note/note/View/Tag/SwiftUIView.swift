//
//  SwiftUIView.swift
//  note
//
//  Created by James on 2022/7/28.
//
import SwiftUI

struct SwiftUIView: View {
    @Binding var tags: [TagEntity]
    @State private var tagName: String = "新建标签"
    private var tagColor: CodableUIColor {
        CodableUIColor(uiColor: UIColor(color))
    }

    @State private var color: Color = .green
    @State var isTapped = false
    private var tagEntity: TagEntity {
        TagEntity(name: tagName, color: tagColor)
    }
    var body: some View {
        VStack {
            Tag(entity: tagEntity)
            HStack {
                Text("标签: ")
                TextField("", text: $tagName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            Spacer()
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarLeading) {
                Button(action: cancel) {
                    Text("取消")
                    .foregroundColor(.red)
                }
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: save) {
                    Text("好")
                }
            }
        }
    }
    func cancel() {
        isTapped.toggle()
    }

    func save() {
        tags.append(tagEntity)
        isTapped.toggle()
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    @State static var tags = [TagEntity(name: "test", color: CodableUIColor(uiColor: .red))]
    static var previews: some View {
        SwiftUIView(tags: $tags)
    }
}
