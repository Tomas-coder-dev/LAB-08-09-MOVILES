import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Aplicaciones de Tecsup en SwiftUI!")
                .font(.title)
                .foregroundColor(.red)
                .multilineTextAlignment(.center)
            
            Text("Desarrollado Por: Fabricio Aylas")
            
            HStack(alignment: .center, spacing: 20) {
                Text("Actividad01")
                Text("Actividad02")
                Text("Actividad03")
            }
            
            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 200, height: 200)
                
                Text("Hola  A todos los del C24 ")
                    .foregroundColor(.white)
            }
        }
        .padding(20)
    }
}

#Preview {
    ContentView()
}
