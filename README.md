# SerializableSwift
Convert swift class to dictionary

Usage:
```swift
class Location: Serializable {
    var latitude: Double
    var longitude: Double
    var accuracy: Double?
    
    init(latitude: Double, longitude: Double, accuracy: Double?) {
        self.latitude = latitude
        self.longitude = longitude
        self.accuracy = accuracy
    }
}

var locationAcc = Location(latitude: 40.4381307, longitude: -3.8199675, accuracy: 37.5)
// Optional(["accuracy": 37.5, "longitude": -3.8199675, "latitude": 40.4381307])

var location = Location(latitude: 40.4381307, longitude: -3.8199675, accuracy: nil)
// Optional(["longitude": -3.8199675, "latitude": 40.4381307])
```
