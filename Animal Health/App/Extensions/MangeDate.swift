//
//  MangeDate.swift
//  Animal Health App
//
//  Created by OSX on 08/09/2022.
//

import Foundation


extension String {
    
    func covertTimeToText() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat =  "HH-mm-ss"
        let formatter2 = DateFormatter()
        formatter2.dateFormat =  "yyyy-MM-dd"
        var  convTime: String = ""
        let suffix = "Ago"
        let nowTime = Date()
        let temp = self.split(separator: "T")
        var myDate = temp[1]
        var date = formatter.string(from: nowTime)
        let TimeAfterSplit = myDate.split(separator: ":")
        let CurrntTimeAfterSplit = date.split(separator: "-")
        //MARK: - Split Time
        let second =  (Int(max(CurrntTimeAfterSplit[2],TimeAfterSplit[2])) ?? 0) - (Int(min(TimeAfterSplit[2],CurrntTimeAfterSplit[2])) ?? 0 )
        var minute = (Int(max(CurrntTimeAfterSplit[1],TimeAfterSplit[1])) ?? 0) - (Int(min(TimeAfterSplit[1],CurrntTimeAfterSplit[1])) ?? 0 )
        let hour = (Int(max(CurrntTimeAfterSplit[0],TimeAfterSplit[0])) ?? 0) - (Int(min(TimeAfterSplit[0],CurrntTimeAfterSplit[0])) ?? 0 )
        //MARK: - Split Days
        date = formatter2.string(from: nowTime)
        myDate = temp[0]
        let dateAfterSplit = myDate.split(separator: "-")
        let CurrntDateAfterSplit = date.split(separator: "-")
        
        let year =  ( Int(max(dateAfterSplit[0], CurrntDateAfterSplit[0])) ?? 0) - ( Int(min(dateAfterSplit[0], CurrntDateAfterSplit[0])) ?? 0)
        let month = ( Int(max(dateAfterSplit[1], CurrntDateAfterSplit[1])) ?? 0) - ( Int(min(dateAfterSplit[1], CurrntDateAfterSplit[1])) ?? 0)
        
        let day = ( Int(max(dateAfterSplit[2], CurrntDateAfterSplit[2])) ?? 0) - ( Int(min(dateAfterSplit[2], CurrntDateAfterSplit[2])) ?? 0) + (month/30) + (year/365)
        
        if year != 0 {
            convTime = "\(year) Years \(suffix)"
        } else if month != 0 && CurrntDateAfterSplit[2] > dateAfterSplit[2] {
            convTime = "\(month) Months  \(suffix)"
        } else if day >= 7 {
            convTime = "\(day/7) Week \(suffix)"
        } else if day != 0 {
            convTime = "\(day) Days \(suffix)"
        } else if hour != 0 && CurrntTimeAfterSplit[1] >= TimeAfterSplit[1] {
            convTime = "\(hour) Hours \(suffix)"
        } else if minute != 0 {
            if hour != 0 {
                minute = 60 - minute
            }
            convTime = "\(minute) Minutes \(suffix)"
        } else {
            convTime = "\(second) Seconds \(suffix)"
        }
        return convTime
    }
    
    func setDoctorAvailableDate() -> String {
        
        var doctorAvailableFrom: String = ""
        
        if self != "" {
            let spltingDate = self.split(separator: "T")
            let date = spltingDate[0]
            let time = spltingDate[1]
            
            let splitDate = date.split(separator: "-")
            let day = splitDate[2]
            var month = splitDate[1]
            
            switch month {
            case "01" :  month = "JAN"
            case "02": month = "FEB"
            case "03": month = "MAR"
            case "04": month = "APR"
            case "05": month = "MAY"
            case "06": month = "JUN"
            case "07": month = "JUL"
            case "08": month = "AUG"
            case "09": month = "SEP"
            case "10": month = "OCT"
            case "11": month = "NOV"
            case "12": month = "DEC"
            default : month = (month ) + ""
            }
            
            let splitTime = time.split(separator: ":")
            let hour = splitTime[0]
            let minute = splitTime[1]
            
            var temp: String = ""
            var myhour: Int = 0
            if (Int(hour ) ?? 0) > 12 {
                temp = "PM"
                myhour = (Int(hour ) ?? 0) - 12
            } else {
                temp = "AM"
                myhour = (Int(hour ) ?? 0)
            }
            if myhour < 10{
                doctorAvailableFrom = "\(day) \(month) 0\(myhour):\(minute) \(temp)"
            } else {
                doctorAvailableFrom = "\(day) \(month) \(myhour):\(minute) \(temp)"
            }
        }
        return doctorAvailableFrom
    }
    
    func setUpcomingBookingDate() -> String {
        
        var doctorAvailableFrom: String = ""
        
        if self != "" {
            let spltingDate = self.split(separator: " ")
            let date = spltingDate[0]
            let time = spltingDate[1]
            
            let splitDate = date.split(separator: "-")
            let day = splitDate[2]
            var month = splitDate[1]
            
            switch month {
            case "01" :  month = "JAN"
            case "02": month = "FEB"
            case "03": month = "MAR"
            case "04": month = "APR"
            case "05": month = "MAY"
            case "06": month = "JUN"
            case "07": month = "JUL"
            case "08": month = "AUG"
            case "09": month = "SEP"
            case "10": month = "OCT"
            case "11": month = "NOV"
            case "12": month = "DEC"
            default : month = (month ) + ""
            }
            
            let splitTime = time.split(separator: ":")
            let hour = splitTime[0]
            let minute = splitTime[1]
            
            var temp: String = ""
            var myhour: Int = 0
            if (Int(hour ) ?? 0) > 12 {
                temp = "PM"
                myhour = (Int(hour ) ?? 0) - 12
            } else {
                temp = "AM"
                myhour = (Int(hour ) ?? 0)
            }
            if myhour < 10{
                doctorAvailableFrom = "\(month) \(day) | 0\(myhour):\(minute) \(temp)"
            } else {
                doctorAvailableFrom = "\(month) \(day) | \(myhour):\(minute) \(temp)"
            }
        }
        return doctorAvailableFrom
    }
    
    func nearstBooking() -> Bool {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH-mm-ss"
        let Date = Date()
        if self != "" {
            let spltingTime = self.split(separator: " ")
            let time = spltingTime[1]
            
            let currentTime = formatter.string(from: Date)
            
            let splitCurrentTime = currentTime.split(separator: "-")
            let splitTime = time.split(separator: ":")
            
            let currentHour = splitCurrentTime[0]
            let currentminute = splitCurrentTime[1]
            let hour = splitTime[0]
            let minute = splitTime[1]
            
            if (hour == currentHour) && ((Int(minute) ?? 0) - (Int(currentminute) ?? 0))  <= 10{
                return true
            } else if (Int(hour) == ((Int(currentHour) ?? 0) + 1)) &&
                        ((Int(currentminute) ?? 0) - (Int(minute) ?? 0)) <= 60 &&
                        ((Int(currentminute) ?? 0) - (Int(minute) ?? 0)) >= 50 {
                return true
            }
            
        }
        return false
    }
    
    func availabeTimeSlot() -> String {
        var backTime = ""
        if self != ""{
            let spltingDate = self.split(separator: "T")
            let time = spltingDate[1]
            let splitTime = time.split(separator: ":")
            let hour = splitTime[0]
            let minute = splitTime[1]
            var myhour = 0
            var type = ""
            if (Int(hour ) ?? 0) > 12 {
                type = "PM"
                myhour = (Int(hour ) ?? 0) - 12
            } else {
                type = "AM"
                myhour = (Int(hour ) ?? 0)
            }
            
            
            backTime = "\(myhour):\(minute) \(type)"
        }
        return backTime
        
    }
    
    func isValidPassword() -> Bool {
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)
        
    }
    
}






