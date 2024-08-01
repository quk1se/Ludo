import SwiftUI

enum StartState {
    case welcome
    case registration
}

struct WelcomeView: View {
    @State private var currentState: StartState = .welcome
    var body: some View {
        ZStack {
            Color(hex: "14252C").ignoresSafeArea()
            VStack {
                switch currentState {
                case .welcome:
                    Text("Ludo")
                        .cornerRadius(10)
                        .foregroundColor(Color(hex: "#FFFFFF"))
                        .padding(.top, 150)
                        .font(.custom("Futura",size: 50))
                    Text("Ludo respects your privacy. We collect limited personal data to improve your experience. Your data is kept secure and used in accordance with our privacy policy. By clicking button under, you agree to these terms.")
                        .cornerRadius(10)
                        .foregroundColor(Color(hex: "#FFFFFF"))
                        .padding(.top, 300).padding(.horizontal, 35)
                        .multilineTextAlignment(.center)
                        .font(.custom("Futura",size: 15))
                    Spacer()
                    Button(action: {
                        currentState = .registration
                    }, label: {
                        Text("Get started")
                    }).padding(.top, 20)
                        .padding(.bottom, 20)
                        .padding(.horizontal, 50)
                        .font(.custom("Futura", size: 15))
                        .background(Color(hex: "#273C41"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                case .registration:
                    AuthentificationView()
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
