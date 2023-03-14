//
//  SortingView.swift
//  Sorting
//
//  Created by Denys Litvinskyi on 14.03.2023.
//

import SwiftUI
import Charts

struct SortingView: View {
    @ObservedObject private(set) var viewModel: SortingViewModel

    var body: some View {
        VStack {
            content
            controls
        }
        .padding(.horizontal)
    }

    private var content: some View {
        Chart {
            ForEach(Array(viewModel.sorted.enumerated()), id: \.offset) { index, item in
                BarMark(
                    x: .value("Index", index),
                    y: .value("Item", item.value)
                )
            }
        }
    }

    private var controls: some View {
        HStack {
            Spacer()
            Button {
                viewModel.sortBackward()
            } label: {
                Image(systemName: "arrow.backward")
            }
            .disabled(viewModel.swapped.isEmpty)
            
            Spacer()
            
            Button {
                viewModel.sortForward()
            } label: {
                Image(systemName: "arrow.forward")
            }
            .disabled(viewModel.isSorted)
            
            Spacer()
        }
        .padding(.vertical)
    }
}

struct SortingView_Previews: PreviewProvider {
    static var previews: some View {
        SortingView(
            viewModel: SortingViewModel(
                input: Input(
                    entries: [2, 4, 1, 5, 6, 7, 8, 10].map(Entry.init)
                )
            )
        )
    }
}
