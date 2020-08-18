//
//  ContentView.swift
//  StretchyHeader
//
//  Created by Sri Vignesh on 18/8/20.
//

import SwiftUI

struct ContentView: View {
  
  var course: Course = CourseData().getData()
  @State var showNavBar: Bool = false
  
  var body: some View {
    ZStack(alignment: .top, content: {
      ScrollView(.vertical, showsIndicators: true, content: {
      VStack(spacing: 20) {
        CourseHeaderView(name: course.name,
                         address: course.address, shouldShowNavBar: $showNavBar)
        Button(action: didBtnStartTapped) {
           HStack(alignment: .center) {
             Spacer()
             Text("START")
               .foregroundColor(Color.white)
               .fontWeight(.bold)
             Spacer()
           }
         }
        .frame(height: 50)
        .background(Color.green).cornerRadius(8.0)
        .foregroundColor(.white)
        .padding(.horizontal, 16)
        .shadow(radius: 5)
        
        StatisticsCardView(statCardModel: course.roundStats)
          .padding(.horizontal, 16)
        StatisticsCardView(statCardModel: course.holeStats)
          .padding(.horizontal, 16)
        }
    })
      if showNavBar {
        CustomNavBarView(navBarButtonAction: didBtnStartTapped)
      }
    })
    .edgesIgnoringSafeArea(.top)
  }
  
//  MARK: - IBAction Methods
  private func didBtnStartTapped() {
    print("Start Tapped")
  }
  
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView(course: CourseData.init().getData())
  }
}


struct CourseHeaderView: View {

  var name: String
  var address: String
  
  @Binding var shouldShowNavBar: Bool

  var body: some View {
    ZStack(alignment: .bottomLeading){
      GeometryReader { g in
        Image("Course")
          .resizable()
          .offset(y: getScrollOffset(g) > 0 ? -getScrollOffset(g) : 0)
          .frame(height: getScrollOffset(g) > 0 ? getScrollOffset(g) + UIScreen.main.bounds.height / 3 : UIScreen.main.bounds.height / 3)
          .blur(radius: self.getBlurRadiusForImage(g))
        }
        .frame(height: UIScreen.main.bounds.height / 3)
      VStack (alignment: .leading, spacing: 8) {
        Text(name)
          .font(.title3)
          .foregroundColor(.white)
        Text(address)
          .font(.subheadline)
          .lineLimit(2)
          .foregroundColor(.white)
      }
      .padding(.bottom, 20)
      .padding(.leading, 16)
    }
  }
  
  //  MARK: - User Defined Methods
  private func getScrollOffset(_ geometry: GeometryProxy) -> CGFloat {
    let value = geometry.frame(in: .global).minY
    if value + geometry.size.height < 0 {
      // Moving it to async to update the view for now. Not an ideal solution.
      // Sometimes CPU goes high
      DispatchQueue.main.async {
        withAnimation {
          self.shouldShowNavBar = true
        }
      }
    }
    else {
      DispatchQueue.main.async {
        withAnimation {
          self.shouldShowNavBar = false
        }
      }
    }
    return value
  }
  
  private func getBlurRadiusForImage(_ geometry: GeometryProxy) -> CGFloat {
    let offset = geometry.frame(in: .global).maxY
    let height = geometry.size.height
    let blur = (height - max(offset, 0)) / height
    return blur * 6
  }
}


struct CourseData {
  func getData() -> Course {
    
    let roundStats = [
      Statistics.init(name: "Average Score", value: "88.0"),
      Statistics.init(name: "Average Net Score", value: "85.0"),
      Statistics.init(name: "Best Round", value: "67"),
      Statistics.init(name: "Worst Round", value: "170"),
      Statistics.init(name: "Community Best", value: "NA")
    ]
    
    let roundStatModel = StatisticsCardModel.init(imageName: "icRoundStat",
                                              title: "Round Statistics",
                                              subTitle: "63 Rounds Played",
                                              stats: roundStats)
    
    
    let holeStats = [
      Statistics.init(name: "Your Ringer Score", value: "90"),
      Statistics.init(name: "Par 3 Average", value: "4.9"),
      Statistics.init(name: "Par 4 Average", value: "5.0"),
      Statistics.init(name: "Par 5 Average", value: "3.2"),
      Statistics.init(name: "Putts per hole", value: "0"),
      Statistics.init(name: "Average Putts", value: "0")
    ]
    
    let holeStatModel = StatisticsCardModel.init(imageName: "icHoleStat",
                                              title: "Hole by Hole Statistics",
                                              subTitle: "18 Hole Course",
                                              stats: holeStats)
    
    let course = Course.init(name: "Adobe Creek G C",
                             address: "1901 Frates Rd, Petaluma, CA, USA",
                             roundStats: roundStatModel,
                             holeStats: holeStatModel)
    
    return course
    
  }
}
