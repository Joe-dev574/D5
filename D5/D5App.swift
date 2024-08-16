//
//  D5App.swift
//  D5
//
//  Created by Joseph DeWeese on 8/13/24.
//

import SwiftUI
import SwiftData

@main
struct D5App: App {
    
    let container: ModelContainer
    var body: some Scene {
        WindowGroup {
            WorkoutsListView()
        }
//        .modelContainer(for: Book.self)
        .modelContainer(container)
    }
    
    init() {
        let schema = Schema([Workout.self])
        let config = ModelConfiguration("MyWorkouts", schema: schema)
        do {
            container = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Could not configure the container")
        }
//        let config = ModelConfiguration(url: URL.documentsDirectory.appending(path: "MyBooks.store"))
//        do {
//            container = try ModelContainer(for: Book.self, configurations: config)
//        } catch {
//            fatalError("Could not configure the container")
//        }
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
//        print(URL.documentsDirectory.path())
    }
}
