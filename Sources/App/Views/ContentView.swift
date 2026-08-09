#if canImport(SwiftUI)
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appData: AppData
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Image(systemName: "swift")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.orange)
                
                Text("Bienvenido a Swift en Windows")
                    .font(.title)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                
                Text("Esta app es 100% nativa en Swift.")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Button(action: {
                    appData.incrementCounter()
                }) {
                    Text("Tocado \(appData.counter) veces")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 40)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Swift en Windows")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(AppData())
    }
}
#endif
