//
//  StatisticsCardView.swift
//  StretchyHeader
//
//  Created by Sri Vignesh on 18/8/20.
//

import SwiftUI

struct StatisticsCardView: View {
  
  var statCardModel: StatisticsCardModel
  
  var body: some View {
    ZStack {
      RoundedRectangle(cornerRadius: 12, style: .continuous)
        .fill(Color.white)
        .shadow(radius: 5)
      VStack(alignment: .leading, spacing: 25) {
      CardHeaderView(imageName: statCardModel.imageName,
                     title: statCardModel.title,
                     subTitle: statCardModel.subTitle)
        .padding(.top, 12)
      StatisticsRowView(contents: statCardModel.stats)
    }
    }
  }
}

struct StatisticsCardView_Previews: PreviewProvider {
    static var previews: some View {
      StatisticsCardView(statCardModel: StatisticsCardModel.init(imageName: "icHoleStat",
                                                                 title: "Hole Statistics",
                                                                 subTitle: "18 Hole Course",
                                                                 stats: [Statistics.init(name: "18 Hole Round", value: "89")]))
    }
}
