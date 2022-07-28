//
//  Notification.Name+.swift
//  note
//
//  Created by James on 2022/7/28.
//
import Foundation

public extension Notification.Name {
    /// added new note
    static let addedNewNote = Notification.Name("addedNewNote")
    /// change tag to note
    static let changedTagToNote = Notification.Name("changedTagToNote")
}
