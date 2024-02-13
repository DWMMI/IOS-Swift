import SwiftUI

struct ContentView: View {
  @State private var searchText = ""
  @State private var selectedTab = 0

  var body: some View {
    NavigationView {
      TabView(selection: $selectedTab) {
        LaOllaView(searchText: $searchText)
          .tabItem {
            Label("LaOlla", systemImage: "flame")
          }
          .tag(0)
        
        AddView()
          .tabItem {
            Label("Añadir", systemImage: "plus.circle")
          }
          .tag(1)
        
        ListView()
          .tabItem {
            Label("Lista", systemImage: "list.bullet")
          }
          .tag(2)
        
        ProfileView()
          .tabItem {
            Label("Perfil", systemImage: "person")
          }
          .tag(3)
      }
     // .navigationBarTitle("App")
     // .navigationBarItems(trailing: SearchBar(text: $searchText))
    }
  }
}

struct LaOllaView: View {
  @Binding var searchText: String
  var body: some View {
      
    var elementos = 1...10
      Form(content: {
          SearchBar(text: $searchText)
          ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.flexible())]) {
                    ForEach(elementos, id: \.self) { numero in
                        Text("\(numero)")
                            .frame(width: 50, height: 50)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                .padding()
            }
      })
  }
}
    

struct AddView: View {
  var body: some View {
    Text("Placeholder para añadir tareas o elementos a la lista")
  }
}

struct ListView: View {
  var body: some View {
    Text("Placeholder para mostrar la lista de compras")
  }
}

struct ProfileView: View {
  var body: some View {
    Text("Placeholder para mostrar el perfil del usuario")
  }
}

struct SearchBar: View {
  @Binding var text: String
  
  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
      TextField("Buscar...", text: $text)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
