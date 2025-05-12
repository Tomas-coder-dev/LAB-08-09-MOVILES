import SwiftUI

struct MenuPrincipal: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Calculadora Laboral", destination: Aplicacion01())
                NavigationLink("Notas Tecsup", destination: Aplicacion02())
                NavigationLink("Aplicación 03", destination: Aplicacion03())
                NavigationLink("Aplicación 04", destination: Aplicacion04())
            }
            .navigationTitle("Menú Principal")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    MenuPrincipal()
}
