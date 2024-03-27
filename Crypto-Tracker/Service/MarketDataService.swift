//
//  MarketDataService.swift
//  Crypto-Tracker
//
//  Created by Dhawal Mahajan on 12/02/24.
//

import Foundation
import Combine
class MarketDataService {
    @Published var marketData: MarketDataModel? = nil
    init() {
        getGlobalData()
    }
    
    var marketDataSubscription: AnyCancellable?
    private func getGlobalData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion,
             receiveValue: { [weak self] globaldata in
                self?.marketData = globaldata.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
