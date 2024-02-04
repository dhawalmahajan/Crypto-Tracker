//
//  CoinImageViewModel.swift
//  Crypto-Tracker
//
//  Created by Dhawal Mahajan on 04/02/24.
//

import Foundation
import SwiftUI
import Combine
class CoinImageViewModel: ObservableObject {
    @Published var image:UIImage? = nil
    @Published var isLoading:Bool = false
    private let dataService: CoinImageService
    private let coin: CoinModel
    private var cancellables = Set<AnyCancellable>()
    init(coin:CoinModel) {
        self.coin = coin
        self.dataService = CoinImageService(coin: coin)
        addSubscribers()
        self.isLoading = true
    }
    private func addSubscribers() {
        dataService.$image
            .sink {[weak self] _ in
                self?.isLoading = false
            } receiveValue: {[weak self] image in
                self?.image = image
            }
            .store(in: &cancellables)
    }
}
