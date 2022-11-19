import SwiftUI

struct ContentView: View {
	@State var searchText = ""
	@State var showCategories = false
	@State private var multiSelection = Set<UUID>()
	
	var body: some View {
		NavigationView {
			List {
				ForEach(messages, id: \.self) { message in
					logMessage(message)
				}
			}
			.searchable(text: $searchText, placement: .automatic)
			.navigationTitle("Logs")
			.navigationBarTitleDisplayMode(.inline)
			.listStyle(.plain)
			.font(.system(size: 14, weight: .semibold, design: .monospaced))
			.toolbar {
				ToolbarItem(placement: .navigationBarLeading) { 
					Button { 
						showCategories = true
					} label: { 
						Image(systemName: "line.3.horizontal.decrease.circle")
					}
				}
				ToolbarItem(placement: .navigationBarTrailing) { 
					Button { 
						
					} label: { 
						Image(systemName: "arrow.clockwise")
					}
				}
			}
			.sheet(isPresented: $showCategories) {
				NavigationView { 
					List(selection: $multiSelection) { 
						Text("UI")
						Text("UI")
						Text("UI")
					}
					.listStyle(.insetGrouped)
					.toolbar { 
						ToolbarItem(placement: .navigationBarLeading) { 
							Button("Clear", action: {})
						}
						ToolbarItem(placement: .navigationBarTrailing) { 
							Button("Close", action: {
								showCategories = false
							})
						}
					}
					.navigationTitle("Filter")
					.navigationBarTitleDisplayMode(.inline)
				}
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
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
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
