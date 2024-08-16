//
//  Workout.swift
//  D5
//
//  Created by Joseph DeWeese on 8/13/24.
//

import SwiftUI
import SwiftData


@Model
class Workout {
    var title: String
    var briefDesc: String
    var dateScheduled: Date
    var nextDate: Date
    var dateCompleted: Date
    
    var workoutType: WorkoutType.RawValue
    
    @Relationship(deleteRule: .cascade)
    var exercises: [Exercise]?
    @Relationship(deleteRule: .cascade)
    var historyList: [History]?
    
    init(
        title: String,
        briefDesc: String,
        dateScheduled: Date = Date.distantFuture,
        nextDate: Date = Date.distantFuture,
        dateCompleted: Date = Date.distantPast,
        workoutType: WorkoutType = .BASE
        
    ) {
        self.title = title
        self.briefDesc = briefDesc
        self.dateScheduled = dateScheduled
        self.nextDate = nextDate
        self.dateCompleted = dateCompleted
        self.workoutType = workoutType.rawValue
        
    }
    var icon: Image {
        switch WorkoutType(rawValue: workoutType)! {
        case .CARDIO:
            Image(systemName: "figure.mixed.cardio.circle")
        case .YOGA:
            Image(systemName: "figure.yoga.circle")
        case .CYCLING:
            Image(systemName: "figure.outdoor.cycle.circle")
        case .STRETCH:
            Image(systemName: "figure.flexibility.circle")
        case .BASE:
            Image(systemName: "figure.mixed.cardio.circle")
        case .GRAPPLING:
            Image(systemName: "figure.wrestling.circle")
        case .HIIT:
            Image(systemName: "figure.step.training.circle")
        case  .POWER:
            Image(systemName: "figure.strengthtraining.traditional.circle")
        case .RUNNING:
            Image(systemName: "figure.run.circle")
        case .SWIMMING:
            Image(systemName: "figure.pool.swim.circle")
        case .WALKING:
            Image(systemName: "figure.walk.circle")
        case .RECOVERY:
            Image(systemName: "figure.mind.and.body.circle")
        case .STRENGTH:
            Image(systemName: "figure.core.training.circle")
        case .NEW_PR:
            Image(systemName: "figure.core.training.circle")
        }
    }
    
    }
    
    enum WorkoutType: String, CaseIterable, Identifiable, Codable {
        
        case YOGA
        case STRENGTH
        case STRETCH
        case WALKING
        case CARDIO
        case POWER
        case GRAPPLING
        case HIIT
        case RUNNING
        case SWIMMING
        case CYCLING
        case NEW_PR
        case BASE
        case RECOVERY
        
        var accentColor: Color {
            switch self {
            case .CARDIO, .GRAPPLING, .HIIT, .SWIMMING, .CYCLING, .NEW_PR, .BASE, .RECOVERY: return .white
            case .STRENGTH, .YOGA, .STRETCH, .WALKING, .POWER, .RUNNING: return .white
            }
        }
        var mainColor: Color {
            Color(rawValue)
        }
        var name: String {
            rawValue.capitalized
        }
        var id: String {
            name
        }
        
    }



