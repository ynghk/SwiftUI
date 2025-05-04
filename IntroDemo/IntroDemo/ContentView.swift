//
//  ContentView.swift
//  IntroDemo
//
//  Created by Yung Hak Lee on 5/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedItem: Item = items.first!
    @State private var introItems: [Item] = items
    @State private var activeIndex: Int = 0
    var body: some View {
        VStack(spacing: 0) {
            // Back Button
            Button {
                updateItem(isForward: false)
            } label: {
                Image(systemName: "chevron.left")
                    .font(.title3.bold())
                    .foregroundStyle(.indigo.gradient)
                    .contentShape(.rect)
            }
            .padding(15)
            .frame(maxWidth: .infinity, alignment: .leading)
            // Only visible from second item
            .opacity(selectedItem.id != introItems.first?.id ? 1 : 0)
            ZStack {
                // Animated Icons
                ForEach(introItems) { item in
                    AnimatedIconView(item)
                }
            }
            .frame(height: 250)
            .frame(maxHeight: .infinity)
        }
        VStack(spacing: 6) {
            // Progress Indicator View
            HStack(spacing: 4) {
                ForEach(introItems) { item in
                    Capsule()
                        .fill(selectedItem.id == item.id ? Color.primary : .gray)
                        .frame(width: selectedItem.id == item.id ? 25:4, height: 4)
                }
            }
            .padding(.bottom, 15)
            
            Text(selectedItem.title)
                .font(.title.bold())
                .contentTransition(.numericText())
            
            // Description
            Text("우리는 죠습니다")
                .font(.caption2)
                .foregroundStyle(.gray)
            
            // Next/continue Button
            Button {
                updateItem(isForward: true)
            } label: {
                Text(selectedItem.id == introItems.last!.id ? "Continue" : "Next")
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 250)
                    .padding(.vertical, 12)
                    .background(.indigo.gradient, in: .capsule)
            }
            .padding(.top, 25)
        }
        .multilineTextAlignment(.center)
        .frame(width: 300)
        .frame(maxHeight: .infinity)
    }
    
    @ViewBuilder
    func AnimatedIconView(_ item: Item) -> some View {
        let isSelected = selectedItem.id == item.id
        
        Image(systemName: item.image)
            .font(.system(size: 80))
            .foregroundStyle(.white.shadow(.drop(radius: 10)))
            .blendMode(.overlay)
            .frame(width: 120, height: 120)
            .background(.indigo.gradient, in: .rect(cornerRadius: 32))
            .background {
                RoundedRectangle(cornerRadius: 35)
                    .fill(.background)
                    .shadow(color: .primary.opacity(0.2), radius: 1, x: 1, y: 1)
                    .shadow(color: .primary.opacity(0.2), radius: 1, x: -1, y: -1)
                    .padding(-3)
                    .opacity(selectedItem.id == item.id ? 1 : 0)
            }
        
        // Reset Location
            .rotationEffect(.init(degrees: -item.rotation))
            .scaleEffect(isSelected ? 1.1 : item.scale, anchor: item.anchor)
            .offset(x: item.offset)
            .rotationEffect(.init(degrees: item.rotation))
        
        // Placing active icon at the top
            .zIndex(isSelected ? 2 : item.zIndex)
    }
    
    func updateItem(isForward: Bool) {
        guard isForward ? activeIndex != introItems.count - 1 : activeIndex != 0 else { return }
        var fromIndex: Int = 0
        
        // To index
        if isForward {
            activeIndex += 1
        } else {
            activeIndex -= 1
        }
        //From index
        if isForward {
            fromIndex = activeIndex - 1
        } else {
            fromIndex = activeIndex + 1
        }
        
        // Shifting from and to icon locations
        withAnimation(.bouncy(duration: 1)) {
            introItems[fromIndex].scale = introItems[activeIndex].scale
            introItems[fromIndex].rotation = introItems[activeIndex].rotation
            introItems[fromIndex].anchor = introItems[activeIndex].anchor
            introItems[fromIndex].offset = introItems[activeIndex].offset
            
            // To location is always at the center
            introItems[activeIndex].scale = 1
            introItems[activeIndex].rotation = .zero
            introItems[activeIndex].anchor = .center
            introItems[activeIndex].offset = .zero
            
            // Updating Selected Item
            selectedItem = introItems[activeIndex]
        }
    }
}

#Preview {
    ContentView()
}
