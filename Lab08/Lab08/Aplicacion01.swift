import SwiftUI

struct Aplicacion01: View {
    // MARK: - CTS Variables
    @State private var sueldo = ""
    @State private var gratificacion = ""
    @State private var mesesTrabajados = "6"
    @State private var ctsResultado: Double = 0
    
    // MARK: - Instructor Variables
    @State private var horasSemanales = ""
    @State private var afpPorcentaje: Double = 10
    @State private var mostrarResultadosInstructores = false
    @State private var sueldoBruto: Double = 0
    @State private var descuentoAFP: Double = 0
    @State private var sueldoNeto: Double = 0
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                ctsSection
                Divider()
                instructorSection
            }
            .padding()
        }
        .navigationTitle("Calculadora Laboral")
        .background(Color(.systemGroupedBackground))
    }
    
    // MARK: - CTS Section
    private var ctsSection: some View {
        VStack(spacing: 16) {
            SectionHeader(title: "Calculadora de CTS", color: .blue)
            
            InputField(title: "Sueldo mensual (S/)", text: $sueldo, keyboardType: .decimalPad)
            InputField(title: "Gratificación anual (S/)", text: $gratificacion, keyboardType: .decimalPad)
            InputField(title: "Meses trabajados", text: $mesesTrabajados, keyboardType: .numberPad)
            
            ActionButton(title: "Calcular CTS", color: .blue, action: calcularCTS)
            
            ResultDisplay(title: "CTS Calculada", value: ctsResultado)
        }
    }
    
    // MARK: - Instructor Section
    private var instructorSection: some View {
        VStack(spacing: 16) {
            SectionHeader(title: "Pago a Instructores", color: .green)
            
            InputField(title: "Horas semanales trabajadas", text: $horasSemanales, keyboardType: .numberPad)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("AFP (%)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Picker("AFP (%)", selection: $afpPorcentaje) {
                    Text("10%").tag(10.0)
                    Text("13%").tag(13.0)
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            ActionButton(title: "Calcular Pago", color: .green, action: calcularPagoInstructor)
            
            if mostrarResultadosInstructores {
                VStack(spacing: 8) {
                    ResultDisplay(title: "Sueldo Bruto", value: sueldoBruto)
                    ResultDisplay(title: "Descuento AFP (\(Int(afpPorcentaje))%)", value: descuentoAFP)
                    ResultDisplay(title: "Sueldo Neto", value: sueldoNeto, isHighlighted: true)
                }
            }
        }
    }
    
    // MARK: - Calculation Functions
    private func calcularCTS() {
        let sueldoValue = Double(sueldo) ?? 0
        let gratificacionValue = Double(gratificacion) ?? 0
        let mesesValue = Double(mesesTrabajados) ?? 6
        
        let sextaGratificacion = gratificacionValue / 6
        ctsResultado = (sueldoValue + sextaGratificacion) * (mesesValue / 12)
    }
    
    private func calcularPagoInstructor() {
        let horasValue = Double(horasSemanales) ?? 0
        sueldoBruto = horasValue * 50 * 4
        descuentoAFP = sueldoBruto * (afpPorcentaje / 100)
        sueldoNeto = sueldoBruto - descuentoAFP
        mostrarResultadosInstructores = true
    }
}

// MARK: - Reusable Components
struct SectionHeader: View {
    let title: String
    let color: Color
    
    var body: some View {
        Text(title)
            .font(.title2.bold())
            .foregroundColor(color)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct InputField: View {
    let title: String
    @Binding var text: String
    let keyboardType: UIKeyboardType
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            TextField("", text: $text)
                .keyboardType(keyboardType)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct ActionButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(color)
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(color: color.opacity(0.3), radius: 5, y: 3)
        }
    }
}

struct ResultDisplay: View {
    let title: String
    let value: Double
    var isHighlighted: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text("S/ \(String(format: "%.2f", value))")
                .fontWeight(isHighlighted ? .bold : .regular)
                .foregroundColor(isHighlighted ? .blue : .primary)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(8)
    }
}

// MARK: - Preview
#Preview {
    NavigationView {
        Aplicacion01()
    }
}
