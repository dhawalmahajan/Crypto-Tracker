//
//  HomeStatsView.swift
//  Crypto-Tracker
//
//  Created by Dhawal Mahajan on 09/02/24.
//

import SwiftUI

struct HomeStatsView: View {
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortolio: Bool
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticView(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,alignment: showPortolio ? .trailing : .leading)
    }
}

#Preview {
    HomeStatsView(showPortolio: .constant(false))
        .environmentObject(DeveloperPreview.instance.homeVM)
}
