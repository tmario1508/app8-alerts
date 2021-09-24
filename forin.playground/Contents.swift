import UIKit

// Arreglos

var arreglo:[String] = ["a","b","c"]

//Diccionarios
var diccionario: [String:String] =
    ["a":"Primer Letra del  abecedario",
     "b":"Segunda Letra del  abecedario",
     "c":"Tercer Letra del  abecedario"]

//Estructura de JSON
/*
{
     key:Value
     Nombre:"Felipe Hernandez",
     Calificaciones:{
        Matematicas:"10",
        Español:"9"
    },
     Edad:29,
     Carrera:"Sistemas"
}
*/

//For reducido o ForIn
for i in 0..<arreglo.count {
    print(arreglo[i])
}

for item in arreglo {
    print(item)
}

for item2 in diccionario {
    if item2.key == "a" {
        print("Es la letra \(item2.key)")
        print("Su valor es \(item2.value)")
    }
    print(item2)
}
