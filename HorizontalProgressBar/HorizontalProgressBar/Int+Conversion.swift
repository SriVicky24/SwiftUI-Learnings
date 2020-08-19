//
//  Int+Conversion.swift
//  HorizontalProgressAnimation
//
//  Created by Sri Vignesh on 19/8/20.
//

import Foundation

extension Int {
  func convertSecondsToDisplayable() -> String {
    let hours = abs(self / 3600)
    let minutes = abs(self / 60) % 60
    let seconds = abs(self % 60)

    if hours > 0 {
      return String(format: "%.2d:%.2d:%.2d", hours, minutes, seconds)
    } else {
      return String(format: "%.2d:%.2d", minutes, seconds)
    }
  }
}
