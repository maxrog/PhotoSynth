//
//  DiscoverView.swift
//  PhotoSynth
//
//  Created by Max Rogers on 6/30/23.
//

import SwiftUI
import PhotosUI

/// View that allows for photo taking / editing to have plant identified
struct DiscoverView: View {
    
    @StateObject private var viewModel = DiscoverViewModel()
    
    var body: some View {
        VStack {
            viewModel.selectedImage?
                .resizable()
                .scaledToFit()
            Spacer()
            Button("Take Photo") {
                viewModel.showingCameraView = true
            }.buttonStyle(.bordered)
            Spacer()
            Button("Photo Library") {
                /*
                 TODO: iOS 17 embed the photoPicker
                 https://developer.apple.com/videos/play/wwdc2023/10107/
                 */
                viewModel.showingPhotoPicker = true
            }.buttonStyle(.bordered)
            Spacer()
        }
        .animation(.easeInOut, value: viewModel.selectedImage)
        .sheet(isPresented: $viewModel.showingCameraView) {
            CameraView(selectedImage: $viewModel.selectedImage)
        }
        .photosPicker(isPresented: $viewModel.showingPhotoPicker,
                      selection: $viewModel.selectedPhotoPickerItem,
                      photoLibrary: .shared())
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
