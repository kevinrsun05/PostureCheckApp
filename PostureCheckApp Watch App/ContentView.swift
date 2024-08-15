import SwiftUI
import CoreMotion
import UserNotifications

struct ContentView: View {
    @State private var selectedOption = "30 min"
    @State private var selectedTimeInterval: TimeInterval = 1800
    let options = ["30 min", "1 hr", "2 hr"]
    let timeIntervals: [TimeInterval] = [1800, 3600, 7200]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Reminders every:")
                    .font(.system(size: 16))
                    .padding(.bottom, 5)
                
                Picker("Select Interval", selection: $selectedOption) {
                    ForEach(options, id: \.self) { option in
                        Text(option)
                            .font(.system(size: 16))
                    }
                }
                .labelsHidden()
                .pickerStyle(.wheel)
                .onChange(of: selectedOption) {
                    if let index = options.firstIndex(of: selectedOption) {
                        selectedTimeInterval = timeIntervals[index]
                    }
                }
            }
            .padding()
            .frame(height: 90)
            .navigationTitle("Posture")
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
