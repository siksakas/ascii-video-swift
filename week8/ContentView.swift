//
//  ContentView.swift
//  week8
//
//  Created by Siksaka Suriyasat on 10/28/26.
//


import SwiftUI

struct ContentView: View {
    @State private var ascii = ""

    var body: some View {
        ScrollView([.horizontal, .vertical]) {
            Text(ascii)
                .font(.system(
                    size: 5,
                    design: .monospaced
                ))
                .foregroundStyle(.green)
                .fixedSize()
                .padding()
        }
        .background(.black)
        .task {
            guard let image = UIImage(named: "testImage") else {
                return
            }

            ascii = ASCIIRenderer.convert(
                image: image,
                width: 128
            ) ?? ""
        }
    }
}

#Preview {
    ContentView()
}
