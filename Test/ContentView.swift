import SwiftUI
struct ContentView: View {
    @State var showMenu = false
    @State var count = 0
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                MainView(showMenu: self.$showMenu, count: self.$count)
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .offset(x: self.showMenu ? geometry.size.width : 0)
                    .disabled(self.showMenu ? true : false)
                if self.showMenu {
                    MenuView(showMenu: self.$showMenu, count: self.$count)
                        .frame(width: geometry.size.width)
                }
            }
        }
    }
}

struct MainView: View {
    @Binding var showMenu: Bool
    @Binding var count: Int
    var body: some View {
        Button(action: {
            self.showMenu = true
        }) {
            Text("Show Menu\(self.count)")
        }
    }
}

struct Content_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
