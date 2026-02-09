// The Swift Programming Language
// https://docs.swift.org/swift-book


@main
struct SwiftPlayground {
  static func main() {
    /// Initial vars to feed into the program.
    let lunches: [Double] = [6.50, 8.00, 5.75, 9.20, 7.10]
    let budget: Double = 35.00

    // Display the prices.
    RevisionTask.printPrices(lunches: lunches)

    let totalCost = RevisionTask.calculateTotalCost(prices: lunches)


    /// ----------------------------------
    /// Part 6. Snack loop.
    /// ----------------------------------
    let minSnackSpend: Double = 10.0
    let snackPrice: Double = 2.50
    var snacksTotal: Double = 0.0
    print()
    while snacksTotal < minSnackSpend {
      snacksTotal += snackPrice
      print("Snack total: $\(snacksTotal)")
    }

    // Print final totals.
    print("\nWeekly lunch total: $\(totalCost)")
    print("Snack total: $\(snacksTotal)")
    print("Combined total: $\(totalCost + snacksTotal)")
    print("Average lunch cost: $\(RevisionTask.averageCost(prices: lunches))")

    // Determine if they are over budget.
    if totalCost <= budget {
      print("You stayed within the budget.")
    } else {
      print("You overspent this week :(")
    }


    // Extension: Find most expensive day.
    if let (day, lunchCost) = lunches.enumerated().max { $0.1 < $1.1 } {
      print("Most expensive day:")
      print("Day \(day+1). Lunch chost: $\(lunchCost)")
    }
  }
}