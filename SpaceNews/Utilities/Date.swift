//
//  Date.swift
//  SpaceNews
//
//  Created by Rana Mustafa on 15/07/2025.
//

import Foundation
func formatDate(_ date: String) -> String {
   let formatter = DateFormatter()
   formatter.dateFormat = "d, MM yyyy"
   let isoFormatter = ISO8601DateFormatter()
   if let parsedDate = isoFormatter.date(from: date) {
       return formatter.string(from: parsedDate)
   } else {
       return "N/A"
   }
}
