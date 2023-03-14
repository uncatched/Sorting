//
//  SortingViewModel.swift
//  Sorting
//
//  Created by Denys Litvinskyi on 14.03.2023.
//

import Foundation

final class SortingViewModel: ObservableObject {
    @Published private(set) var sorted: [Entry]
    @Published private(set) var swapped: [(from: Int, to: Int)] = []
    @Published private(set) var isSorted = false

    private var currentIndex = 0

    init(input: Input) {
        sorted = input.entries
    }

    func sortForward() {
        for i in 0..<sorted.count {
            if currentIndex >= sorted.count - i - 1 {
                currentIndex = 0
            }

            for j in currentIndex..<sorted.count - i - 1 {
                if sorted[j] > sorted[j + 1] {
                    sorted.swapAt(j + 1, j)
                    swapped.append((from: j + 1, to: j))
                    currentIndex = j + 1
                    return
                }
            }
        }

        isSorted = true
    }

    func sortBackward() {
        guard !swapped.isEmpty else { return }
        let last = swapped.removeLast()
        sorted.swapAt(last.to, last.from)
        currentIndex = last.to
        isSorted = false
    }
}
