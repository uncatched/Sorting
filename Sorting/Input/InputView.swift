//
//  InputView.swift
//  Sorting
//
//  Created by Denys Litvinskyi on 14.03.2023.
//

import SwiftUI

struct InputView: View {
    @State private var text = ""
    @State private var input: Input?

    var body: some View {
        VStack {
            HStack {
                Text("Input (Comma-separated integers):")
                Spacer()
            }
            .padding(.horizontal)

            TextEditor(text: $text)
                .border(.black)
                .padding(.horizontal)

            Button("GO") {
                input = inputList()
            }
            .padding(.vertical)
        }
        .sheet(item: $input) { input in
            SortingView(
                viewModel: SortingViewModel(input: input)
            )
        }
    }

    private func inputList() -> Input {
        return Input(
            entries: text
                .compactMap{ $0.wholeNumberValue }
                .map(Entry.init)
        )
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}


