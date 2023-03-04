
import SwiftUI

let addClosure = { (a: Int, b: Int) -> Int  in
  return a + b
}

let returnMax = { (a: [Int]) -> Int in
  return a.max { $0 < $1 }!
}

let upperCase = { (arr: [String]) -> () in
  return arr.forEach({ $0.uppercased() })
}

struct SumClosure: View {
  @State var sum: Int = 0
  @State var myMax: Int = 0
  var body: some View {
    Text("Sum: \(sum)")
    Text("Sum: \(myMax)")
    Button("Action"){
      sum = addClosure(2,3)
      myMax = returnMax([11,2,3,4,5])
    }
  }
}

struct SumClosure_Previews: PreviewProvider {
  static var previews: some View {
    SumClosure()
  }
}
