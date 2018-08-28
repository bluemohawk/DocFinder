import UIKit

var dateString = Date()

let dateFormatter = DateFormatter()
dateFormatter.locale = Locale.init(identifier: "fr_FR")
dateFormatter.dateStyle = DateFormatter.Style.full
dateFormatter.string(from: dateString)


var date = "28-08-2018 08:00"
dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
var newDate = dateFormatter.date(from: date)
dateFormatter.string(from: newDate!)

var components = DateComponents()
//components.weekday = 5
components.day = 28
components.month = 08
components.year = 2018
var calendar = Calendar.current
var new = calendar.date(from: components)

let weekday = Calendar.current.component(.weekday, from: new!)

