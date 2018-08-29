import UIKit
//
//var dateString = Date()
//
//let dateFormatter = DateFormatter()
//dateFormatter.locale = Locale.init(identifier: "fr_FR")
//dateFormatter.dateStyle = DateFormatter.Style.full
//dateFormatter.string(from: dateString)
//
//
//var date = "28-08-2018 08:00"
//dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
//var newDate = dateFormatter.date(from: date)
//dateFormatter.string(from: newDate!)
//
//var components = DateComponents()
//components.weekday = 2
//components.weekOfMonth = 2
////components.day = 25
//components.month = 08
//components.year = 2018
//var calendar = Calendar.current
//var new = calendar.date(from: components)
//
//let weekday = Calendar.current.component(.weekday, from: new!)
//let weekOfYear = Calendar.current.component(.weekOfYear, from: dateString)




//get the current week of the Year
let dateString = Date()
var appointments = [Date]()
//add 1, 2, 3 to identify the next, following and third week from today
let weekOfYear = Calendar.current.component(.weekOfYear, from: dateString)
//for the next 3 weeks
for i in 1...3 {
    let nextWeek = weekOfYear + i
    //select days out of each week
    for _ in 1 ... i+1 {
        let day = [2, 3, 4, 5, 6].randomElement()
        let hour = [9, 10, 11, 14, 15, 16].randomElement()
        let min = [00, 30].randomElement()
        var component = DateComponents()
        component.weekOfYear = nextWeek
        component.weekday = day
        component.hour = hour
        component.minute = min
        component.year = 2018
        component.timeZone = TimeZone(abbreviation: "GMT")

        let calendar = Calendar.current
        let output = calendar.date(from: component)

        appointments.append(output!)
        
    }
    appointments.sort(){$0 < $1}
    let dic = [nextWeek:appointments]
    print(dic)
}

appointments.sort(){$0 < $1}
print(appointments)

let cal = Calendar.current
var aSet = Set<Int>()
for appt in appointments {
    aSet.insert(cal.component(.weekOfYear, from: appt))
}
print(aSet.count)

let today = cal.component(.weekOfYear, from: Date())

for appt in appointments {
    
    let ap = cal.component(.weekOfYear, from: appt)
    if (ap - today == 1) {
        //xxx
    } else if ( ap - today == 2 ) {
        //xxx
    } else if ( ap - today == 3 ) {
        //xxx
    }
}

//let aDay = appointments[5]
//let cal = Calendar.current
//let year = cal.component(.year, from: aDay)
//let month = cal.component(.month, from: aDay)
//let day = cal.component(.day, from: aDay)
//let WOY = cal.component(.weekOfYear, from: aDay)
//let WOD = cal.component(.weekday, from: aDay)
//let am = cal.component(.yearForWeekOfYear, from: aDay)
//cal.weekdaySymbols
//cal.monthSymbols
//cal.timeZone


//print(appointments)
//for day in appointments {
//
//    let dateFormatter = DateFormatter()
//    dateFormatter.locale = Locale.init(identifier: "fr_FR")
//    dateFormatter.dateFormat = "EEEE dd MMMM, HH:mm"
////    dateFormatter.dateStyle = DateFormatter.Style.full
//    print( dateFormatter.string(from: day) )
//
//}
//for each week, select couple of days, exclude weekends and associate to each day a random time for appointment (Monday is day 2 ... Saturday is day 6)

//
