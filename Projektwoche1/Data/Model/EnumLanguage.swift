//
//  EnumLanguage.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 07.11.24.
//

enum Language: String, CaseIterable, Identifiable {
    case english, russian, belarusian, germany, francais, italian, spanish, dutch, portuguese
    var id: Self { self }
}
