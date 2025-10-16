import SwiftUI
import MapKit
struct ContentView : View {
    @State private var style : Bool = false
    let pos = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    @State private var viewModel = ViewModel()
    var body : some View {
        if viewModel.isUnlocked{
            NavigationStack{
                VStack{
                    MapReader{proxy in
                        Map(initialPosition: pos){
                            ForEach(viewModel.locations) { location in
                                Annotation(location.name,coordinate: location.coordinate){
                                    Button{
                                        viewModel.selectedPlace = location
                                    } label : {
                                        Image(systemName: "star.circle")
                                            .resizable()
                                            .foregroundStyle(.red)
                                            .frame(width : 44, height: 44)
                                            .background(.white)
                                            .clipShape(.circle)
                                            .contentShape(Circle())
                                        
                                    }
                                }
                            }
                        }.sheet(item: $viewModel.selectedPlace){place in
                            EditView(location: place, onSave: {viewModel.update(location: $0)}){
                                viewModel.delete(location: $0)
                            }
                        }
                        .mapStyle(style == false ? .standard : .hybrid)
                        .onTapGesture {position in
                            if let cordinate = proxy.convert(position, from: .local){
                                viewModel.addLocation(at : cordinate)
                            }
                            
                            
                        }
                    }
                    
                } .toolbar{
                    Button(style == false ? "Hybrid" : "Standard"){
                        style.toggle()
                    }
                    .navigationTitle("EasyMap")
                    .navigationBarTitleDisplayMode(.inline)
                }
               
            }
        } else {
            Button("Unlock Places", action : viewModel.authenticate)
                .padding()
                .background(.blue)
                .foregroundStyle(.white)
                .clipShape(.capsule)
                
        }
    }
}
