import UIKit

//Arreglos

var arreglo : [String] = ["a", "b", "c", "d"]

arreglo.insert("e", at: 4)
print(arreglo)

arreglo.remove(at: 1)
print(arreglo)

arreglo.insert("f", at: 0)
print(arreglo)

var valorIndiceCero = arreglo[0]
print(valorIndiceCero)

//MARK: Diccionarios

var diccionarios: [String:String] = ["a":"Es la primer letra del abecedario", "b":"Es la segunda letra del abecedario", "c":"Es la tercer letra del abecedario"]
print(diccionarios)

diccionarios["d"] = "Es la cuarta letra del abecedario"
print(diccionarios)


var valorLetraC = diccionarios["c"]
var valorLetraC = diccionarios["c"]
if let valorLetra = valorLetraC {
    print(valorLetra)
}else {
    print("No se tiene valor")
}
