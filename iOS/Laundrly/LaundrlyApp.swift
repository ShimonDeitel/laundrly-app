import SwiftUI

@main
struct LaundrlyApp: App {
    @StateObject private var store = LaundrlyStore()
    @StateObject private var purchases = PurchaseManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(store)
                .environmentObject(purchases)
                .onChange(of: purchases.isPro) { _, newValue in
                    store.isPro = newValue
                }
                .task {
                    store.isPro = purchases.isPro
                }
        }
    }
}
