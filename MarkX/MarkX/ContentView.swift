//
//  ContentView.swift
//  MarkX
//
//  Created by Dongyu Zhao on 6/17/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LazyVStack(alignment: .leading) {
            RichText(content: RichText.basic)
            RichText(content: RichText.bilingualWithImages)
            RichText(content: RichText.emojiParty)
            RichText(content: RichText.failureCases)
            RichText(content: RichText.longParagraph)
        }
        .environment(\.openURL, OpenURLAction { url in
            print("Open Url:\(url)")
            return .handled
        })
        .padding()
    }
}

#Preview {
    ContentView()
}
