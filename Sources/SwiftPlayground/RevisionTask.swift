

struct RevisionTask {
  static func printPrices(lunches: [Double]) {
    // Print the lunches.
    for (index, price) in lunches.enumerated() {
      print("Day \(index + 1): $\(price)")

      // Check if it is a 'expensive day' (anything over $9.00)
      if price > 9.00 {
        print("HIGH SPENDING DAY DETECTED")
      }  
    }
  }

  static func calculateTotalCost(prices: [Double]) -> Double {
    return prices.reduce(0, { x, y in x + y })
  }

  static func isOverBudget(total: Double, budget: Double) -> Bool {
    return total > budget
  }

  static func averageCost(prices: [Double]) -> Double {
    let numOfElements: Int = prices.count
    let totalPrice = calculateTotalCost(prices: prices)

    return totalPrice / Double(numOfElements)
  }
}