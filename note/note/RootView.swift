//
//  RootView.swift
//  note
//
//  Created by James on 2022/7/28.
//

import SwiftUI

struct RootView: View {
    @StateObject var viewModel = AppViewModel()
    @StateObject var canvasViewModel = CanvasViewModel()
    @StateObject var inboxNoteViewModel = NotesViewModel(targetDirectory: .inbox)

    private var useICloudButton: Alert.Button {
        .default(Text("Use iCloud"), action: viewModel.openSettingApp)
    }

    private var useDeviceButton: Alert.Button {
        .default(Text("Use device storage"), action: viewModel.switchDeviceStorage)
    }

    var body: some View {
        NavigationView {
//            NavigationLink(destination: Notes(viewModel: inboxNoteViewModel),
//                           isActive: $showInbox)
//            Spacer()
            Notes(viewModel: inboxNoteViewModel)
                
        }
        .background(Color(UIColor.secondarySystemBackground))
        .ignoresSafeArea(.all)
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $viewModel.showCanvas) {
            NavigationView {
                Canvas(viewModel: CanvasViewModel())
            }
        }
        .sheet(isPresented: $viewModel.isShowTagList,
               onDismiss: {
               TagListRouter.shared.documentForPass = nil
               }, content: {
                   TagListToNote()
               })
        .onAppear {
            TagListRouter.shared.bind(isShowTagList: $viewModel.isShowTagList)
            viewModel.hasDrawingPlist = DrawingsPlistConverter.hasDrawingsPlist
            DrawingsPlistConverter.convert()

            guard !UserPreference().shouldGrantiCloud else {
                viewModel.iCloudDenying = true
                return
            }

            viewModel.showCanvas = false
        }
        .alert(isPresented: $viewModel.iCloudDenying) { () -> Alert in
            Alert(title: Text(viewModel.iCloudDeniedWarningMessage),
                  primaryButton: useICloudButton,
                  secondaryButton: useDeviceButton)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
