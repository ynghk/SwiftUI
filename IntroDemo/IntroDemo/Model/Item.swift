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
    
    var scale: CGFloat = 1
    var anchor: UnitPoint = .center
    var offset: CGFloat = 0
    var rotation: CGFloat = 0
    var zIndex: CGFloat = 0
}

let items: [Item] = [
    .init(
        image: "figure.walk.circle.fill",
        title: "Keep an eye on your workout",
        scale: 1
    ),
    .init(
        image: "figure.run.circle.fill",
        title: "Keep an eye on your workout",
        scale: 0.6,
        anchor: .topLeading,
        offset: -70,
        rotation: 30
    ),
    .init(
        image: "figure.badminton.circle.fill",
        title: "Keep an eye on your workout",
        scale: 0.5,
        anchor: .bottomLeading,
        offset: -60,
        rotation: -35
    ),
    .init(
        image: "figure.climnbing.circle.fill",
        title: "Keep an eye on your workout",
        scale: 0.4,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 160
    ),
    .init(
        image: "figure.cooldown.circle.fill",
        title: "Keep an eye on your workout",
        scale: 0.35,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 250
    ),
]
