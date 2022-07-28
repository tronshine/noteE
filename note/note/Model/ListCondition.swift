//
//  ListCondition.swift
//  note
//
//  Created by James on 2022/7/28.
//

import Foundation

struct ListCondition: Codable {
    enum SortBy: String, CaseIterable, Identifiable, Codable {
        case createdDate = "created date"
        case updatedDate = "updated date"

        var id: String { self.rawValue }
    }
    var sortBy: SortBy = .updatedDate

    enum SortOrder: String, CaseIterable, Identifiable, Codable {
        case ascending, descending

        var id: String { self.rawValue }
    }
    var sortOrder: SortOrder = .descending

    var filterBy = [TagEntity]()
}
