//
//  TargetPreviewDevice.swift
//  note
//
//  Created by James on 2022/7/28.
//

import Foundation

enum TargetPreviewDevice: String, Identifiable, CaseIterable {
    var id: String { rawValue }

    case iPhone13Pro = "iPhone 13 Pro"
    case iPadPro5th = "iPad Pro (12.9-inch) (5th generation)"
}
