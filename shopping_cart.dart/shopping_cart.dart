void main() {
  List<double> itemPrices = [15.99, 5.49, 20.00, 7.99, 10.50];

  // Calculate total price
  double totalPrice = calculateTotal(itemPrices, tax: 0.08);
  print('Total price (with tax): \$${totalPrice.toStringAsFixed(2)}');

  // Filter items using an anonymous function
  var filteredItems = itemPrices.where((price) => price >= 10).toList();
  print('Filtered items (>= \$10): $filteredItems');

  // Apply discount
  double discountPercentage = 10; // 10% discount
  double discountedPrice = applyDiscount(itemPrices, discountPercentage);
  print('Price after discount: \$${discountedPrice.toStringAsFixed(2)}');

  // Calculate special discount based on factorial
  double factorialDiscount = calculateFactorialDiscount(itemPrices.length);
  double finalPrice = discountedPrice - (discountedPrice * (factorialDiscount / 100));
  print('Final price after special discount: \$${finalPrice.toStringAsFixed(2)}');
}

// Function to calculate total price with optional tax parameter
double calculateTotal(List<double> prices, {double tax = 0}) {
  double total = prices.reduce((a, b) => a + b);
  return total + (total * tax);
}

// Higher-order function to apply discount
double applyDiscount(List<double> prices, double discountPercentage) {
  return prices.map((price) => price - (price * (discountPercentage / 100))).reduce((a, b) => a + b);
}

// Recursive function to calculate factorial discount
double calculateFactorialDiscount(int n) {
  if (n <= 1) {
    return 1;
  } else {
    return n * calculateFactorialDiscount(n - 1);
  }
}
