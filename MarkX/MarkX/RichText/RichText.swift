//
//  RichText.swift
//  MarkX
//
//  Created by Dongyu Zhao on 6/17/25.
//

import SwiftUI

struct RichText: View {
    enum Element: Identifiable {
        enum Format {
            case bold
            case italic
            case boldItalic
        }

        case text(_ content: String, format: Format)
        case link(_ url: String)
        case media(_ data: Data, alt: String)
        
        var id: String {
            switch self {
            case let .text(content, _):
                content
            case let .link(url):
                url
            case let .media(data, _):
                String(data: data, encoding: .utf8) ?? UUID().uuidString
            }
        }
    }
    
    let content: [Element]

    var body: some View {
        content.reduce(Text("")) { partial, element in
            partial + chunk(for: element)
        }
    }

    // 把单个 Element 转成 Text。关键在 .media 分支 ➜ Text(Image(uiImage:))
    private func chunk(for element: Element) -> Text {
        switch element {

        case let .text(string, fmt):
            switch fmt {
            case .bold:       return Text(string).bold()
            case .italic:     return Text(string).italic()
            case .boldItalic: return Text(string).bold().italic()
            }

        case let .link(urlString):
            if let url = URL(string: urlString) {
                // 用 AttributedString 设置 link 属性，这样点击可跳转
                var attr = AttributedString(url.absoluteString)
                attr.link = url
                return Text(attr)
            } else {
                // 无效 URL：纯文本提示
                return Text(urlString).foregroundStyle(.red)
            }

        case let .media(data, alt):
            if let uiImage = UIImage(data: data) {
                // 关键：把 Image 包成 Text(Image)
                return Text(Image(uiImage: uiImage))
            } else {
                // 解码失败时 fallback 到替代文字
                return Text(alt).italic().foregroundStyle(.secondary)
            }
        }
    }
}
