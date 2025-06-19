//
//  Media.swift
//  MarkX
//
//  Created by Dongyu Zhao on 6/18/25.
//

import SwiftUI

struct Media: View {
    let url: URL?

    var body: some View {
        AsyncImage(url: url) { phase in
            switch phase {
            case .empty:
                ShimmerView().frame(maxWidth: .infinity, maxHeight: .infinity)
            case .success(let image):
                image.resizable().scaledToFit()
            case .failure(_):
                Image(systemName: "photo").resizable().scaledToFit().foregroundStyle(.secondary)
            @unknown default:
                EmptyView()
            }
        }
    }
}


struct ShimmerView: View {
    @State private var animate: Bool = false

    var body: some View {
        GeometryReader { geo in
            let w = geo.size.width
            let h = geo.size.height
            // 渐变条：透明 → 半透明白 → 透明
            let shimmerGradient = LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: Color.white.opacity(0.0), location: 0.0),
                    .init(color: Color.white.opacity(0.6), location: 0.5),
                    .init(color: Color.white.opacity(0.0), location: 1.0),
                ]),
                startPoint: .top,
                endPoint: .bottom
            )

            Color.gray.opacity(0.3)
                .overlay(
                    shimmerGradient
                        .frame(width: w * 0.3, height: h)
                        .rotationEffect(.degrees(30))
                        // 从完全左侧开始，到完全右侧结束
                        .offset(x: animate ? w : -w * 0.3)
                )
                .onAppear {
                    withAnimation(
                        Animation.linear(duration: 1.2)
                                .repeatForever(autoreverses: false)
                    ) {
                        animate = true
                    }
                }
        }
        .clipped()
        .aspectRatio(4.0/3.0, contentMode: .fit)
    }
}
