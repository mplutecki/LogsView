import SwiftUI

struct FilterView: View {
  @Binding var selectedCategories: Set<String>
  let onClose: () -> Void
  
  var body: some View {
    NavigationView {
      List(categories, id: \.self, selection: $selectedCategories) { category in
        Text(category)
      }
      .environment(\.editMode, .constant(EditMode.active))
      .listStyle(.insetGrouped)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button("Close", action: onClose)
        }
      }
      .navigationTitle("Filter")
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}

struct FilterView_Previews: PreviewProvider {
  static var previews: some View {
    FilterView(selectedCategories: .constant(Set<String>()), onClose: {})
  }
}

struct Row: View {
  let title: String
  let selected: Bool
  let action: () -> Void
  
  var body: some View {
    HStack {
      Button {
        action()
      } label: {
        Checkmark(selected: selected)
      }
      Text(title)
    }
  }
}

struct Checkmark: View {
  let selected: Bool
  
  var body: some View {
    if selected {
      Image(systemName: "checkmark.circle.fill")
    } else {
      Image(systemName: "circle")
    }
  }
}

let categories = [
  "UI",
  "API",
  "Polling",
  "Storage"
]
