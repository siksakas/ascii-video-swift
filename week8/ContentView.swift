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
                .frame(height: 300)
                .clipped()
                .onAppear { model.start() }
            
            Text(ascii)
                .font(.system(
                    size: 5,
                    design: .monospaced
                ))
                .foregroundStyle(.white)
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

//struct ContentView: View {
//  @State var model = CameraModel()
//    @State private var ascii = ""
//
//  var body: some View {
//      Text("what")
//  }
//}

#Preview {
    ContentView()
}
