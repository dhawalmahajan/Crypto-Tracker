//
//  CoinDataService.swift
//  Crypto-Tracker
//
//  Created by Dhawal Mahajan on 31/01/24.
//

import Foundation
import Combine
class CoinDataService {
    @Published var allCoins: [CoinModel] = []
    init() {
        getCoins()
    }
    
    var coinSubscription: AnyCancellable?
    private func getCoins() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h") else { return }
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
             receiveValue: { [weak self] coins in
                self?.allCoins = coins
                self?.coinSubscription?.cancel()
            })
    }
}
