//
//  ContentView.swift
//  week8
//
//  Created by Siksaka Suriyasat on 10/28/26.
//


import SwiftUI

struct ContentView: View {
    @State private var ascii = ""
    @State var model = CameraModel()

    var body: some View {
        VStack {
            FrameView(image: model.previewImage)
                .edgesIgnoringSafeArea(.all)
                .onAppear { model.start() }
                .frame(height: 300)
            
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

//// MARK: - Screen
//
//struct ContentView: View {
//  @State var model = CameraModel()
//
//  var body: some View {
//    FrameView(image: model.previewImage)
//      .edgesIgnoringSafeArea(.all)
//      .onAppear { model.start() }
//  }
//}

#Preview {
    ContentView()
}
