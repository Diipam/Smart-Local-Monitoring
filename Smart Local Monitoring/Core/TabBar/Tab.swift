//
//  TabModel.swift
//  Smart Local Monitoring
//
//  Created by Deepam Dhakal on 16/07/2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case notification, graph, home, details, settings


    var systemImage: String {
        switch self {
        case .notification:
            return "bell.badge"
        case .graph:
            return "chart.line.uptrend.xyaxis.circle"
        case .home:
            return "house"
        case .details:
            return "line.3.horizontal.button.angledtop.vertical.right"
        case .settings:
            return "gearshape.fill"

        }
    }

    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
