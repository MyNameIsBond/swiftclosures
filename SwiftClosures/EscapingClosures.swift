// Write a function that takes a closure as an argument
// and returns a closure. The closure returned should use the argument closure,
// but only if the argument closure hasn't escaped. Otherwise, it should return a default closure.

import SwiftUI

func escapingClosures(arr: [Int], closure: @escaping () -> Void) -> () -> Void {
  
  var hasEscaped = false
  
  let defaultClosure = {
    print("default closure")
  }
  
  let escapedClosure = {
    hasEscaped = true
    closure()
  }
  
  return {
    if hasEscaped {
      defaultClosure()
    } else {
      
    }
  }
  
}

func arrayOfClusres(_ closures: [(Int) -> Int]) -> (Int) -> Int  {
  return { value in
    return closures.reduce(value) { result, closure in
      return closure(result)
    }
  }
}

let myClosures: [(Int) -> Int] = [
    { value in value * 2 },
    { value in value * 3 },
    { value in value * 2 }
]



// The way to call this array of closures

struct EscapingClosures: View {
    @State var myresult: Int = 10
  var body: some View {
    Text("Welcome to Escaping Closures")
    Button("Result") {
      let combinedClosure = arrayOfClusres(myClosures)
      let result = combinedClosure(myresult) // Should be 11
      myresult = result
      print(myresult)
    }
  }
}

struct EscapingClosures_Previews: PreviewProvider {
  static var previews: some View {
    EscapingClosures()
  }
}
