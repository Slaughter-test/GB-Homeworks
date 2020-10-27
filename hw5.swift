import Foundation

// 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
enum color {
    case white,black,red,blue
}
protocol Car {
    var isWindowOpen: Bool { get set }
    var isEngineOn: Bool { get set }
    var horsePower: Int { get }
    var color: color { get }
}
// 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Car {
    mutating func changeEngineState() {
        switch isEngineOn {
        case true:
            isEngineOn = false
        default:
            isEngineOn = true
        }
    }
     mutating func changeWindowState() {
        switch isWindowOpen {
        case true:
            isWindowOpen = false
        default:
            isWindowOpen = true
        }
    }
}
// 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class TrunkCar: Car {
    var isWindowOpen: Bool
    
    var isEngineOn: Bool
    
    var horsePower: Int
    
    var color: color
    
    var load: Int
    
    init(isWindowOpen: Bool, isEngineOn: Bool, horsePower: Int, color: color, load: Int) {
        self.color = color
        self.horsePower = horsePower
        self.isEngineOn = isEngineOn
        self.isWindowOpen = isWindowOpen
        self.load = load
    }
}
class SportCar: Car {
    var isWindowOpen: Bool
    
    var isEngineOn: Bool
    
    var horsePower: Int
    
    var color: color
    
    var nitro: Bool
    
    init(isWindowOpen: Bool, isEngineOn: Bool, horsePower: Int, color: color, nitro: Bool) {
        self.color = color
        self.horsePower = horsePower
        self.isEngineOn = isEngineOn
        self.isWindowOpen = isWindowOpen
        self.nitro = nitro
    
    }
}
// 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return "Цвет машины - \(self.color), кол-во лошадиных сил - \(self.horsePower), включен ли двигатель - \(self.isEngineOn), открыты ли окна - \(self.isWindowOpen), загруженность автомобиля - \(self.load)"
    }
}

extension SportCar: CustomStringConvertible {
    var description: String {
        return "Цвет машины - \(self.color), кол-во лошадиных сил - \(self.horsePower), включен ли двигатель - \(self.isEngineOn), открыты ли окна - \(self.isWindowOpen), наличие  нитро - \(self.nitro)"
    }
}
// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var porsche = SportCar(isWindowOpen: true, isEngineOn: false, horsePower: 500, color: .white, nitro: true)
porsche.changeEngineState()
var maz = TrunkCar(isWindowOpen: false, isEngineOn: true, horsePower: 200, color: .blue, load: 500)
maz.changeEngineState()
print("Данные по МАЗ: " + maz.description)
print("Данные по Porsche:" + porsche.description)
