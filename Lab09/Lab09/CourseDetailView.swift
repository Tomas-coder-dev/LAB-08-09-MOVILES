import SwiftUI

struct CourseDetailView: View {
    let course: Cursos  // Cambiado a tu clase Cursos
    
    var body: some View {
        VStack(spacing: 20) {
            Text(course.title)
                .font(.largeTitle)
                .bold()
            Text("Language: \(course.language)")
                .foregroundColor(.blue)
            Text(course.description)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }
        .padding()
        .navigationTitle(course.title)
    }
}

struct CourseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetailView(course: Cursos(
            title: "Ejemplo",
            language: "Swift",
            description: "Curso de ejemplo."
        ))
    }
}
