//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Pramath S on 16/09/25.
//
import CoreLocation
import Foundation
import CoreLocation
import MapKit
import LocalAuthentication

extension ContentView{
    @Observable
    class ViewModel{
        var isUnlocked = false
        let savePath = URL.documentsDirectory.appending(path: "SavePlace")
        private(set) var locations : [Location]
        var selectedPlace : Location?

        func addLocation(at point : CLLocationCoordinate2D){
            let newLocation = Location(id: UUID(), name: "", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
            save()
        }
        init(){
            do{
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
                
            }catch{
                locations = []
            }
        }
        func save(){
            do{
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath,options : [.atomic,.completeFileProtection])
                
            }catch {
                print("Could Not Save")
            }
        }
        func update(location : Location){
            guard let selectedPlace else {return}
            if let index = locations.firstIndex(of: selectedPlace){
                locations[index] = location
            }
            save()
        }
        func delete(location : Location){
            guard let selectedPlace else {return}
            if let index = locations.firstIndex(of: selectedPlace){
                locations.remove(at: index)
            }
            save()
        }
        func authenticate(){
            let context = LAContext()
            var error : NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Map Unlock"){success,failure in
                    if success{
                        self.isUnlocked = true
                    } else{
                      
                    }
                    
                }
            }else{
                //No biometrics
            }
        }
    }
}
