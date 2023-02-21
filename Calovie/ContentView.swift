//
//  ContentView.swift
//  Calovie
//
//  Created by Emmanuel Rose on 21/12/2021.
//

import SwiftUI

let grey = Color(red: 239/255, green: 243/255, blue: 244/255)
let login = "Manu"
let mdp = "azer"

struct ContentView: View {
    @State var username: String = ""
    @State var Password: String = ""
    @State var authfail: Bool = false
    @State var authSucced: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                userImage()
                TextTitre()
                LoginField(username: $username)
                PasswordField(Password: $Password)
                if authfail{
                    Text("Login/Mot de passe incorect !! ")
                        .offset(y:-10)
                        .foregroundColor(.red)
                }
                if authSucced{
                    NavigationLink(destination: RecetteView()) {
                        EmptyView()
                    }
                    
                }
                
                Button(action: {
                    if self.username == login && self.Password == mdp{
                        self.authSucced = true
                        self.authfail = false
                    }
                    else{
                        self.authfail = true
                        self.authSucced = false
                    }
                }){
                    BouttonLogin()
                }
            }
            .padding()
                
            }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct testView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct TextTitre: View {
    var body: some View {
        Text("Bienvenue, sur Calovie ! \nTon receuil  de recettes healthy")
            .fontWeight(.semibold)
            .padding()
    }
}

struct userImage: View {
    var body: some View {
        Image("Pokebowl")
            .resizable()
            .aspectRatio( contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom,75)
    }
}

struct BouttonLogin: View {
    var body: some View {
        Text("Connexion")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(35)
    }
}

struct LoginField: View {
    
    @Binding var username : String

    var body: some View {
        TextField("login", text: $username)
            .padding()
            .background(grey)
            .cornerRadius(5)
            .padding(.bottom,20)
    }
}

struct PasswordField: View {
    @Binding var Password : String
    
    var body: some View {
        SecureField("Mot de passe", text: $Password)
            .padding()
            .background(grey)
            .cornerRadius(5)
            .padding(.bottom,20)
    }
}
