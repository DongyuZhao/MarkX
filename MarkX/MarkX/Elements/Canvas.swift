//
//  Canvas.swift
//  MarkX
//
//  Created by Dongyu Zhao on 6/18/25.
//

import SwiftUI
import WebKit

/// A SwiftUI view that displays HTML content and sizes itself to the HTML's intrinsic height purely via SwiftUI layout mechanisms.
struct Canvas: View {
    /// Raw HTML content to render
    let content: String

    var body: some View {
        IntrinsicWebView(html: content)
            // Let SwiftUI size this view to its intrinsic content size vertically
            .fixedSize(horizontal: false, vertical: true)
    }
}

// MARK: - Intrinsic WebView

/// A subclass of WKWebView that reports its content size as its intrinsicContentSize.
private class IntrinsicWKWebView: WKWebView {
    // Observe scrollView contentSize to update intrinsicContentSize
    private var observerContext = 0

    override var intrinsicContentSize: CGSize {
        scrollView.contentSize
    }

    override init(frame: CGRect, configuration: WKWebViewConfiguration) {
        super.init(frame: frame, configuration: configuration)
        scrollView.isScrollEnabled = false
        scrollView.addObserver(self, forKeyPath: "contentSize", options: .new, context: &observerContext)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        scrollView.isScrollEnabled = false
        scrollView.addObserver(self, forKeyPath: "contentSize", options: .new, context: &observerContext)
    }

    deinit {
        scrollView.removeObserver(self, forKeyPath: "contentSize", context: &observerContext)
    }

    override func observeValue(
        forKeyPath keyPath: String?,
        of object: Any?,
        change: [NSKeyValueChangeKey : Any]?,
        context: UnsafeMutableRawPointer?
    ) {
        if context == &observerContext && keyPath == "contentSize" {
            invalidateIntrinsicContentSize()
        }
    }
}

/// A UIViewRepresentable wrapper for IntrinsicWKWebView
private struct IntrinsicWebView: UIViewRepresentable {
    let html: String

    func makeUIView(context: Context) -> IntrinsicWKWebView {
        let config = WKWebViewConfiguration()
        let webView = IntrinsicWKWebView(frame: .zero, configuration: config)
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.loadHTMLString(html, baseURL: nil)
        return webView
    }

    func updateUIView(_ uiView: IntrinsicWKWebView, context: Context) {
        uiView.loadHTMLString(html, baseURL: nil)
    }
}
