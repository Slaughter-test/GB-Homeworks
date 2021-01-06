import Foundation
// 1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
// 2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

enum ResoursesErrors: Error {
    case invalidItem
    case outOfStock
    case outOfMoney(goldNeeded: Int)
    case tooManyHochesh
}
class Item {
    var price: Int
    var count: Int
    var resourse: Resourse
    
    init(price: Int, count: Int, resourse: Resourse) {
        self.price = price
        self.count = count
        self.resourse = resourse
    }
}
class Resourse {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Resourses {
    var inventory = [
    "Wood": Item(price: 10, count: 8, resourse: Resourse(name: "Wood")),
    "Food": Item(price: 20, count: 15, resourse: Resourse(name: "Food")),
    "Stone": Item(price: 40, count: 0, resourse: Resourse(name: "Stone"))
    ]
    
    func buyItem(itemNamed name: String, gold: Int, count: Int) throws -> (Resourse, exchange: Int) {
        guard let item = inventory[name] else {
            throw ResoursesErrors.invalidItem
        }
        guard item.count > 0 else {
            throw ResoursesErrors.outOfStock
        }
        guard (item.price * count) <= gold else {
            throw ResoursesErrors.outOfMoney(goldNeeded: ((item.price * count) - gold))
        }
        guard item.count >= count else {
            throw ResoursesErrors.tooManyHochesh
        }
        let exchange = gold - item.price * count
        let newItem = item
        newItem.count -= count
        inventory[name] = newItem
        
        return (newItem.resourse, exchange)
    }
}
let res1 = Resourses()
try res1.buyItem(itemNamed: "Wood", gold: 20, count: 1)

do {
    _ = try res1.buyItem(itemNamed: "Wood", gold: 10000, count: 111)
} catch ResoursesErrors.invalidItem {
    print("Такого ресурса не существует")
} catch ResoursesErrors.outOfMoney(let GoldNeeded) {
    print("Мало баблишка. Необходимо еще \(GoldNeeded) монет")
} catch ResoursesErrors.outOfStock {
    print("Ресурс кончился")
} catch let error {
    // если во время выполнения возникла ошибка, обрабатываем ее
    print(error.localizedDescription)
}
