//
//  Data.swift
//  PaymentReminder
//
//  Created by Sri Vignesh on 12/8/20.
//

import Foundation

let paymentData: PaymentDue = load("PaymentDue.json")

func load<PaymentDue: Decodable>(_ filename: String) -> PaymentDue {
  let data: Data
  guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
    fatalError()
  }
  do {
    data = try Data(contentsOf: file)
    let decoder = JSONDecoder()
    return try decoder.decode(PaymentDue.self, from: data)
  } catch {
      fatalError("Couldn't parse the file")
  }
}
