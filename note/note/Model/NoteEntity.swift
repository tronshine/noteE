//
//  NoteEntity.swift
//  note
//
//  Created by James on 2022/7/28.
//

import Foundation
import PencilKit

struct NoteEntity: Codable {
    var id = UUID()
    var drawing: PKDrawing
    var tags: [TagEntity]
    var createdDate: Date
    var updatedDate: Date

    init(drawing: PKDrawing,
         tags: [TagEntity] = [],
         createdDate: Date = Date(),
         updatedDate: Date = Date()) {
        self.drawing = drawing
        self.tags = tags
        self.createdDate = createdDate
        self.updatedDate = updatedDate
    }
}
