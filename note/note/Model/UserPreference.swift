//
//  UserPreference.swift
//  note
//
//  Created by James on 2022/7/28.
//
import Foundation

struct UserPreference {
    private let iCloudDisabledKey = "iCloud_disabled"
    private let autoSaveDisabledKey = "autosave_disabled"
    private let infiniteScrollKey = "infinite_scroll_disabled"

    var enablediCloud: Bool {
        get {
            !UserDefaults.standard.bool(forKey: iCloudDisabledKey)
        }
        set {
            UserDefaults.standard.set(!newValue, forKey: iCloudDisabledKey)
        }
    }

    var enabledAutoSave: Bool {
        get {
            !UserDefaults.standard.bool(forKey: autoSaveDisabledKey)
        }
        set {
            UserDefaults.standard.set(!newValue, forKey: autoSaveDisabledKey)
        }
    }

    var enabledInfiniteScroll: Bool {
        get {
            !UserDefaults.standard.bool(forKey: infiniteScrollKey)
        }
        set {
            UserDefaults.standard.set(!newValue, forKey: infiniteScrollKey)
        }
    }

    var shouldGrantiCloud: Bool {
        guard enablediCloud else { return false }
        return FileManager.default.ubiquityIdentityToken == nil
    }
}
