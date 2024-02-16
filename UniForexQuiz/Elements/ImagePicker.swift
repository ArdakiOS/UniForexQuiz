//
//  ImagePicker.swift
//  UniForexQuiz
//
//  Created by Ardak Tursunbayev on 16.02.2024.
//

import Foundation
import UIKit
import SwiftUI


struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var presentationMode

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
                // Save the image URL to UserDefaults
                if let imageUrl = saveImageToUserDefaults(uiImage) {
                    UserDefaults.standard.set(imageUrl.absoluteString, forKey: "imageUrl")
                }
            }

            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }

        func saveImageToUserDefaults(_ image: UIImage) -> URL? {
            let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let imageUrl = documentsDirectory.appendingPathComponent("savedImage.jpg")
            do {
                try image.jpegData(compressionQuality: 1.0)?.write(to: imageUrl)
                return imageUrl
            } catch {
                print("Error saving image: \(error.localizedDescription)")
                return nil
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = false
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
    }
}
