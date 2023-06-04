//
//  ContentView.swift
//  CameraDisplay
//  Created by Sanjida Orpi.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("Welcome to CatCam, the social media app for cat pics!")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundColor(Color.pink.opacity(0.5))
                    .padding(.horizontal, 20)
                    .padding(.vertical)
                
                Image(uiImage: image ?? UIImage(named: "pusheenpic")!)
                    .resizable()
                    .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                    
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(Color.pink.opacity(0.5))
                    .frame(width: 200, height: 44)
                    .overlay(
                Button("Set Profile Picture") {
                    self.showSheet = true
                })
                .padding()
                
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Choose Photo"), buttons: [
                            .default(Text("Photo Library")) {
                                self.showImagePicker = true
                                self.sourceType = .photoLibrary
                            },
                            .cancel()
                        ])
                }
            }
            .navigationBarTitle("CatCam")
        
            
        }.sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
