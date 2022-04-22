import SwiftUI

struct MenuView: View {
    struct test {
        var id = UUID()
        var icon: String
        var text: String
    }
    @State var testList = [test(icon: "person", text: "Profile"),
                           test(icon: "envelope", text: "Message"),
                           test(icon: "gear", text: "Settings")]
    @Binding var showMenu: Bool
    @Binding var count: Int
    var body: some View {
        NavigationView {
            List {
                ForEach(testList, id: \.id) { test in
                    HStack {
                        Image(systemName: test.icon)
                            .foregroundColor(.gray)
                            .imageScale(.large)
                        Text(test.text)
                            .foregroundColor(.gray)
                            .font(.headline)
                    }
                }
                .onMove{sourceIndices, destinationIndex in
                    self.testList.move(fromOffsets: sourceIndices, toOffset: destinationIndex)
                }
                .onDelete{ indexSet in
                    self.testList.remove(atOffsets: indexSet)
                }
            }
            .navigationBarTitle("Test", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                withAnimation {
                    self.showMenu = false
                    self.count += 1
                }
            }) {
                Text("close")
            }, trailing: EditButton())
        }
    }
}