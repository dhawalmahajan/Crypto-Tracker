//
//  HomeViewModel.swift
//  Crypto-Tracker
//
//  Created by Dhawal Mahajan on 31/01/24.
//

import Foundation
import Combine
class HomeViewModel:ObservableObject {
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    @Published var searchText: String = ""
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self]coin in
                self?.allCoins = coin
            }
            .store(in: &cancellables)
    }
}
