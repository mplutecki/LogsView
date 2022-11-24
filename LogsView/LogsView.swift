import SwiftUI

struct LogsView: View {
  @State var searchText = ""
  @State var showCategories = false
  @State var selectedCategories = Set<String>()
  
  var body: some View {
    NavigationView {
      List(messages, id: \.self) { message in
        logMessage(message)
      }
      .searchable(text: $searchText, placement: .automatic)
      .navigationTitle("Logs")
      .navigationBarTitleDisplayMode(.inline)
      .listStyle(.plain)
      .font(.system(size: 14, weight: .semibold, design: .monospaced))
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          filterButton
        }
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            
          } label: {
            Image(systemName: "arrow.clockwise")
          }
        }
      }
      .sheet(isPresented: $showCategories) {
        FilterView(selectedCategories: $selectedCategories, onClose: {
          showCategories = false
        })
      }
    }
  }
  
  func logMessage(_ message: String) -> some View {
    VStack(alignment: .leading, spacing: 4) {
      HStack {
        Text("13:33:33")
        Text("[UI]")
      }
      .font(.system(size: 12, design: .monospaced))
      .foregroundColor(.gray)
      Text(message)
    }
  }
  
  var filterButton: some View {
    Button {
      showCategories = true
    } label: {
      if selectedCategories.isEmpty {
        Image(systemName: "line.3.horizontal.decrease.circle")
      } else {
        Image(systemName: "line.3.horizontal.decrease.circle.fill")
      }
    }
  }
}

struct LogsView_Previews: PreviewProvider {
  static var previews: some View {
    LogsView()
  }
}

let messages = [
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message",
  "Message"
]
