// The Swift Programming Language
// https://docs.swift.org/swift-book

enum YesNoResponse: String {
  case Yes = "y"
  case No = "n"
}

/// Gets an input from the user of either yes or no.
///
/// Accepts "y" or "n" (and their capitalized versions)
/// as valid inputs.
/// 
///  - Return: Whether they said Yes or No.
func getYesNoInput(question: String) -> YesNoResponse { 
  let validResponses: [String] = ["y", "n"]

  while true {
    // Ask the question.
    print(question, "\nYes(y, yes) or No(n, no)?")

    if let response = readLine() {
      if validResponses.contains(response.lowercased()) { 
        return YesNoResponse(rawValue: response.lowercased())!
      }
    }
  }
}


@main
struct SwiftPlayground {
  static func main() {
    /// Initial vars to feed into the program.
    let lunches: [Double] = [6.50, 8.00, 5.75, 9.20, 7.10]
    let budget: Double = 35.00

    // Display the prices.
    RevisionTask.printPrices(lunches: lunches)

    // Determine if they are over budget.
    let totalCost = RevisionTask.calculateTotalCost(prices: lunches)
    if totalCost <= budget {
      print("You stayed within the budget.")
    } else {
      print("You overspent this week :(")
    }

    /// ----------------------------------
    /// Part 5. Snack loop.
    /// ----------------------------------
    let minSnackSpend: Double = 10.0
    let snackPrice: Double = 2.50

    var snacksTotal: Double = 0.0


    // Loop until `snacksTotal` is more than $10
    var stopBuyingSnacks: Bool = false
    while !stopBuyingSnacks {
      // Ask if they want another snack.
      let buyAnotherSnack: YesNoResponse = getYesNoInput(question: "Buy another snack?")
      
      // Check result.
      if buyAnotherSnack == YesNoResponse.Yes {
        snacksTotal += snackPrice
        
        // Print the new total.
        print("Total spent on snacks: $\(snacksTotal)")

        // Check if the loop should end.
        if snacksTotal >= minSnackSpend {
          // Ask the user if they want to stop buying.
          let response = getYesNoInput(question: "Stop buying more snacks?") 
          if response == YesNoResponse.Yes {
            stopBuyingSnacks = true
          }
        }
      }
    }

    print("You have bought \(Int(snacksTotal/snackPrice)) snacks at a cost of \(snacksTotal)")
  }
}

/*

let numItems = items.count

return totalCost / Double(numItems)

*/