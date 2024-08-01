//
//  MainView.swift
//  Ludo
//
//  Created by moseu on 01.08.2024.
//

import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 60, height: 60)
            .background(Color(hex: "#273C41"))
            .foregroundColor(.white)
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

enum AuthState {
    case main
    case search
    case profile
    case settings
}

struct MainView: View {
    @State private var currentState: AuthState = .main

    var body: some View {
        ZStack {
            Color(hex: "14252C").ignoresSafeArea()
            
            VStack {
                switch currentState {
                            case .main:
                                SwapView()
                            case .search:
                                SearchView()
                            case .profile:
                                ProfileView()
                            case .settings:
                                SettingsView()
                            }
                HStack(spacing: 30) {
                    Button(action: { currentState = .settings }, label: { Text("S") })
                    Button(action: { currentState = .search}, label: { Text("F") })
                    Button(action: { currentState = .main }, label: { Text("M") })
                    Button(action: { currentState = .profile }, label: { Text("P") })
                }
                .padding(.bottom, 10)
                .buttonStyle(CustomButtonStyle())
            }
            
        }
    }
}
struct SwapView: View {
    var body: some View {
        Text("Ludo")
            .foregroundColor(.white)
            .font(.custom("Futura", size: 30))
        Spacer()
        
        ZStack {
            VStack {
                ZStack {
                    Color(.white).cornerRadius(20)
                    VStack {
                        VStack {
                            Spacer()
                            Text("moseu")
                                .font(.custom("Futura", size: 25))
                            Text("age: 19")
                                .font(.custom("Futura", size: 19))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 20) {
                            Text("Dota")
                            Text("CS2")
                            Text("Valorant")
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 50)
                }
                .frame(width: .infinity, height: .infinity)
                .padding(.horizontal, 30)
                .padding(.top, 10)
                .padding(.bottom, 20)
                .cornerRadius(20)
                
            }
        }
        .frame(width: .infinity, height: .infinity)
    }
}

struct SearchView: View {
    var body: some View {
        Text("Sign Up View")
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding(.top, 150)
    }
}
struct ProfileView: View {
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Color(.black).opacity(0).cornerRadius(20)
                    VStack(spacing: 15) {
                        //Image(.avatar).resizable().frame(width: 150, height: 150).cornerRadius(100).padding(.top)
                        Text("Username").font(.custom("Futura", size: 30)).foregroundColor(.white)
                        HStack {
                            Text("My interests")
                            Spacer()
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Change")
                            })
                        }.font(.custom("Futura", size: 20)).foregroundColor(.white)
                        VStack {
                        
                        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color(.black)).opacity(0.3).cornerRadius(20)
                    }
                }.padding(.horizontal, 15)
                .frame(width: .infinity, height: .infinity)
                .padding(.bottom,5)
            }
        }
        .frame(width: .infinity, height: .infinity)
    }
}

struct SettingsView: View {
    var body: some View {
        ZStack {
            VStack {
                ZStack {
                    Color(.black).opacity(0).cornerRadius(20)
                    ScrollView {
                        VStack {
                            Text("Sort things").foregroundColor(.white)
                        }.frame(width: 350, height: 150).background(.black).cornerRadius(10)
                        VStack {
                            Text("Sort things").foregroundColor(.white)
                        }.frame(width: 350, height: 150).background(.black).cornerRadius(10)
                        VStack {
                            Text("Sort things").foregroundColor(.white)
                        }.frame(width: 350, height: 150).background(.black).cornerRadius(10)
                        VStack {
                            Text("Sort things").foregroundColor(.white)
                        }.frame(width: 350, height: 150).background(.black).cornerRadius(10)
                        VStack {
                            Text("Sort things").foregroundColor(.white)
                        }.frame(width: 350, height: 150).background(.black).cornerRadius(10)
                    }.padding(.top, 5).cornerRadius(10)
                }.padding(.horizontal, 15)
                .frame(width: .infinity, height: .infinity)
                .padding(.bottom,5)
            }
        }
        .frame(width: .infinity, height: .infinity)
    }
}

#Preview {
    MainView()
}
