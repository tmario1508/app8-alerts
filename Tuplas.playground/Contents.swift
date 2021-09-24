import UIKit

func minMax(array: [Int]) -> (min: Int, max: Int){
    var valorMin = array[0]
    var valorMax = array[0]
    
    for valor in array[1..<array.count] {
        if valor < valorMin {
            valorMin = valor
        }else if valor > valorMax {
            valorMax = valor
        }
    }
    return (valorMin, valorMax)
}

let datos = minMax(array: [6, 7, 2, 10, 23, 43, 36])
print("Valor minimo \(datos.min) y valor maximo es \(datos.max)")
