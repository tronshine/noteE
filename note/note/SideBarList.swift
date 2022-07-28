//
//  note
//
//  Created by James on 2022/7/28.
//
import SwiftUI

struct SideBarList: View {
    @State private var showInbox = true
    @StateObject var inboxNoteViewModel = NotesViewModel(targetDirectory: .inbox)
    @StateObject var allNoteViewModel = NotesViewModel(targetDirectory: .all)
    @StateObject var archivedNoteViewModel = NotesViewModel(targetDirectory: .archived)

    var body: some View {
        List {
            Section(header: Text("Folder")) {
                NavigationLink(destination: Notes(viewModel: inboxNoteViewModel),
                               isActive: $showInbox) {
                    Label("Inbox", systemImage: "tray")
                }
                NavigationLink(destination: Notes(viewModel: allNoteViewModel)) {
                    Label("All", systemImage: "tray.full")
                }
                NavigationLink(destination: Notes(viewModel: archivedNoteViewModel)) {
                    Label("Trash", systemImage: "trash")
                }
            }
            Section(header: Text("Tag")) {
                NavigationLink(destination: TagList()) {
                    Label("Tag List", systemImage: "tag")
                }
            }
            Section(header: Text("Setting")) {
                NavigationLink(destination: SettingView()) {
                    Label("Setting", systemImage: "gearshape")
                }
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Pieces of Paper")
    }
}

struct SideBarList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(TargetPreviewDevice.allCases) { deviceName in
            SideBarList()
                .previewDevice(PreviewDevice(rawValue: deviceName.rawValue))
                .previewDisplayName(deviceName.rawValue)
        }
    }
}
