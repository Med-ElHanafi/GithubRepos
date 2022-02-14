//
//  DateFormatter.swift
//  GithubRepos
//
//  Created by Mohamed El hanafi on 14/2/2022.
//

import Foundation

extension DateFormatter {
    static var isoFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        return formatter
    }
    static var simpleFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        
        return formatter
    }
}

extension String {
    var formatDateString: String {
        if let date = DateFormatter.isoFormatter.date(from: self) {
            return DateFormatter.simpleFormatter.string(from: date)
        }
        return self
    }
}
