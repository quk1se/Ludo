//
//  AuthentificationView.swift
//  Ludo
//
//  Created by moseu on 01.08.2024.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
    
        _ = scanner.scanCharacters(from: CharacterSet(charactersIn: "#"))
        
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue)
    }
}
enum ViewState {
    case registration
    case interests
}

struct AuthentificationView: View {
    @State private var username: String = ""
    @State private var pressedButton: String? = nil
    @State private var signUpActive: Bool = true
    
    @State private var currentState: ViewState = .registration
    var body: some View {
        NavigationView() {
            ZStack {
                Color(hex: "#14252C").ignoresSafeArea()
                VStack {
                    switch currentState {
                    case .registration:
                        HStack {
                            Button(action: { pressedButton = "signUpBtn"
                                swapAuthScreen()
                            }, label: { Text("Registration").frame(width: 100).padding(15)}).background(signUpActive ? Color(hex: "273C41") : nil).cornerRadius(5)
                            Button(action: { pressedButton = "signInBtn"
                                swapAuthScreen()
                            }, label: { Text("Log in").frame(width: 100).padding(15)}).background(!signUpActive ? Color(hex: "273C41") : nil).cornerRadius(5)
                        }.foregroundColor(.white).padding(.top)
                        if (signUpActive) {
                            VStack {
                                Text("Registration").font(.custom("Futura", size: 55)).foregroundColor(.white).padding(.top, 150)
                                Spacer()
                                VStack {
                                    TextField("Username", text: $username).padding(8).foregroundColor(.white).background(Color(.white)).cornerRadius(5).padding(.horizontal, 45)
                                    TextField("Email", text: $username).padding(8).foregroundColor(.white).background(Color(.white)).cornerRadius(5).padding(.horizontal, 45).padding(.top, 15)
                                    TextField("Password", text: $username).padding(8).foregroundColor(.white).background(Color(.white)).cornerRadius(5).padding(.horizontal, 45).padding(.top, 15)
                                }
                                Spacer()
                                Button(action: {
                                    currentState = .interests
                                }, label: {
                                    Text("Sign up").frame(width: 100).padding(.top, 20).padding(.bottom, 20).padding(.horizontal, 50).font(.custom("Futura",size: 15))
                                }).background(Color(hex: "#273C41")).foregroundColor(.white).cornerRadius(10).padding(.bottom, 20)
                            }
                        }
                        else {
                            VStack {
                                Text("Log in").font(.custom("Futura", size: 55)).foregroundColor(.white).padding(.top, 150)
                                Spacer()
                                VStack {
                                    TextField("Email", text: $username).padding(8).foregroundColor(.white).background(Color(.white)).cornerRadius(5).padding(.horizontal, 45).padding(.top, 15)
                                    TextField("Password", text: $username).padding(8).foregroundColor(.white).background(Color(.white)).cornerRadius(5).padding(.horizontal, 45).padding(.top, 15)
                                }
                                Spacer()
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("Sign in").frame(width: 100).padding(.top, 20).padding(.bottom, 20).padding(.horizontal, 50).font(.custom("Futura",size: 15))
                                }).background(Color(hex: "#273C41")).foregroundColor(.white).cornerRadius(10).padding(.bottom, 20)
                            }
                        }
                    case .interests:
                        InterestsView()
                    }
                }
            }
        }
    }
    
    func swapAuthScreen() {
        if (pressedButton == "signUpBtn") {
            signUpActive = true
        }
        else {
            signUpActive = false
        }
    }
}

#Preview {
    AuthentificationView()
}

struct InterestsView: View {
    @State private var interests = ["Csgo","Dota","Valorant","123","123","123","123","123"]
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ZStack {
            Color(hex: "#14252C").ignoresSafeArea()
            VStack {
                Text("Choose your interests").font(.custom("Futura",size: 20)).foregroundColor(.white).padding(.bottom, -10)
                ZStack {
                    Color(hex: "#070F12").cornerRadius(20)
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                                        ForEach(interests, id: \.self) { item in
                                            Text(item)
                                                .frame(width: 70, height: 70)
                                                .padding()
                                                .background(Color(hex: "#45575B"))
                                                .cornerRadius(10)
                                                .foregroundColor(.white)
                                                .font(.custom("Futura", size: 18))
                                        }
                                    }
                                    .padding()
                    }.cornerRadius(20)
                }.padding()
            }
        }
    }
}
