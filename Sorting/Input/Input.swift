//
//  Input.swift
//  Sorting
//
//  Created by Denys Litvinskyi on 14.03.2023.
//

import Foundation

struct Input: Identifiable {
    let id = UUID()
    let entries: [Entry]
}

struct Entry: Identifiable, Comparable {
    static func < (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.value < rhs.value
    }

    static func > (lhs: Entry, rhs: Entry) -> Bool {
        return lhs.value > rhs.value
    }

    let id = UUID()
    let value: Int
}
