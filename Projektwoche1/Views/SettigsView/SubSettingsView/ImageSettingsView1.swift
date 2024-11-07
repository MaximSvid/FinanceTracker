//
//  ImageSettingsView1.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 07.11.24.
//

import SwiftUI
import PhotosUI
import SwiftData

struct ImageSettingsView1: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var userImages: [UserImage]
    
    @State private var newImage: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            
            if let selectedImage = selectedImage {
                selectedImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.gray.opacity(0.5), lineWidth: 2))
            } else {
                Image("ohneImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(.gray.opacity(0.5), lineWidth: 2))
            }
            
            
            
            PhotosPicker(selection: $newImage, matching: .images) {
                Text("Select an Image")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue)
            )
        }
        .onChange(of: newImage) {
            loadImage()
        }
        .onAppear {
            saveImage()
        }
    }
    
    private func loadImage() {
        Task {
            
            guard let imageData = try? await newImage?.loadTransferable(type: Data.self) else { return }
            if let uiImage = UIImage(data: imageData) {
                selectedImage = Image(uiImage: uiImage)
            }
            
            newImage = nil
        }
    }
    
    private func saveImage() {
        Task {
            guard let imageData = try? await newImage?.loadTransferable(type: Data.self) else { return }
            
            if let userImage = userImages.first {
                // Обновляем существующее изображение
                userImage.userImageData = imageData
                
                try modelContext.save()
            } else {
                // Создаем новое изображение, если оно не существует
                let newUserImage = UserImage(id: UUID(), userImageData: imageData)
                modelContext.insert(newUserImage)
                
                try modelContext.save()
            }
            
            if let uiImage = UIImage(data: imageData) {
                selectedImage = Image(uiImage: uiImage)
            }
            
            newImage = nil
        }
    }
}

#Preview {
    ImageSettingsView1()
}
