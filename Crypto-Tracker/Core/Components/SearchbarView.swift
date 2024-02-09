//
//  SearchbarView.swift
//  Crypto-Tracker
//
//  Created by Dhawal Mahajan on 05/02/24.
//

import SwiftUI

struct SearchbarView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty ? Color.theme.secondaryText : Color.theme.accent)
            TextField("Search by name or symbol", text: $searchText)
                .foregroundColor(Color.theme.accent)
                .disableAutocorrection(true)
                .overlay(alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(Color.theme.accent)
                        .opacity(searchText.isEmpty ? 0.0 :1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                }
                
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .shadow(color: Color.theme.accent.opacity(0.15), radius: 10,x: 0,y: 0)
        )
        .padding()
    }
}
@available(iOS 17, *)
#Preview(traits: .sizeThatFitsLayout){
    SearchbarView(searchText: .constant(""))
}
