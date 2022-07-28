//
//  AppViewModel.swift
//  note
//
//  Created by James on 2022/7/28.
//

import UIKit

final class AppViewModel: ObservableObject {
    @Published var showCanvas = false
    @Published var isShowTagList = false
    @Published var iCloudDenying = false
    @Published var showOnboarding = false
    var hasDrawingPlist = false
    let iCloudDeniedWarningMessage = "The app could not access your iCloud Drive. You should change setting"

    func openSettingApp() {
        guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
        UIApplication.shared.open(url)
    }

    func switchDeviceStorage() {
        var userPreference = UserPreference()
        userPreference.enablediCloud = false
    }
}
