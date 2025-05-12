import SwiftUI

struct Aplicacion02: View {
    @State private var notas: [String] = Array(repeating: "", count: 4)
    @State private var promedio: Int?
    @State private var errorMensaje = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Notas - Programación en Móviles Avanzado")
                .font(.title2)
                .bold()
                .multilineTextAlignment(.center)

            Text("Ingrese 4 notas de teoría.")
                .font(.body)
                .padding()
                .foregroundColor(.gray)

            Form {
                Section(header: Text("Notas del estudiante").bold()) {
                    ForEach(0..<4, id: \.self) { index in
                        TextField("Nota \(index + 1) o 'AN'", text: $notas[index])
                            .keyboardType(.default)
                    }
                }

                Button("Calcular Promedio") {
                    calcularPromedio()
                }
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.green)
                .cornerRadius(10)
            }

            if let resultado = promedio {
                Text("Promedio Final: \(resultado)")
                    .font(.title2)
                    .foregroundColor(.purple)
                    .padding()
            }

            if !errorMensaje.isEmpty {
                Text(errorMensaje)
                    .foregroundColor(.red)
                    .padding()
            }

            Spacer()
        }
        .padding()
    }

    func calcularPromedio() {
        errorMensaje = ""
        var valores: [(valor: Double, esAN: Bool)] = []

        for notaStr in notas {
            let input = notaStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

            if input == "AN" {
                valores.append((0, true))
                continue
            }

            guard let valor = Double(input.replacingOccurrences(of: ",", with: ".")), valor >= 0, valor <= 20 else {
                errorMensaje = "Todas las notas deben estar entre 0 y 20 o ser 'AN'."
                promedio = nil
                return
            }

            valores.append((valor, false))
        }

        // Si hay más de una nota y alguna no es AN, eliminar la menor que no sea AN
        var valoresFiltrados = valores
        if let notaMenor = valores.filter({ !$0.esAN }).min(by: { $0.valor < $1.valor }) {
            if let index = valoresFiltrados.firstIndex(where: { $0.valor == notaMenor.valor && !$0.esAN }) {
                valoresFiltrados.remove(at: index)
            }
        }

        // Redondear cada valor
        let notasRedondeadas = valoresFiltrados.map { nota -> Int in
            let decimal = nota.valor - floor(nota.valor)
            return decimal < 0.5 ? Int(floor(nota.valor)) : Int(ceil(nota.valor))
        }

        let suma = notasRedondeadas.reduce(0, +)
        promedio = Int(round(Double(suma) / Double(notasRedondeadas.count)))
    }
}

#Preview {
    Aplicacion02()
}
