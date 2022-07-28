//
//  TagListViewModel.swift
//  note
//
//  Created by James on 2022/7/28.
//
import Foundation

final class TagListViewModel: ObservableObject {
    let tagModel = TagModel()
    @Published var tags: [TagEntity] {
        didSet {
            tagModel.save(tags: tags)
        }
    }

    init() {
        tags = tagModel.fetch()
    }

    func remove(indexSet: IndexSet) {
        tags.remove(atOffsets: indexSet)
    }
}
