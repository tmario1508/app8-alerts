import UIKit

class Artista {
    //Propiedades
    var Nombre:String = ""
    var Nacimiento = 02/06/1990
    var Descripcion:String = ""
    
    //Inicializadores
    init() {
        Nombre = "Jose"
        Descripcion = "Artista post-moderno"
    }
    
    init(nombre:String){
        Nombre = nombre
        Descripcion = "Artista post-moderno"
    }
    
    init(nombre:String, descripcion:String){
        Nombre = nombre
        Descripcion = descripcion
    }
    
    func Imprimir() {
        print("Tu nombre es \(Nombre) y eres \(Descripcion)")
    }
    
    func obtenerEdad(_ num1:Int, num2:Int) -> Int {
        return num1 - num2
    }
    
}

//let artista = Artista()
//let artista = Artista(nombre: "Mario")
let artista = Artista(nombre: "Mario", descripcion: "Estudiante MTWyDM")

artista.Imprimir()

var resultado = artista.obtenerEdad(2021, num2: 1990)

print("Tengo \(resultado) años de edad")

