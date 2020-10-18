import UIKit
// 1. Написать функцию, которая определяет, четное число или нет.
func isValueEven (value: Int) -> Bool {
    if value % 2 == 0 {
    return true
    } else {
        return false
    }
}
isValueEven(value: 4) // true
isValueEven(value: 5) // false
// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func isValueCanDivideOn3WithoutRemainder (value: Int) -> Bool {
    if value % 3 == 0 {
        return true
    } else {
        return false
    }
}
isValueCanDivideOn3WithoutRemainder(value: 14)
isValueCanDivideOn3WithoutRemainder(value: 21)
// 3. Создать возрастающий массив из 100 чисел.
var array: Array<Int> = []
for i in 1...100 {
    array.append(i)
}
array.count // 100
array[99] // 100
array.endIndex // 100
// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
// вариант с array.filter {$0 % 2 != 0 && $0 % 3 == 0} показался неинтересным
var i = (array.count - 1) // 99
while i >= 0 {
    if isValueEven(value: array[i]) == true || isValueCanDivideOn3WithoutRemainder(value: array[i]) == false {
        array.remove(at: i)
    } else {
        print("Число \(array[i]) не удалено")
}
    i -= 1
    
}
print(array) // [3, 9, 15, 21, 27, 33, 39, 45, 51, 57, 63, 69, 75, 81, 87, 93, 99]
// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
func fibonacci (count: Int) -> Int {
    if count == 1 || count == 2 {
        return 1
    }
    return fibonacci(count: count - 1) + fibonacci(count: count - 2)
    
}
func addFibonacciToArray(count: Int) {
    for i in 1...count {
        array.append(fibonacci(count: i))
    }
}
// если поставить сотку ждать результата долго :)
addFibonacciToArray(count: 10)
print(array) // [3, 9, 15, 21, 27, 33, 39, 45, 51, 57, 63, 69, 75, 81, 87, 93, 99, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
// 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
// функция сортировки массива
func sortValue (value: [Int], sort: Int) -> [Int] {
    var i = (value.count - 1)
    var sortedArray = value
    while i >= 0 {
        if sortedArray[i] % sort == 0 {
            sortedArray.remove(at: i)
            }
        i -= 1
    }
    return sortedArray
}
// функция создания массива простых чисел из заданного массива чисел
func primeNumbers(array: [Int]) -> [Int] {
    var primeArray: [Int] = []
    var usedArray = array
    while let newP = usedArray.first {
        primeArray.append(newP)
        usedArray = sortValue(value: usedArray, sort: newP)
    }
    return primeArray
}
primeNumbers(array: [Int](2...100))
