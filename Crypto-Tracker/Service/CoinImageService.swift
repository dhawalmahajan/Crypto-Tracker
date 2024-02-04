//
//  CoinImageService.swift
//  Crypto-Tracker
//
//  Created by Dhawal Mahajan on 04/02/24.
//

import Foundation
import SwiftUI
import Combine
class CoinImageService {
    private var imageSubscription: AnyCancellable?
    @Published var image: UIImage? = nil
    private let coin: CoinModel
    init(coin: CoinModel) {
        self.coin = coin
        getCoinImage()
    }
    private func getCoinImage() {
        guard let url = URL(string: coin.image) else { return }
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
             receiveValue: { [weak self] image in
                self?.image = image
                self?.imageSubscription?.cancel()
            })
    }
}
