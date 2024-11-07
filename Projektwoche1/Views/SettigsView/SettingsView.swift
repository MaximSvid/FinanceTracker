//
//  SettingsView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI
import SwiftData


struct SettingsView: View {
  @AppStorage("username")
  private var username: String = ""
  @AppStorage("email")
  private var email: String = ""
  @AppStorage("location")
  private var location: String = ""
  @AppStorage("bday")
  private var bday: Date = Date()
  @AppStorage("image")
  private var image: String = "Download" // Standardbild
  @State private var isImagePickerPresented = false
  @State private var selectedImage: UIImage?
   @AppStorage("isDarkModeEnabled")
  private var isDarkModeEnabled: Bool = false
  @AppStorage("isAirplaneModeEnabled")
  private var isAirplaneModeEnabled: Bool = false
  @AppStorage("isWLANEnabled")
  private var isWLANEnabled: Bool = false
  @AppStorage("isBluetoothEnabled")
  private var isBluetoothEnabled: Bool = false
  @Environment(\.colorScheme) var colorScheme
  var body: some View {
    VStack {
      Text("Settings")
        .font(.title)
//      Image(uiImage: selectedImage ?? UIImage(named: image) ?? UIImage(named: "Download")!)
//        .resizable()
//        .frame(width: 100, height: 100)
//        .clipShape(Circle()) // Kreisform
//        .padding()
//        .onTapGesture {
//          isImagePickerPresented = true // Öffne den ImagePicker
//        }
      ScrollView {
        HStack {
          Text("User Name")
          Spacer()
        }
        .padding(.bottom, 5) // Reduziertes Padding
        TextField("User Name", text: $username)
          .padding()
          .textFieldStyle(.plain)
          .background(Color.white)
          .cornerRadius(8)
          .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 4)
          .padding(.bottom)
        HStack {
          Text("Email")
          Spacer()
        }
        .padding(.bottom, 5) // Reduziertes Padding
        TextField("Email", text: $email)
          .padding()
          .textFieldStyle(.plain)
          .background(Color.white)
          .cornerRadius(8)
          .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 4)
          .padding(.bottom)
        HStack {
          Text("Location")
          Spacer()
        }
        .padding(.bottom, 5) // Reduziertes Padding
        TextField("Location", text: $location)
          .padding()
          .textFieldStyle(.plain)
          .background(Color.white)
          .cornerRadius(8)
          .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 4)
          .padding(.bottom)
        Spacer()
          
          
        DatePicker("Birthday", selection: $bday, displayedComponents: [.date])
          .datePickerStyle(CompactDatePickerStyle())
          .padding()
        Divider()
        Toggle("WLAN", isOn: $isWLANEnabled)
          .padding(.leading)
          .padding(.trailing)
        Divider()
          
        Toggle("Dark Mode", isOn: $isDarkModeEnabled)
           .padding()
          
        Toggle("Airplane Mode", isOn: $isAirplaneModeEnabled)
          .padding()
        Toggle("Bluetooth", isOn: $isBluetoothEnabled)
          .padding()
          
        HStack {
          Spacer()
        }
        .padding(.leading)
        .padding(.trailing)
        Spacer()
      }
      .padding()
       .preferredColorScheme(isDarkModeEnabled ? .dark : .light)
        .sheet(isPresented: $isImagePickerPresented) {
//        ImagePicker(selectedImage: $selectedImage, isPresented: $isImagePickerPresented, image: $image)
      }
    }
  }
}


//import SwiftUI
//struct ImagePicker: UIViewControllerRepresentable {
//  @Binding var selectedImage: UIImage? // Binding-Variable für das ausgewählte Bild
//  @Binding var isPresented: Bool // Binding-Variable, um den Zustand des ImagePicker zu steuern
//  @Binding var image: String // Binding-Variable für das Bild in @AppStorage
//  // Coordinator-Klasse, die die Delegate-Methoden des UIImagePickerController implementiert
//  class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//    var parent: ImagePicker // Referenz auf die übergeordnete ImagePicker-Instanz
//    init(parent: ImagePicker) {
//      self.parent = parent // Initialisierung der Referenz auf die übergeordnete ImagePicker-Instanz
//    }
//    // Delegate-Methode, die aufgerufen wird, wenn ein Bild ausgewählt wurde
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//      if let uiImage = info[.originalImage] as? UIImage {
//        parent.selectedImage = uiImage // Speichere das ausgewählte Bild in der Binding-Variable
//        if let imageData = uiImage.jpegData(compressionQuality: 1.0) {
//          let base64String = imageData.base64EncodedString()
//          parent.image = base64String // Speichere das Bild als Base64-String in @AppStorage
//        }
//      }
//      parent.isPresented = false // Schließe den ImagePicker
//    }
//    // Delegate-Methode, die aufgerufen wird, wenn der ImagePicker abgebrochen wurde
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//      parent.isPresented = false // Schließe den ImagePicker
//    }
//  }
//  // Methode, die den Coordinator erstellt
//  func makeCoordinator() -> Coordinator {
//    Coordinator(parent: self)
//    // Erzeuge eine Instanz des Coordinator und übergib die übergeordnete ImagePicker-Instanz
//  }
//  // Methode, die den UIImagePickerController erstellt und konfiguriert
//  func makeUIViewController(context: Context) -> UIImagePickerController {
//    let picker = UIImagePickerController() // Erzeuge eine Instanz des UIImagePickerController
//    picker.delegate = context.coordinator // Setze den Delegate auf den Coordinator
//    return picker // Gib den konfigurierten UIImagePickerController zurück
//  }
//  // Methode, die aufgerufen wird, wenn der UIImagePickerController aktualisiert wird
//  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
//}
#Preview {
  SettingsView()
}
