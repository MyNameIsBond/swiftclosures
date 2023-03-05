
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

let returnTheFirstLetter = {(first: String, second: String) -> String in
  return "\(first.prefix(1)) --- \(second.prefix(1))"
}

func isEvenOrOdd(_ arr: [Int], evenOrOdd: Bool, _ closure: (_ myArr:[Int], _ even: Bool) -> [Int]) -> [Int] {
  return closure(arr, evenOrOdd)
}

let isEven = isEvenOrOdd([1,2,3,4,5], evenOrOdd: false, { (arr: [Int], evenOrOdd: Bool) -> [Int] in
  let even = evenOrOdd ? 0 : 1
  return arr.filter { ($0 % 2) == even }
})

struct SumClosure: View {
  @State var sum: Int = 0
  @State var myMax: Int = 0
  @State var myUppercase: [String] = ["This","is","Sparta"]
  @State var myOnlyEven: [Int] = [1,2,3,4,5,6]
  @State var theFirstLetterOfStrings: String = "This"
  var body: some View {
    Text("Sum: \(sum)")
    Text("Max: \(myMax)")
    Button("Action"){
      sum = addClosure(2,3)
      myMax = returnMax([11,2,3,4,5])
      
      myUppercase = upperCase(myUppercase)
      print("This is all upperCase",myUppercase)
      
      myOnlyEven = onlyEven(myOnlyEven)
      print("only even", myOnlyEven)
      
      theFirstLetterOfStrings = returnTheFirstLetter(theFirstLetterOfStrings, theFirstLetterOfStrings)
      print("first Chars", theFirstLetterOfStrings)
    }
  }
}

struct SumClosure_Previews: PreviewProvider {
  static var previews: some View {
    SumClosure()
  }
}
