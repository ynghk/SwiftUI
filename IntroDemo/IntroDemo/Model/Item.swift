//
//  Item.swift
//  IntroDemo
//
//  Created by Yung Hak Lee on 5/4/25.
//

import SwiftUI

struct Item: Identifiable {
    var id: String = UUID().uuidString
    var image: String
    var title: String
    
    // Locations of each icons in the view
    var scale: CGFloat = 1
    var anchor: UnitPoint = .center
    var offset: CGFloat = 0
    var rotation: CGFloat = 0
    var zIndex: CGFloat = 0
}

let items: [Item] = [
    .init(
        image: "waveform.path.ecg.magnifyingglass",
        title: "아기의 울음소리를 분석하세요",
        scale: 1
    ),
    .init(
        image: "calendar.badge.plus",
        title: "육아일지 기록을 효율적으로 관리하세요",
        scale: 0.6,
        anchor: .topLeading,
        offset: -70,
        rotation: 30
    ),
    .init(
        image: "clock.fill",
        title: "아기의 활동 시간을 정확히 추적하세요",
        scale: 0.5,
        anchor: .bottomLeading,
        offset: -60,
        rotation: -35
    ),
    .init(
        image: "person.text.rectangle.fill",
        title: "아기의 프로필 카드를 간편하게 관리하세요",
        scale: 0.4,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 160
    ),
    .init(
        image: "microphone.fill",
        title: "두 손은 자유롭게, 음성인식 기능을 활용해보세요",
        scale: 0.35,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 250
    ),
]
