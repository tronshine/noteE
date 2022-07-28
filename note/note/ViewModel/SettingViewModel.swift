//
//  SettingViewModel.swift
//  note
//
//  Created by James on 2022/7/28.
//

import Foundation

final class SettingViewModel: ObservableObject {
    var userPreference = UserPreference()

    @Published var enablediCloud: Bool {
        didSet {
            userPreference.enablediCloud = enablediCloud
            FilePath.makeDirectoryIfNeeded()
        }
    }

    @Published var enabledAutoSave: Bool {
        didSet {
            userPreference.enabledAutoSave = enabledAutoSave
        }
    }

    @Published var enabledInfiniteScroll: Bool {
        didSet {
            userPreference.enabledInfiniteScroll = enabledInfiniteScroll
        }
    }

    init() {
        enablediCloud = userPreference.enablediCloud
        enabledAutoSave = userPreference.enabledAutoSave
        enabledInfiniteScroll = userPreference.enabledInfiniteScroll
    }
}
