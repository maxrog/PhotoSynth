//
//  DiscoverViewModel.swift
//  PhotoSynth
//
//  Created by Max Rogers on 7/1/23.
//

import SwiftUI
import PhotosUI

/// View model to handle state of either taking photo from camera, or picking one from photo library
class DiscoverViewModel: ObservableObject {
    
    /// Whether the camera should be shown
    @Published var showingCameraView = false
    
    /// The image taken from camera or selected from photo picker
    @Published var selectedImage: Image?
    
    /// Whether the photo picker should be shown
    @Published var showingPhotoPicker = false
    
    /// The selected photo item from photo picker
    @Published var selectedPhotoPickerItem: PhotosPickerItem? {
        didSet {
            Task {
                await self.loadSelectedPhoto()
            }
        }
    }
    
    /// Loads the selected photo picker item and assigns our new image
    private func loadSelectedPhoto() async {
        selectedPhotoPickerItem?.loadTransferable(type: Image.self, completionHandler: { result in
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.selectedImage = image
                }
                Logger.log(.success, "Successfully picked photo", sender: String(describing: self))
            default:
                Logger.log(.error, "Error picking photo", sender: String(describing: self))
                break
            }
        })
    }
    
}
