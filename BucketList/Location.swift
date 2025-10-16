//
//  Location.swift
//  BucketList
//
//  Created by Pramath S on 15/09/25.
//

import Foundation
import MapKit
struct Location : Identifiable, Equatable, Codable {
    static let example = Location(id: UUID(), name: "UK", description: "Bad weather", latitude: 51.501, longitude: -0.141)
    var id : UUID
    var name : String
    var description : String
    var latitude : Double
    var longitude : Double
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude : latitude, longitude : longitude)
    }
    static func ==(lhs : Location,rhs : Location)->Bool {
        lhs.id == rhs.id
    }
}
