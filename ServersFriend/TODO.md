#  Servers Friend App

## Frontend

- [ ] 4 main app pages
  - [x] Tips
  - [x] Calendar
  - [x] Shifts
  - [x] Settings

- [ ] App should be behind a sign in screen
- [ ]

### Server Overview View

General overview of the tips that the user has earned per week and per month,
as well as visualizations for the most profitable shifts and days of the week to
work.

- [ ] incorporate hourly wage field from shift into earnings for the shift review
- [ ] change naming from tips to shift review -> tips



### Calendar View

Large view being encompassed by a fullscreen calendar, which will have tip data
visible by day per the calendar month.

- [ ] Decide whether to use SwiftUICalendar or ElegantCalendar for the cal view



### Shifts View

General overview of all shift data, including CRUD functionality.

- [ ] Break up shifts into sections by employer
- [ ] add employer functionality
  - [ ] create
  - [ ] update
  - [ ] delete
- [ ] add hourly wage field to shifts
- [ ] deny ability to add shift reviews past today's date


#### Big Questions

- How should the data be interconnected between tips and shifts?
- How should user preferences be set, and how should they intermingle with the tips
and shifts data?



### Settings View

Responsible for all of the user settings, as well as profile information.


## Exploration

**Data layout**

All potential layouts

- Job (Old Chicago)
    - Position (Bartender)
        - Shift
            - Shift Review
            - Shift Review
    - Position (Server)
        - Shift (Server 1)
            - Shift Review
            - Shift Review
        - Shift (Server 2)
            - Shift Review
            - Shift Review
            - Shift Review
- Job (Buffalo Wild Wings)
    - Position (Bartender)
        - Shift (Bartender 2)
            - Shift Review
            - Shift Review

**WHERE:**

```swift
class Job {
    var name: String
    var address: String?
    var manager: String?

    init (name:String, address: String? = nil, manager: String? = nil) {
        name = self.name
        address = self.address
        manager = self.manager
    }
}

class Position {
    var name
}

// === OR ===

class Shift {

    struct Position {
        name: String
    }

    struct Job {
        name: String
    }

    var name: String
    var hourlyWage: Double
    var tipIn: Bool
    var tipOut: Bool
    var position: Position
    var job: Job


}
```

