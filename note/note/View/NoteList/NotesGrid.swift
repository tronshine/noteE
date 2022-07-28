//
//  NotesGrid.swift
//  note
//
//  Created by James on 2022/7/28.
//
import SwiftUI
import PencilKit

protocol NotesGridParent {
    func getTagToNote(document: NoteDocument) -> [TagEntity]
    func duplicate(_ document: NoteDocument)
    func archive(_ document: NoteDocument)
    func unarchive(_ document: NoteDocument)
    func delete(_ document: NoteDocument)
    func showActivityView(_ document: NoteDocument)

}

struct NotesGrid: View {
    @State var documentToShare: NoteDocument?
    var documents: [NoteDocument]
    var parent: NotesGridParent
    let gridItem = GridItem(.adaptive(minimum: 250), spacing: 5)

    var body: some View {
        LazyVGrid(columns: [gridItem],spacing: 100) {
            ForEach((0..<documents.endIndex), id: \.self) { index in
                HStack{
                    VStack {
                        ZStack{
                            NoteImage(document: documents[index])
                            .contextMenu {
                                
                                Button(action: { share(noteDocument: documents[index]) },
                                       label: { Label("分享", systemImage: "square.and.arrow.up") })
                                Button(
                                    action: {
                                        TagListRouter.shared.showTagList(noteDocument: documents[index])
                                    },
                                    label: { Label("标签", systemImage: "tag") })
                                if documents[index].isArchived {
                                        Button(
                                            action: { unarchive(noteDocument: documents[index]) },
                                            label: { Label("放回原处", systemImage: "square.and.arrow.down.on.square.fill") })
                                        if #available(iOS 15.0, *) {
                                            Button(role: .destructive) {
                                                delete(noteDocument: documents[index])
                                            } label: {
                                                Label("彻底删除", systemImage: "trash")
                                            }
                                        }
                                } else {
                                    Button(role: .destructive) {
                                        archive(noteDocument: documents[index])
                                    } label: {
                                        Image(systemName: "trash")
                                        Text("移动到废纸篓").foregroundColor(Color.red)
                                        
                                    }

                                }
                            }
                            TagHStack(tags: parent.getTagToNote(document: documents[index]))
                                .clipShape(RoundedRectangle(cornerRadius: 12))
                                .frame(width:100,height: 20)
                                .frame(width:190,height:225,alignment: .bottomLeading)
//                                .padding(.bottmle)
                            
                            
                        }
                        
                    }
                }
                
            }
        }
    }

    func duplicate(noteDocument: NoteDocument) {
        parent.duplicate(noteDocument)
    }

    func archive(noteDocument: NoteDocument) {
        parent.archive(noteDocument)
    }

    func unarchive(noteDocument: NoteDocument) {
        parent.unarchive(noteDocument)
    }

    func delete(noteDocument: NoteDocument) {
        parent.delete(noteDocument)
    }

    func share(noteDocument: NoteDocument) {
        parent.showActivityView(noteDocument)
    }
}

 struct NotesGrid_Previews: PreviewProvider {
     static var parent = Notes(viewModel: NotesViewModel(targetDirectory: .inbox))
     static var array = Array(repeating: NoteDocument.createTestData(), count: 9)
     static var previews: some View {
         NotesGrid(documents: array, parent: parent)
    }
 }
