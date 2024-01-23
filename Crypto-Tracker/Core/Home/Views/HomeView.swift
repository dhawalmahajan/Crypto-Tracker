//
//  HomeView.swift
//  Crypto-Tracker
//
//  Created by Dhawal Mahajan on 23/01/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio: Bool = false
    var body: some View {
        ZStack {
            Color.theme.background
                .ignoresSafeArea()
            VStack {
                homeHeader
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_preview: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView {
    private var homeHeader: some View {
        HStack {
            
                CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .background(CircleButtonAnimationView(animate: $showPortfolio))
            Spacer()
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}
