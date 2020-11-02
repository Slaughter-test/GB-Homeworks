import Foundation
// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
protocol Weightable {
    var weight: Int {get set}
    var height: Int {get set}
}
struct Queue<T: Weightable> {
    private var elements: [T] = []
    var totalWeight : Int {
        var weight = 0
        for element in elements {
            weight += element.weight
        }
        return weight
    }
// 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)

    mutating func filter(closure:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if closure(i) {
                result.append(i)
            }
        }
        return result
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    mutating func pop(_ element: T) {
        elements.removeLast()
    }
    // 3 *Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

    subscript(indices: UInt ...) -> (Int?, Int?) {
        var weight: Int = 0
        var height: Int = 0
            for index in indices where index < self.elements.count {
                weight += self.elements[Int(index)].weight
                height += self.elements[Int(index)].height
            }
        if weight == 0 && height == 0{
                return(nil, nil)
        }
                return (weight, height)
        

}
}
class Animal: Weightable {
    var weight: Int
    var height: Int
    var name: String
    init (weight : Int, height: Int, name: String) {
        self.height = height
        self.weight = weight
        self.name = name
    }
    
}

var queueDogs = Queue<Animal>()
queueDogs.push(Animal(weight: 22, height: 10, name: "Alex"))
queueDogs.push(Animal(weight: 12, height: 4, name: "Diego"))
queueDogs.push(Animal(weight: 66, height: 23, name: "Pisuk"))
queueDogs.push(Animal(weight: 89, height: 100, name: "Rex"))
queueDogs.totalWeight
queueDogs[3]
queueDogs[23]
