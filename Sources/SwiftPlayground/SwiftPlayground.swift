// The Swift Programming Language
// https://docs.swift.org/swift-book


// Task A:
func hiddenNumbers(_ values: [String]) {
  // Use compactMap to keep only the numbers and convert them to Int, then print the result.
  let convertedNumbers = values.compactMap { Int($0) }
  print("Remaining numbers: \(convertedNumbers)")

  // Then, as an alternative check, use allSatisfy on the original array to test if every
  // item is a number string.
  let isAllNumbers = values.allSatisfy { Int($0) != nil }
  if isAllNumbers {
    print("All the values are number strings")
  } else {
    print("The values are NOT all number strings")
  }
}

// Task B (Now 'Task D'):
func hauntedArchives(archives: [[[[String]]]]) {
  // Old task
  // if let wantedItem = archives.last?.last?.last?.first {
  //   print("The first item of the last item of the last item of the last item: \(wantedItem)")
  // } else {
  //   print("The first item of the last item of the last item of the last item doesn't exist")
  // }

  // Find the first word that starts with "e" on the last shelf that contains an "e" word in the
  //  last room that contains any 4-letter word in the last wing that contains any word starting 
  // with "e".

  // Find the wing.
  let targetWing = archives.last { wing in
    wing.contains { room in 
      room.contains { shelf in 
        shelf.contains { word in
          word.first == "e"
        }
      }
    }
  }

  // Find the room
  let targetRoom = targetWing?.last { room in
    room.contains { shelf in
      shelf.contains { $0.count == 4 }
    }
  }

  // Find the shelf
  let targetShelf = targetRoom?.last {shelf in 
    shelf.contains { $0.contains("e") }
  }

  // Find the word.
  let targetWord = targetShelf?.first { $0.first == "e" }

  // Print everything.
  print("Target wing: \n", targetWing ?? "No valid wing")
  print("Target room: \n", targetRoom ?? "No valid room")
  print("Target shelf: \n", targetShelf ?? "No valid shelf")
  print("Target word: \n", targetWord ?? "No valid word")
}

func theMidnightFilter(sightings: [(String, Int)]) {


  // Filter the sightings.
  let validSightings = sightings.filter { $0.0.first == "m" || $0.0.first == "w" }  //! Attrocious but idc.
  print("Valid sightings: \(validSightings)")

  // Assert that sightings isn't empty.
  guard !validSightings.isEmpty else {
    print("ERROR: `sightings` is empty.")
    return
  }

  let validSightingScores = validSightings.map { $0.1 }
  print("Scores for these valid sightings: \(validSightingScores)")

  let totalValidSightings = validSightingScores.reduce(0, +)
  print("Total valid sightings: \(totalValidSightings)")

  // These force-unwrappings are safe since validSightings is guaranteed to be non-empty.
  let leastSeen = validSightings.min { $0.1 < $1.1 }!
  let mostSeen = validSightings.max { $0.1 < $1.1 }!
  print("Least seen: \(leastSeen)")  
  print("Most seen: \(mostSeen)")
}

// Task D:
func accepts(value: String, isValid: (String) -> Bool) -> Bool {
  return isValid(value)
}

@main
struct SwiftPlayground {
  static func main() {
    
    // Task A:
    let mixed = ["cat", "7", "owl", "15", "dog", "3"]
    hiddenNumbers(mixed)

    // Task B:
    let archive = [
      [
        [["candle", "dust"], ["mirror", "ash"]],
        [["whisper", "shadow"], ["clock", "veil"]]
      ],
      [
        [["stone", "key"], ["relic", "name"]],
        [["cipher", "bone"], ["ember", "seal"]]
      ],
      [
        [["feather", "ink"], ["glow", "eclipse"]],
        [["riddle", "echo"], ["ember", "glyph"]]
      ]
    ]
    hauntedArchives(archives: archive)

    // Task C:
    let sightings = [
      (name: "moth", score: 3),
      (name: "wolf", score: 9),
      (name: "raven", score: 4),
      (name: "mist", score: 7),
      (name: "wisp", score: 2)
    ]
    theMidnightFilter(sightings: sightings)

    // Task D:
    let sample = "moonlight"
    // First closure: Only accepts lowercased words.
    // let sampleIsValid = accepts(value: sample) { $0 == $0.lowercased() }

    // Second closure: Only accepts >8 letter words.
    let sampleIsValid = accepts(value: sample) { $0.count > 8 }
    
    print("Sample is valid: \(sampleIsValid)")

  }
}
