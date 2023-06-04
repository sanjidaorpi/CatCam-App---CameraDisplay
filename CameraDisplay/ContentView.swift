//
//  ContentView.swift
//  CameraDisplay
//  Created by Sanjida Orpi.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var isImagePickerShowing = false
    @State private var selectedImage: UIImage?

    var body: some View {
        VStack {
            Text("Welcome to CatCam")
                .font(.largeTitle)
                .padding()
            
            if let image = selectedImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
            } else {
                Image("CatCam")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
            }

            Text("Set A Profile Picture")
                .padding()
            
            Button("Choose from camera roll") {
                isImagePickerShowing = true
            }
        }
        .sheet(isPresented: $isImagePickerShowing) {
            ImagePicker(isImagePickerShowing: $isImagePickerShowing, selectedImage: $selectedImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
