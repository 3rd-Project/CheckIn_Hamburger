import SwiftUI

struct ContentView: View {
    @State var showMenu = false
    @State var count = 0
    var body: some View {
        GeometryReader { geometry in
            MainView(showMenu: self.$showMenu, count: self.$count)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .offset(x: self.showMenu ? geometry.size.width : 0)
            if self.showMenu {
                MenuView(showMenu: self.$showMenu, count: self.$count)
                    .frame(width: geometry.size.width)
            }
        }
    }
}

struct MainView: View {
    @Binding var showMenu: Bool
    @Binding var count: Int
    var body: some View {
        VStack (alignment: .leading) {
            HStack (alignment: .top) {
                Button(action: {
                    withAnimation {
                        self.showMenu = true
                    }
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
                .padding(.top, 17)
                .padding(.leading, 23)
                Spacer()
            }
            Spacer()
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}