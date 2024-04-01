// classe Rectangle
class Rectangle {

    var longueur: Double
    var largeur: Double
    static var nombreObjet: Int = 0

    init(longueur: Double, largeur: Double) {
        self.longueur = longueur
        self.largeur = largeur
        Rectangle.nombreObjet += 1
    }

    // Méthode pour le périmètre
    func perimeter() -> Double {
        return 2 * (longueur + largeur)
    }

    // Méthode pour l'aire
    func area() -> Double {
        return longueur * largeur
    }
}

// Trois instances de la classe Rectangle
let R1 = Rectangle(longueur: 5.0, largeur: 3.0)
let R2 = Rectangle(longueur: 7.0, largeur: 4.0)
let R3 = Rectangle(longueur: 2.0, largeur: 6.0)
var listes = [R1, R2, R3]


// Comparer les surfaces de deux rectangles
func ordreSurface(_ R1: Rectangle, _ R2: Rectangle) -> Bool {
    return R1.area() < R2.area()
}

// Comparer les périmètres de deux rectangles
func ordrePerimetre(_ R1: Rectangle, _ R2: Rectangle) -> Bool {
    return R1.perimeter() < R2.perimeter()
}

// Ordonner la liste en fonction de la surface
listes.sort(by: ordreSurface)

// Ordonner la liste en fonction du périmètre
listes.sort(by: ordrePerimetre)

// Afficher la liste ordonnée selon la surface
print("++++ Liste des rectangles ordonnée par surface ++++")
for rectangle in listes {
    print("Longueur: \(rectangle.longueur), Largeur: \(rectangle.largeur), Surface: \(rectangle.area())")
}

// Afficher la liste ordonnée selon le périmètre
print("\nListe des rectangles ordonnée par périmètre :")
for rectangle in listes {
    print("Longueur: \(rectangle.longueur), Largeur: \(rectangle.largeur), Périmètre: \(rectangle.perimeter())")
}

// Nombre de rectangles créés
print("\n Nombre de rectangles créés : \(Rectangle.nombreObjet)")
