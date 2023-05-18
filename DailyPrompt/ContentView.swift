//
//  ContentView.swift
//  DailyPrompt
//
//  Created by Tony Short on 18/05/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var placeholder: String = "My Thoughts"
    @State var answerText: String = ""

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                Text("What impact do I hope to make in the world?")
                    .font(.headline)
                ZStack(alignment: .leading) {
                    TextEditor(text: $placeholder)
                        .disabled(true)
                    TextEditor(text: $answerText)
                        .opacity(answerText.isEmpty ? 0.7 : 1)
                }
                .cornerRadius(10)
                .padding(10)
                Spacer()
                Button {
                    UIPasteboard.general.string = answerText
                } label: {
                    Image(systemName: "doc.on.doc")
                        .padding()
                }
            }
            .padding()
            .navigationTitle("Daily Prompt")
            .background(Color(white: 0.8))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
