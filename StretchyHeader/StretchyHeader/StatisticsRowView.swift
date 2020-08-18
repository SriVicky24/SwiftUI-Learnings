//
//  StatisticsRowView.swift
//  StretchyHeader
//
//  Created by Sri Vignesh on 18/8/20.
//

import SwiftUI

struct StatisticsRowView: View {
  
  var contents : [Statistics]
  
  var body: some View {
    VStack {
      ForEach(contents){ stat in
        VStack(spacing:0) {
          HStack {
            Text(stat.name)
              .font(.subheadline)
            Spacer()
            Text(stat.value)
              .font(.title2)
              .fontWeight(.semibold)
          }
          .frame(height:40)
          .padding(.vertical, 5)
          .padding(.horizontal, 12)
         Divider()
          .padding(.horizontal, 12)
        }
      }
    }
  }
}

struct StatisticsRowView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsRowView(contents: [
                            Statistics.init(name: "Your Ringer Score", value: "90"),
                            Statistics.init(name: "Par 3 Average", value: "4.9"),
                            Statistics.init(name: "Par 4 Average", value: "5.0"),
                            Statistics.init(name: "Par 5 Average", value: "3.2"),
                            Statistics.init(name: "Putts per hole", value: "0"),
                            Statistics.init(name: "Average Putts", value: "0")])
    }
}


