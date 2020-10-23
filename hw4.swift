import Foundation

// 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
enum color {
    case white,black,silver,blue,red
}
enum transmission {
    case automated, semi_automated, manual
}
enum doors {
    case two_doors, four_doors
}
// 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.

enum windowstatus {
    case opened,closed
}

class Car {
    var color : color
    var transmission : transmission
    var doors : doors
    var windowstatus: windowstatus
    
    static var carCount = 0
    
    static func countInfo() {
        print("Общее кол-во автомобилей : \(self.carCount)")
    }
    func emptyFunction() {
        print("Данные автомобиля: цвет - \(color), коробка - \(transmission), кол-во дверей - \(doors), состояние окон -\(windowstatus)")
    }
    
    func changeWindowStatus () {
            switch windowstatus {
            case .opened:
                self.windowstatus = .opened
            case .closed:
                self.windowstatus = .closed
            }
        }
    
    init(color: color, transmission: transmission, doors: doors, windowstatus: windowstatus) {
        self.color = color
        self.transmission = transmission
        self.doors = doors
        self.windowstatus = windowstatus
        Car.carCount += 1
    }
    deinit {
        Car.carCount -= 1
    }
}
// 2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
// 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

class TrunkCar : Car {
    var volume: Int
    init(color: color, transmission: transmission, doors: doors, windowstatus: windowstatus, volume: Int) {
        self.volume = volume
        super.init(color: color, transmission: transmission, doors: doors, windowstatus: windowstatus)
    }
    func load(mass: Int) {
        self.volume += 100
    }
    func unload(mass: Int) {
        self.volume -= mass
        if self.volume < 0 {
            print("нельзя разгрузить вес больше чем есть в автомобиле")
            self.volume += mass
        }
    }
    
    override func emptyFunction() {
        print("Данные автомобиля: цвет - \(color), коробка - \(transmission), кол-во дверей - \(doors), состояние окон -\(windowstatus), загруженность автомобиля - \(volume)")
    }
}

class SportCar : Car {
    var nitro: Bool
    init(color: color, transmission: transmission, doors: doors, windowstatus: windowstatus, nitro: Bool) {
        self.nitro = nitro
        super.init(color: color, transmission: transmission, doors: doors, windowstatus: windowstatus)
    }
    func changeNitroExisting() {
        if nitro == true {
            nitro = false
        } else {
            nitro = true
        }
    }
    override func emptyFunction() {
        print("Данные автомобиля: цвет - \(color), коробка - \(transmission), кол-во дверей - \(doors), состояние окон -\(windowstatus), наличие нитро - \(nitro)")
    }
}
// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var mitsu = Car(color: .red, transmission: .semi_automated, doors: .four_doors, windowstatus: .opened)
var mercedes = Car(color: .black, transmission: .automated, doors: .four_doors, windowstatus: .closed)
mercedes.changeWindowStatus()
var porsche = SportCar(color: .white, transmission: .automated, doors: .two_doors, windowstatus: .opened, nitro: true)
var camaro = SportCar(color: .blue, transmission: .semi_automated, doors: .two_doors, windowstatus: .closed, nitro: false)
porsche.changeWindowStatus()
camaro.changeNitroExisting()
var toyota = TrunkCar(color: .black, transmission: .manual, doors: .four_doors, windowstatus: .opened, volume: 500)
toyota.load(mass: 500)
toyota.unload(mass: 1000)
mitsu.emptyFunction()
mercedes.emptyFunction()
porsche.emptyFunction()
camaro.emptyFunction()
print("Общее кол-во тачек: \(Car.carCount)")
