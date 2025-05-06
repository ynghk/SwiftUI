//
//  ContentView.swift
//  SendMoneyView
//
//  Created by Yung Hak Lee on 5/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 6) {
            Text("Send Money")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 5)
            
            VStack(spacing: 6) {
                Image(.masterball)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(.circle)
                
                Text("YNGHK")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .frame(maxHeight: .infinity)
            
            // Animated Text View
            HStack(spacing: 2) {
                
            }
            .frame(height: 50)
            .padding(.bottom, 30)
            
            //  Custom Keypad View
              CustomKeypad( )
        }
        .fontDesign(.rounded)
        .padding(15)
        .preferredColorScheme(.dark)
    }
    
    @ViewBuilder
    func CustomKeypad() -> some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 3)) {
            // 1-9 Button
            ForEach(1...9, id: \.self) { index in
                Button {
                    
                } label: {
                    Text("\(index)")
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .contentShape(.rect)
                }
            }
            
            Spacer()
            
            // 0 & Back Button
            ForEach(["0", "delete.backward.fill"], id: \.self) { string in
                Button {
                    
                } label: {
                    Group {
                        if string == "0" {
                            Text("0")
                        } else {
                            Image(systemName: string)
                        }
                    }
                        .font(.title2.bold())
                        .frame(maxWidth: .infinity)
                        .frame(height: 70)
                        .contentShape(.rect)
                }
            }
        }
        .buttonStyle(KeypadButtonStyle())
        .foregroundStyle(.white)
    }
}

#Preview {
    ContentView()
}

struct KeypadButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.gray.opacity(0.2))
                    .opacity(configuration.isPressed ? 1 : 0)
                    .padding(.horizontal, 5)
            }
            .animation(.easeInOut(duration: 0.25), value: configuration.isPressed)
    }
}
