import UIKit

// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.

// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 enum enginestatus {
     case on,off
 }
 enum windowstatus {
     case opened,closed
 }
struct SportCar {
    var year: Int
    var volume: Int
    var enginestatus: enginestatus
    var windowstatus: windowstatus
    var load: Int
    var mark: String
    
    mutating func changeEngineStatus (status: enginestatus){
        switch status {
        case .on:
            self.enginestatus = .on
        case .off:
            self.enginestatus = .off
        }
        
    }
    
    mutating func changeWindowStatus (status: windowstatus) {
        switch status {
        case .opened:
            self.windowstatus = .opened
        case .closed:
            self.windowstatus = .closed
        }
    }
    
    mutating func changeLoad (value: Int) {
        self.load = self.load + value
    }
    
    mutating func carAction (value: String) {
        switch value {
        case "drive":
            self.changeWindowStatus(status: .closed)
            self.volume -= 10
            self.changeEngineStatus(status: .on)
        case "loading":
            self.load += 100
        case "unloading":
            self.load = 0
        default:
            self.changeEngineStatus(status: .off)
            self.changeWindowStatus(status: .closed)
        }
    }
}

struct TrunkCar {
    var year: Int
    var volume: Int
    var enginestatus: enginestatus
    var windowstatus: windowstatus
    var load: Int
    var mark: String
    
    mutating func changeEngineStatus (status: enginestatus){
        switch status {
        case .on:
            self.enginestatus = .on
        case .off:
            self.enginestatus = .off
        }
        
    }
    
    mutating func changeWindowStatus (status: windowstatus) {
        switch status {
        case .opened:
            self.windowstatus = .opened
        case .closed:
            self.windowstatus = .closed
        }
    }
    
    mutating func changeLoad (value: Int) {
        self.load = self.load + value
    }
    
    mutating func carAction (value: String) {
        switch value {
        case "drive":
            self.changeWindowStatus(status: .closed)
            self.volume -= 10
            self.changeEngineStatus(status: .on)
        case "loading":
            self.load += 100
        case "unloading":
            self.load = 0
        default:
            self.changeEngineStatus(status: .off)
            self.changeWindowStatus(status: .closed)
        }
    }
    
}
// 2. Описать в каждом наследнике специфичные для него свойства.Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
var Camaro = SportCar(year: 2020, volume: 50, enginestatus: .on, windowstatus: .opened, load: 100, mark: "Chevrolet")
var Cayenne = SportCar(year: 2015, volume: 44, enginestatus: .off, windowstatus: .closed, load: 300, mark: "Porsche")
var Jeep = TrunkCar(year: 1995, volume: 100, enginestatus: .on, windowstatus: .closed, load: 1000, mark: "Jeep")
var L200 = TrunkCar(year: 2015, volume: 140, enginestatus: .off, windowstatus: .opened, load: 800, mark: "Mitsubishi")

Camaro.carAction(value: "drive")
Cayenne.changeEngineStatus(status: .off)
Jeep.carAction(value: "load")
L200.load = 0
// 6. Вывести значения свойств экземпляров в консоль.
print(Cayenne.enginestatus, Jeep.load, L200.windowstatus, Camaro.self)
