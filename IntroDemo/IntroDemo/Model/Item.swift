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
        title: "Analzye the crying of your baby",
        scale: 1
    ),
    .init(
        image: "calendar.badge.plus",
        title: "Manage your babysitting schedule effectively",
        scale: 0.6,
        anchor: .topLeading,
        offset: -70,
        rotation: 30
    ),
    .init(
        image: "clock.fill",
        title: "Keep track of your baby's activity time",
        scale: 0.5,
        anchor: .bottomLeading,
        offset: -60,
        rotation: -35
    ),
    .init(
        image: "person.text.rectangle.fill",
        title: "Manage your baby's profile cards",
        scale: 0.4,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 160
    ),
    .init(
        image: "microphone.fill",
        title: "Touchfree voice control",
        scale: 0.35,
        anchor: .bottomLeading,
        offset: -50,
        rotation: 250
    ),
]
