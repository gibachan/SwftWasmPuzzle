import TokamakDOM

@main
struct TokamakApp: App {
    var body: some Scene {
        WindowGroup("Tokamak App") {
            PuzzleView()
                .background(Color.white)
        }
    }
}
