//
//  PortfolioView.swift
//  Crypto-Tracker
//
//  Created by Dhawal Mahajan on 27/03/24.
//

import SwiftUI

struct PortfolioView: View {
    @EnvironmentObject private var vm: HomeViewModel
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 0, content: {
                    SearchbarView(searchText: $vm.searchText)
                    ScrollView(.horizontal, showsIndicators:true) {
                        LazyHStack(spacing: 10, content: {
                            ForEach(vm.allCoins) { coin in
                                CoinLogoView(coin: coin)
                            }
                        }
                        )
                    }
                })
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            })
        }
    }
}

#Preview {
    PortfolioView()
        .environmentObject(DeveloperPreview.instance.homeVM)
}
