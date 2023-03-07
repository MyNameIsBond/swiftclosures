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

struct EscapingClosures: View {
  var body: some View {
    Text("Welcome to Escaping Closures")
  }
}

struct EscapingClosures_Previews: PreviewProvider {
  static var previews: some View {
    EscapingClosures()
  }
}
