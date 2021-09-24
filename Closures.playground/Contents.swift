import UIKit

func mayorQue(a: Int, b:Int) -> Bool {
    return a > b
}

var resultado = mayorQue(a: 3, b: 5)

print(resultado)

var closure = {
    (a:Int, b:Int) -> Bool in return a > b
}

print(closure(8,5))
