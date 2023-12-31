//
//  CustomCarouselView.swift
//  recetasIOS
//
//  Created by Zorayda Yadira Gutierrez Montes - Ceiba Software on 21/12/23.
//

import SwiftUI

struct CustomCarouselView <Content: View, Item, ID>: View where Item: RandomAccessCollection, ID: Hashable, Item.Element: Equatable {
    var content: (Item.Element, CGSize) -> Content
    var id: KeyPath<Item.Element, ID>
    
    // MARK: View Properties
    @Binding var index: Int
    var items: Item
    var spacing: CGFloat
    var cardPadding: CGFloat
    
    // MARK: Gesture Properties
    @GestureState var translation: CGFloat = 0
    @SwiftUI.State var offset: CGFloat = 0
    @SwiftUI.State var lasStoredOffSet: CGFloat = 0
    
    @SwiftUI.State var currentIndex: Int = 0
    @SwiftUI.State var rotation: Double = 0
    
    init(index: Binding<Int>,
         items: Item,
         spacing: CGFloat = 30,
         cardPadding: CGFloat = 80,
         id: KeyPath<Item.Element, ID>,
         @ViewBuilder content: @escaping (Item.Element, CGSize) -> Content) {
        self._index = index
        self.items = items
        self.spacing = spacing
        self.cardPadding = cardPadding
        self.id = id
        self.content = content
    }
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            // MARK: Reduced after Applyin Card Spacing and Padding
            let cardWidth = size.width - (cardPadding - spacing)
            
            HStack(spacing: spacing) {
                ForEach(items, id: id) { movie in
                    let index = indexOff(item: movie)
                    content(movie, CGSize(width: size.width - cardPadding, height: size.height))
                        .rotationEffect(.init(degrees: Double(index * 5)), anchor: .bottom)
                        .rotationEffect(.init(degrees: rotation), anchor: .bottom)
                        .offset(y: offsetY(index: index, cardWidth: cardWidth))
                        .frame(width: size.width - cardPadding, height: size.height)
                        .contentShape(Rectangle())
                        .blur(radius: index == self.index ? 0 : 8)
                }
            }
            .padding(.horizontal, spacing)
            .offset(x: limitScroll())
            .contentShape(Rectangle())
            .gesture(
                DragGesture(minimumDistance: 5)
                    .updating($translation, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onChanged { onChanged(value: $0, cardWidth: cardWidth) }
                    .onEnded { onEnd(value: $0, cardWidth: cardWidth) }
            )
        }
        .padding(.top, 60)
        .onAppear {
            let extraSpace = (cardPadding / 2) - spacing
            offset = extraSpace
            lasStoredOffSet = extraSpace
        }
        .animation(.easeOut, value: translation == 0)
    }
    
    func limitScroll() -> CGFloat {
        let extraSpace = (cardPadding / 2) + spacing
        if index == 0 && offset > extraSpace {
            return extraSpace + (offset + 4)
        } else if index == items.count && translation < 0 {
            return offset - (translation + 2)
        }  else {
            return offset
        }
    }
    
    func onChanged(value: DragGesture.Value, cardWidth: CGFloat) {
        let translationX = value.translation.width
        offset = translationX + lasStoredOffSet
        
        // MARK: Calculatin rotation
        let progress = offset / cardWidth
        rotation = progress * 5
    }
    
    func onEnd(value: DragGesture.Value, cardWidth: CGFloat) {
        var _index = (offset / cardWidth).rounded()
        _index = max(-CGFloat(items.count - 1), _index)
        _index = min(_index, 0)
        currentIndex = Int(_index)
        
        index = -currentIndex
        withAnimation(.easeOut(duration: 0.1)) {
            // MARK: Removing Extra Space
            let extraSpace = (cardPadding / 2) - spacing
            offset = (cardWidth * _index) + extraSpace
            
            // MARK: Calculatin rotation
            let progress = offset / cardWidth
            rotation = (progress * 5).rounded() - 1
        }
        lasStoredOffSet = offset
    }
    
    func indexOff(item: Item.Element) -> Int {
        let array = Array(items)
        if let index = array.firstIndex(of: item) {
            return index
        }
        return 0
    }
    
    func offsetY(index: Int, cardWidth: CGFloat) -> CGFloat {
        let progress = ((translation < 0 ? translation : -translation) / cardWidth) * 80
        let yOffset = -progress < 60 ? progress: -(progress + 120)
        
        let previos = (index - 1) == self.index ? (translation < 0 ? yOffset : -yOffset) : 0
        let next = (index - 1) == self.index ? (translation < 0 ? -yOffset : yOffset) : 0
        let In_Between = (index - 1) == self.index ? previos : next
        
        return index == self.index ? -60 - yOffset : In_Between
    }
}
