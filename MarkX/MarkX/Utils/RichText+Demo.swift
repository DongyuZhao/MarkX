//
//  Demo.swift
//  MarkX
//
//  Created by Dongyu Zhao on 6/17/25.
//

import SwiftUI
import UIKit         // 仅用来生成示例图片数据

// MARK: - Test-data helper
extension RichText {

    // ---------- ❶ 基础示例 ----------

    static var basic: [RichText.Element] {
        [
            .text("Hello, ",      format: .bold),
            .text("world! ",      format: .italic),
            .media(makeSystemImageData(named: "globe"), alt: "🌐"),
            .link("https://apple.com")
        ]
    }

    // ---------- ❷ 中英混排 & 多张图 ----------

    static var bilingualWithImages: [RichText.Element] {
        [
            .text("SwiftUI 支持",    format: .boldItalic),
            .text(" 图文混排。",     format: .italic),
            .media(makeSystemImageData(named: "swift"), alt: "Swift Logo"),
            .text(" 看看这个蓝块→",  format: .bold),
            .media(makeSolidColorImageData(.systemBlue), alt: "🟦"),
            .text("（如失败显示占位） ", format: .italic),
            .media(Data(), alt: "❌ (invalid)"),
            .link("https://developer.apple.com/documentation/swiftui")
        ]
    }

    // ---------- ❸ Emoji & 彩色方块 ----------

    static var emojiParty: [RichText.Element] {
        [
            .text("🎉 Happy ",          format: .bold),
            .text("Emoji ",            format: .italic),
            .text("Party! ",           format: .boldItalic),
            .media(makeSolidColorImageData(.systemOrange), alt: "🟧"),
            .text("🔗 Tap me → ",       format: .bold),
            .link("https://emoji.gg"),
            .text(" 🥳",                format: .italic)
        ]
    }

    // ---------- ❹ 长段落 & 多链接 ----------

    static var longParagraph: [RichText.Element] {
        [
            .text("Here’s a longer paragraph showcasing ", format: .italic),
            .link("https://swift.org"),
            .text(" and ",                                   format: .italic),
            .link("https://www.rust-lang.org"),
            .text(". It demonstrates how multiple links can live in one text block. ",
                  format: .boldItalic),
            .text("Feel free to scroll and inspect wrapping.", format: .bold)
        ]
    }

    // ---------- ❺ 极简失败用例 ----------

    static var failureCases: [RichText.Element] {
        [
            .media(Data(), alt: "❌ Bad PNG "),
            .link("not a url"),
            .text(" ← 以上应回退显示。", format: .italic)
        ]
    }

    
    // ---------- 常用工具 ----------

    private static func makeSystemImageData(named systemName: String) -> Data {
        guard
            let img = UIImage(systemName: systemName),
            let data = img.pngData()
        else { fatalError("Failed to create PNG for \(systemName)") }
        return data
    }

    private static func makeSolidColorImageData(_ color: UIColor,
                                                size: CGSize = .init(width: 32, height: 32)) -> Data {
        UIGraphicsImageRenderer(size: size).pngData { ctx in
            color.setFill(); ctx.fill(.init(origin: .zero, size: size))
        }
    }
}
