//
//  Date+Extension.swift
//  NewsFeed
//
//  Created by Sri Badrinath on 8/11/21.
//

import Foundation

extension Date {
  
  /// Use this method to convert a iso date string to a medium style date string
  
  func mediumStyleDateFromString(dateString : String) -> String {

    let dateFormatter = DateFormatter.init()
    dateFormatter.timeZone = TimeZone.current
    dateFormatter.locale = Locale.current
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

    let convertedDate = dateFormatter.date(from: dateString)
    dateFormatter.dateFormat = "MMM d',' yyyy HH:mm a"
    
    let formattedString = dateFormatter.string(from: convertedDate!)

    return formattedString

  }
}
