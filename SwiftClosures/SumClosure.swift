
import SwiftUI

let addClosure = { (a: Int, b: Int) -> Int  in
  return a + b
}

let returnMax = { (a: [Int]) -> Int in
  return a.max { $0 < $1 }!
}

let upperCase = { (arr: [String]) -> [String] in
  return arr.map { $0.uppercased() }
}

let onlyEven = {(arr: [Int]) -> [Int] in
  return arr.filter{ ($0 % 2) == 0 }
}

struct SumClosure: View {
  @State var sum: Int = 0
  @State var myMax: Int = 0
  @State var myUppercase: [String] = ["This","is","Sparta"]
  @State var myOnlyEven: [Int] = [1,2,3,4,5,6]
  var body: some View {
    Text("Sum: \(sum)")
    Text("Max: \(myMax)")
    Button("Action"){
      sum = addClosure(2,3)
      myMax = returnMax([11,2,3,4,5])
      myUppercase = upperCase(myUppercase)
      myOnlyEven = onlyEven(myOnlyEven)
      print("This is all upperCase",myUppercase)
      print("only even", myOnlyEven)
    }
  }
}

struct SumClosure_Previews: PreviewProvider {
  static var previews: some View {
    SumClosure()
  }
}
