//
//  ContentView.swift
//  note
//
//  Created by James on 2022/7/28.
//

import SwiftUI

struct ContentView: View {
    @StateObject var inboxNoteViewModel = NotesViewModel(targetDirectory: .inbox)
    var body: some View {
        Notes(viewModel: NotesViewModel(targetDirectory: .inbox))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
