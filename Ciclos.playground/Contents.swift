import UIKit

var str = "El tema que se va a ver es ciclos"

//Uso del print
print(str)

/*print("José")
print ("Juan") */

var nombres = ["José", "Juan", "Pedro", "Sergio", "Andres"]

//print(nombres[3])

var i = 0

//ForEach
if !nombres.isEmpty {
    for item in nombres {
        print(item)
    }
}

//Repeat = Do while
var j = 1
repeat{
    print("Hola mundo")
    j += 1
}while(j < 10)

//While
var k = 9
while k < 10 {
    print(k)
    k += 1
}
