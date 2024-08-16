//
//  WorkoutsListView.swift
//  D5
//
//  Created by Joseph DeWeese on 8/13/24.
//

import SwiftUI
import SwiftData


enum SortOrder: LocalizedStringResource, Identifiable, CaseIterable {
    case workoutType, title, briefDescription
    
    var id: Self {
        self
    }
}

struct WorkoutsListView: View {
    @Query private var workouts: [Workout]
    @State private var createNewWorkout = false
    @State private var carouselMode: Bool = false
    /// For Matched Geometry Effect
    @Namespace private var animation
    @State var width = UIScreen.main.bounds.width
    /// Detail View Properties
    @State private var showDetailView: Bool = false
    @State private var selectedWorkout: Workout?
    @State private var animateCurrentWorkout: Bool = false
    @State private var filter = ""
    
    var body: some View {
        //MARK:  WORKOUT LIST HEADER VIEW
        WorkoutListHeaderView()
        NavigationStack {
            
            
            //MARK:  SCROLL VIEW
            GeometryReader {
                let size = $0.size
                ScrollView(.vertical, showsIndicators: false) {
                    /// Books Card View
                    VStack(spacing: 35){
                        ForEach(workouts) { workout in
                            
                        WorkoutCardView()
                            
                        }
                        }
                      
                       
                    }
                }
            }
        }
    }

#Preview {
    WorkoutsListView()
}
