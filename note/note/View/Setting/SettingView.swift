//
//  SettingView.swift
//  note
//
//  Created by James on 2022/7/28.
//
import SwiftUI

struct SettingView: View {
    @ObservedObject var viewModel = SettingViewModel()
    let repositoryUrl = URL(string: "https://github.com/0si43/PiecesOfPaper")
    let developerSiteUrl = URL(string: "https://www.shetommy.com/")
    @StateObject var archivedNoteViewModel = NotesViewModel(targetDirectory: .archived)

    var body: some View {
        NavigationView{
            List {
                Section(header: Text("设置")) {
                    Toggle(isOn: $viewModel.enablediCloud) {
                        Label("锁定", systemImage: viewModel.enablediCloud ? "lock.doc" : "lock.doc")
                    }
                    Toggle(isOn: $viewModel.enabledAutoSave) {
                        Label("自动保存", systemImage: "square.and.arrow.down")
                    }
                    Toggle(isOn: $viewModel.enabledInfiniteScroll) {
                        Label("无限滚动", systemImage: "pencil.line")
                    }
                    
                }
                Section(header: Text("列表")){
                    NavigationLink(destination: Notes(viewModel: archivedNoteViewModel)) {
                        Label("废纸篓", systemImage: "trash")
                    }
                    NavigationLink(destination: TagList()) {
                        Label("标签列表", systemImage: "tag")
                    }
                    NavigationLink(destination:info().background(Color(UIColor.secondarySystemBackground))){
                        Label("关于",systemImage: "info.circle")
                    }
                    
                }
                
            }
            .background(Color(UIColor.secondarySystemBackground))
            .navigationTitle("偏好")
            .navigationBarTitleDisplayMode(.inline)
//            .toolbar{
//                ToolbarItem(placement: .principal){
//                    Button{
//
//                    }label: {
//                        Text("noteE")
//                            .font(.custom("Chalkboard SE Regular",size:30))
//                    }
//                }
//            }
            .foregroundColor(.primary)
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
