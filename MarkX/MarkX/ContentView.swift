//
//  ContentView.swift
//  MarkX
//
//  Created by Dongyu Zhao on 6/17/25.
//

import SwiftUI

struct ContentView: View {
    let content = ["Message 1", "Message 2", "Message 3"]
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                ForEach(content, id: \.self) { message in
                    ContentCard(title: message)
                }
            }
            .environment(
                \.openURL,
                OpenURLAction { url in
                    print("Open Url:\(url)")
                    return .handled
                }
            )
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
