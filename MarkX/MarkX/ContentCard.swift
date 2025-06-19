//
//  ContentCard.swift
//  MarkX
//
//  Created by Dongyu Zhao on 6/18/25.
//

import SwiftUI

struct ContentCard: View {
    enum Line: Hashable {        
        case text(content: [RichText.Element])
        case canvas(content: String)
    }
    
    
    let title: String
    let content: [Line] = [
        .text(content: RichText.basic),
        .text(content: RichText.bilingualWithImages),
        .text(content: RichText.emojiParty),
        .text(content: RichText.failureCases),
        .text(content: RichText.longParagraph),
        .canvas(content: Canvas.weatherApplePark),
        .text(content: RichText.longParagraph),
        .canvas(content: Canvas.weatherDC),
        .text(content: RichText.longParagraph),
        .canvas(content: Canvas.weatherYosemite),
        .text(content: RichText.longParagraph),
        .canvas(content: Canvas.weatherMadison),
        .text(content: RichText.longParagraph),
        .canvas(content: Canvas.stockApple),
        .text(content: RichText.longParagraph),
        .canvas(content: Canvas.stockKO),
        .text(content: RichText.longParagraph),
        .canvas(content: Canvas.stockNVDA),
        .text(content: RichText.longParagraph),
        .canvas(content: Canvas.stockDelta),
        .text(content: RichText.longParagraph),
    ]
    var body: some View {
        RichText(content: [.text(title, format: .bold)])
        VStack(alignment: .leading) {
            ForEach(content, id: \.self) { line in
                switch line {
                case .text(let elements):
                    RichText(content: elements)
                case .canvas(let content):
                    Canvas(content: content)
                }
            }
        }
    }
}
