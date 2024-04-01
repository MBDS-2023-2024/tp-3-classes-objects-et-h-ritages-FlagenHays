// Protocole Shape
protocol Shape {
    func area() -> Double
    func perimeter() -> Double
}

// Classe Rectangle implémentant le protocole Shape
class Rectangle: Shape {
    // Attributs
    var longueur: Double
    var largeur: Double

    // Initialisateur
    init(longueur: Double, largeur: Double) {
        self.longueur = longueur
        self.largeur = largeur
    }

    // Méthodes du protocole Shape
    func area() -> Double {
        return longueur * largeur
    }

    func perimeter() -> Double {
        return 2 * (longueur + largeur)
    }
}

// Classe Triangle implémentant le protocole Shape
class Triangle: Shape {
    var coteA: Double
    var coteB: Double
    var coteC: Double

    init(coteA: Double, coteB: Double, coteC: Double) {
        self.coteA = coteA
        self.coteB = coteB
        self.coteC = coteC
    }

    // Méthodes du protocole Shape
    func area() -> Double {
        let demiPerimetre = perimeter() / 2
        let aire = customSqrt(demiPerimetre * (demiPerimetre - coteA) * (demiPerimetre - coteB) * (demiPerimetre - coteC))
        return aire
    }

    func perimeter() -> Double {
        return coteA + coteB + coteC
    }

    // Implémentation personnalisée de la fonction racine carrée
    private func customSqrt(_ x: Double) -> Double {
        var mesure = 1.0
        for _ in 0..<10 {
            mesure = (mesure + x / mesure) / 2
        }
        return mesure
    }
}

// Classe Circle implémentant le protocole Shape
class Circle: Shape {
    var rayon: Double

    init(rayon: Double) {
        self.rayon = rayon
    }

    // Méthodes du protocole Shape
    func area() -> Double {
        return Double.pi * rayon * rayon
    }

    func perimeter() -> Double {
        return 2 * Double.pi * rayon
    }
}

// Création d'une liste contenant trois Circle, deux Rectangle et un Square
var listeShapes: [Shape] = [
    Circle(rayon: 3.0),
    Circle(rayon: 2.5),
    Circle(rayon: 4.0),
    Rectangle(longueur: 5.0, largeur: 3.0),
    Rectangle(longueur: 7.0, largeur: 4.0),
    Rectangle(longueur: 2.0, largeur: 6.0)
]


print("++++ AFFICHAGE DES ELEMENTS ++++")
// Parcours de la liste et affichage des informations pour chaque forme
for shape in listeShapes {
    if let rectangle = shape as? Rectangle {
        print("\nJe suis un rectangle, ma longueur est \(rectangle.longueur), ma largeur est \(rectangle.largeur), ma surface est \(rectangle.area()) et mon périmètre est \(rectangle.perimeter())")
    } else if let circle = shape as? Circle {
        print("\nJe suis un cercle, mon rayon est \(circle.rayon), ma surface est \(circle.area()) et mon périmètre est \(circle.perimeter())")
    } else if let triangle = shape as? Triangle {
        print("\nJe suis un triangle, mes côtés sont \(triangle.coteA), \(triangle.coteB) et \(triangle.coteC), ma surface est \(triangle.area()) et mon périmètre est \(triangle.perimeter())")
    }
}
