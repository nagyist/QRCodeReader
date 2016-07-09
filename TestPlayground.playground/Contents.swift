//: Playground - noun: a place where people can play

import Cocoa

extension NSDateFormatter {
    convenience init(dateFormat: String) {
        self.init()
        self.dateFormat = dateFormat
    }
}

extension String {
    func dateWithFormat(format:String) -> NSDate {
        return NSDateFormatter(dateFormat: format).dateFromString(self)!
    }
}

"20051980".dateWithFormat("ddMMyyyy")

