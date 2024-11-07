//
//  CustomProgressViewStyle.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 07.11.24.
//

//import SwiftUI
//
//struct CustomProgressViewStyle: ProgressViewStyle {
//    var strokeColor: Color
//    var strokeWidth: CGFloat
//
//    func makeBody(configuration: Configuration) -> some View {
//        let fractionCompleted = configuration.fractionCompleted ?? 0
//
//        return GeometryReader { geometry in
//            ZStack(alignment: .leading) {
//                Rectangle()
//                    .foregroundColor(Color.gray.opacity(0.3))
//                    .frame(height: geometry.size.height)
//
//                Rectangle()
//                    .foregroundColor(strokeColor)
//                    .frame(width: geometry.size.width * fractionCompleted, height: geometry.size.height)
//            }
//            .cornerRadius(5)
//        }
//        .frame(height: strokeWidth)
//    }
//}
//
//#Preview {
////    CustomProgressViewStyle()
//}
