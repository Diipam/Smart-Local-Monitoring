//
//  MainTabbarView.swift
//  Smart Local Monitoring
//
//  Created by Deepam Dhakal on 16/07/2024.
//

import SwiftUI

struct MainTabbarView: View {

    @State private var activeTab: Tab = .home
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                Text("Notification")
                    .tag(Tab.notification)
//                    Hiding Native tab bar
                    .toolbar(.hidden, for: .tabBar)

                Text("Graph")
                    .tag(Tab.graph)
                    // Hiding Native tab bar
                    .toolbar(.hidden, for: .tabBar)

                Text("Home")
                    .tag(Tab.home)
                // Hiding Native tab bar
                .toolbar(.hidden, for: .tabBar)

                Text("Details")
                    .tag(Tab.details)
                // Hiding Native tab bar
                .toolbar(.hidden, for: .tabBar)

                Text("Settings")
                    .tag(Tab.settings)
                // Hiding Native tab bar
                .toolbar(.hidden, for: .tabBar)
            }

            customTabbar(tint: Color("Blue"), inactiveTint: .blue)
        }
    }

//    Custom Tabbar
//    with easy modificaion

    @ViewBuilder
    func customTabbar(tint: Color, inactiveTint: Color ) -> some View {
        HStack(spacing: 0) {
            ForEach(Tab.allCases, id: \.rawValue) {
                TabItem(
                    tint: tint,
                    inactiveTint: inactiveTint,
                    tab: $0,
                    activeTab: $activeTab
                )
            }
        }
        .padding(.horizontal, 15)
        .padding(.vertical, 10)
        .background(Color.white.shadow(radius: 2))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct TabItem: View {
    var tint: Color
    var inactiveTint: Color
    var tab: Tab
    @Binding var activeTab: Tab
    var body: some View {
        HStack() {
            Image(systemName: tab.systemImage)
                .font(.title2)
                .foregroundStyle(activeTab == tab ? .white : tint)
                // Increasing size for active state
                .frame(width: activeTab == tab ? 55: 35, height: activeTab == tab ? 55: 35)
                .background {
                    if activeTab == tab {
                        Circle()
                            .fill(tint.gradient)
//                            .overlay {
//                                Circle()
//                                    .stroke(tint, lineWidth: 2)
//                            }
//                            .shadow(color: tint.opacity(0.3), radius: 5, x: 0, y: 5)
                    }
                }
        }
        .frame(maxWidth: .infinity)
        .contentShape(Circle())
        .onTapGesture {
            activeTab = tab
        }

    }
}





#Preview {
    MainTabbarView()
}
