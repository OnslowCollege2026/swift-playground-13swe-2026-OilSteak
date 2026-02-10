// The Swift Programming Language
// https://docs.swift.org/swift-book


func wordLengthFilter(words: [String], minLength: Int) -> [String] {
  return words.filter { word in 
    word.count > minLength 
  }
}

func analyseScores(scores: [Int]) -> Double {
  // Curve the scores.
  let curvedScores = scores.map {$0 + 5}
  // print("Curved scores: \(curvedScores)")

  // Only keep passing scores.
  let passingScores = curvedScores.filter { score in  
    score >= 50  //! Yes this is a magic number, no I dont't care to remove it.
  }
  // print("Passing scores: \(passingScores)")

  // Average these passing scores.
  let scoresTotal = passingScores.reduce(0, +)
  let averageScore = Double(scoresTotal) / Double(passingScores.count)
  
  return averageScore
}


@main
struct SwiftPlayground {
  static func main() {

    // -----------------------------------------
    // Task: Filter only >5 letter words.
    // -----------------------------------------
    let words = ["apple", "cat", "banana", "dog", "grape", "kiwi"]

    let fourLetterWords = wordLengthFilter(words: words, minLength: 4)
    print(fourLetterWords)

    // -----------------------------------------
    // Task 1: Sum numbers in an array.
    // -----------------------------------------
    let numbers = [7, 14, 21, 28, 35]
    let numbersTotal = numbers.reduce(0, +)
    print("[TASK 1] Numbers total: \(numbersTotal)")

    // -----------------------------------------
    // Task 2: Longest word.
    // -----------------------------------------
    let longestWordsInput = ["apple", "banana", "grape", "strawberry", "kiwi"]

    let longestWord = longestWordsInput.reduce("") { result, word in 
      if result.count > word.count {
        return result
      }
      return word
    }
    print("[TASK 2] Longest word: \(longestWord)")

    // -----------------------------------------
    // Task: Analysing students' scores.
    // -----------------------------------------
    let scores = [45, 78, 89, 32, 50, 92, 67, 41, 99, 56]

    let averageScore = analyseScores(scores: scores)
    print("Average score: \(averageScore)")
  }
}
