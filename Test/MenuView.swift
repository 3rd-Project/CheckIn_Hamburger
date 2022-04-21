import SwiftUI

struct MenuView: View {
    @Binding var showMenu: Bool
    @Binding var count: Int
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                self.showMenu = false
                self.count += 1
            }) {
                Text("close menu")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 100)
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Message")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Settings")
                    .foregroundColor(.gray)
                    .font(.headline)
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.black)
    }
}
