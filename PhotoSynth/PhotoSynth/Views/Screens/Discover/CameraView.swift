//
//  CameraView.swift
//  PhotoSynth
//
//  Created by Max Rogers on 7/1/23.
//

import SwiftUI

/// Wrapper view to allow user to open camera and take photo
struct CameraView: UIViewControllerRepresentable {
    
    @Environment(\.dismiss) var dismiss
    var sourceType: UIImagePickerController.SourceType = .camera
    @Binding var selectedImage: Image?

    /// UIImagePickerController configuration
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.cameraCaptureMode = .photo
        imagePicker.delegate = context.coordinator

        Logger.log(.action, "Displaying camera", sender: String(describing: self))
        
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) { }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    /// Coordinator to delegate calls from UIImagePickerControllerDelegate + UINavigationControllerDelegate
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

        var parent: CameraView

        init(parent: CameraView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            parent.dismiss()
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = Image(uiImage: image)
                Logger.log(.success, "Successfully took photo", sender: String(describing: self))
            } else {
                Logger.log(.error, "Error taking photo", sender: String(describing: self))
            }
        }

    }
}
