//
//  HorizontalProgressView.swift
//  HorizontalProgressBar
//
//  Created by Sri Vignesh on 19/8/20.
//

import SwiftUI

struct HorizontalProgressView: View {
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  let totalDuration = 20
  @State var elapsedDuration = 0
  @State var displayDuration = 20
  @State var strokeEndValue: CGFloat = 0.0
  
  var body: some View {
    ZStack(alignment: .leading) {
      GeometryReader { geo in
        ZStack (alignment: .leading, content: {
          RoundedRectangle(cornerRadius: 0, style: .continuous)
            .fill(Color.yellow.opacity(0.2))
          })
        Path { path in
          path.move(to: CGPoint(x: 0, y: geo.size.height/2))
          path.addLine(to: CGPoint(x:geo.size.width, y: geo.size.height/2))
        }
        .trim(from: 0, to: self.strokeEndValue)
        .stroke(Color.orange, style: StrokeStyle(lineWidth: geo.size.height))
        HStack(spacing: 24) {
          Text(displayDuration.convertSecondsToDisplayable())
            .font(.body)
          Text("Jumping Jacks")
            .font(.body)
          Spacer()
        }
        .padding()
      }
    }
    .frame(height: 50)
    .onReceive(self.timer, perform: { value in
      // Not an ideal solution to subtract by 1
      // Avoiding to overflow the value
      if self.elapsedDuration <= totalDuration - 1 {
        self.elapsedDuration += 1
        self.displayDuration = totalDuration - elapsedDuration
        self.strokeEndValue = CGFloat(Float(self.elapsedDuration) / Float(totalDuration))
      }
      else {
        self.timer.upstream.connect().cancel()
        print("Timer Cancelled")
      }
    })
    .animation(.easeOut(duration: 2))
  }
}

struct HorizontalProgressView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalProgressView()
    }
}
