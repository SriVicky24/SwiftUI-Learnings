//
//  PaymentDue.swift
//  PaymentReminder
//
//  Created by Sri Vignesh on 12/8/20.
//

import Foundation

struct PaymentDue: Decodable {
  let invoice_no: String
  let name: String
  let date: String
  let amount: String
  let balance: String?
  let payments: [Payment]
  
}

struct Payment: Decodable, Identifiable {
  let id: Int
  let name: String
  let date: String
  let status: Bool
  let amount: String
}
