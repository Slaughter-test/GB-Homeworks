import UIKit
import Foundation

// 1. Решить квадратное уравнение.

func Kv_ur (a:Double, b:Double, c:Double) {
    let d = (pow(b,2)) - (4*a*c)
    if d == 0 {
    print("Корней нет")
    }
    if d < 0 {
    let x = (-b) / (2.0 * a)
    print("Один корень : \(x)")
    }
    if d > 0 {
    let x = (-b + sqrt(d)) / (2.0 * a)
    let y = (-b + sqrt(d)) / (2.0 * a)
    print("Два корня : \(x) и \(y)")
    }
}
    Kv_ur(a: 2.0,b: 3.0,c: 4.0)
    Kv_ur(a: 5.0, b: -3.0, c: -5.0)

// 2. Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.
func Perimeter (a:Double, b:Double, c:Double) -> Double {
    let x = a + b + c
    return(x)
}
func Ploshad (a:Double, b:Double, c:Double) -> Double {
    let x = Perimeter(a: a, b: b, c: c)
    let y = sqrt(x * (x - a) * (x - b) * (x - c))
    return(y)
}
func Gipo(a:Double, b:Double) -> Double {
    let c = sqrt(pow(a, 2.0) + pow(b, 2.0))
    return(c)
}
    Ploshad(a: 2.4, b: 3.4, c: 4.5)
    Perimeter(a: 3.3, b: 4.5, c: 5.5)
    Gipo(a: 5.0, b: 7.0)
// 3. * Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.
func SummaVkladaAfter5Years (summa: Double, percent: Int) -> Double {
    var i = 1
    var SummaVklada = summa
    while i <= 5 {
    SummaVklada = SummaVklada + SummaVklada * (Double(percent) / 100)
    i = i + 1
        }
    return(SummaVklada)
    }
SummaVkladaAfter5Years(summa: 50000, percent: 12)

