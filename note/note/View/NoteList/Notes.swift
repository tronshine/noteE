//
//  NotesGrid.swift
//  note
//
//  Created by James on 2022/7/28.
//
import SwiftUI



struct Notes: View {
    @State var show = false
    @State var show2 = false
    @ObservedObject var viewModel: NotesViewModel
    private var cancelButton: Alert.Button { .default(Text("Cancel")) }
    private var actionButton: Alert.Button {
        .destructive(
            Text(viewModel.isTargetDirectoryArchived ?  "Unarchived" : "Archived"),
            action: { viewModel.isTargetDirectoryArchived ? viewModel.allUnarchive() : viewModel.allArchive() }
        )
    }

    var body: some View {
        Group {
            if !viewModel.isLoaded {
                ProgressView()
                    .onAppear {
                        guard !viewModel.didFirstFetchRequest else { return }
                        viewModel.fetch()
                        viewModel.didFirstFetchRequest = true
                    }
            } else {
                if viewModel.publishedNoteDocuments.isEmpty {
                    Text("noteE为空")
                        .font(.custom("Chalkboard SE Regular",size:35))
                } else {
                    NotesScrollViewReader(documents: viewModel.publishedNoteDocuments,
                                          parent: self)
                }
            }
        }
        .statusBar(hidden: true)
        .toolbar {
            ToolbarItemGroup(placement: .navigation){
                if viewModel.isTargetDirectoryArchived == true {
                    
                } else {
                    Text("noteE")
                        .font(.custom("Chalkboard SE Regular",size:30))
                }
                
            }
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                if viewModel.isTargetDirectoryArchived == true {
                    
                } else {
                    Button{
                        show.toggle()
                    }label: {
                        Image(systemName: "gearshape").foregroundColor(Color.green)
                    }.popover(isPresented: $show, attachmentAnchor: .rect(.bounds), arrowEdge: .leading) {
                        SettingView()
                            .frame(minWidth: 300,minHeight:420)
                    }
                }
                if viewModel.isTargetDirectoryArchived == true {
                    
                } else {
                    Button(action: viewModel.toggleIsListConditionPopover,
                           label: { Image(systemName: "arrow.up.arrow.down.circle") }).popover(isPresented: $viewModel.isListConditionSheet) {
                        
                        NavigationView {
                            ListConditionSetting(listCondition: $viewModel.listCondition)
                                
                        }.frame(minWidth: 300,minHeight: 500)
                    }
                }
                if viewModel.isTargetDirectoryArchived == true {
                    
                } else {
                    Button(action: viewModel.update,
                           label: { Image(systemName: "purchased") })
                        .disabled(!viewModel.isLoaded)
                    Button(action: new) { Image(systemName: "plus.viewfinder") }
                }
            }
        }
        .navigationTitle(Text(viewModel.isTargetDirectoryArchived ? "废纸篓" : " ") )
        
        .fullScreenCover(isPresented: $viewModel.showCanvas) {
            NavigationView {
                Canvas(viewModel: CanvasViewModel())
            }
        }
        .sheet(isPresented: $viewModel.showActivityView) {
            viewModel.activityViewController
        }
        .alert(isPresented: $viewModel.showArchiveAlert) { () -> Alert in
            Alert(title: Text(
                            "Are you sure you want to " +
                            "\(viewModel.isTargetDirectoryArchived ? "unarchived" : "archived")" + " " +
                            "\(viewModel.publishedNoteDocuments.count) notes?"
                            ),
                  primaryButton: cancelButton,
                  secondaryButton: actionButton)
        }
    }

    func new() {
        viewModel.showCanvas = true
    }
}

// MARK: - NotesGridParent

extension Notes: NotesGridParent {
    func getTagToNote(document: NoteDocument) -> [TagEntity] {
        viewModel.getTagToNote(document: document)
    }

    func duplicate(_ document: NoteDocument) {
        viewModel.duplicate(document)
    }

    func archive(_ document: NoteDocument) {
        viewModel.archive(document)
    }

    func unarchive(_ document: NoteDocument) {
        viewModel.unarchive(document)
    }

    func delete(_ document: NoteDocument) {
        viewModel.delete(document)
    }

    func showActivityView(_ document: NoteDocument) {
        viewModel.share(document)
    }
}

struct Notes_Previews: PreviewProvider {
    static var previews: some View {
        Notes(viewModel: NotesViewModel(targetDirectory: .inbox))
    }
}
