//
//  CircleButtonAnimationView.swift
//  Crypto-Tracker
//
//  Created by Dhawal Mahajan on 23/01/24.
//

import SwiftUI
struct CircleButtonAnimationView: View {
    @Binding var animate:Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 	5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeOut(duration: 1.0) : .none,value: 1)
    }
}

#Preview {
    CircleButtonAnimationView(animate: .constant(false))
        .frame(width: 100,height: 100)
}
