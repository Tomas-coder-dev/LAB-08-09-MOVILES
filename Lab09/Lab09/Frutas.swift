import SwiftUI

struct Frutas: View {
    let fruits = [
        "🍎 Manzana",
        "🍌 Banana",
        "🍇 Uvas",
        "🍓 Frutilla",
        "🍉 Sandía",
        "🍐 Pera"
    ]
    
    var body: some View {
        NavigationView {
            List(fruits, id: \.self) { fruit in
                Text(fruit)
                    .font(.title2)
                    .padding()
            }
            .navigationTitle("Lista de Frutas")
        }
    }
}

#Preview {
    Frutas()
}
