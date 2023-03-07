
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
  return arr.filter{ $0 % 2 == 0 }
}

let returnTheFirstLetter = {(first: String, second: String) -> String in
  return "\(first.prefix(1)) --- \(second.prefix(1))"
}

func isEvenOrOdd(_ arr: [Int], evenOrOdd: Bool, _ closure: (_ myArr:[Int], _ even: Bool) -> [Int]) -> [Int] {
  return closure(arr, evenOrOdd)
}

let isEven = isEvenOrOdd([1, 2, 3, 4, 5, 6], evenOrOdd: true, { arr, evenOrOdd in
  let even = evenOrOdd ? 0 : 1
  return arr.filter { $0 % 2 == even }
})

func concatenateString(_ firstString: String, _ secondString: String, _ closure: (_ oneString:String, _ twoString: String) -> String ) -> String {
  return closure(firstString, secondString)
}

let addTwoStrings = concatenateString("to be","added together", { oneString,twoString in
  return "\(oneString) \(twoString)"
})

let product = { (a: Int) -> (Int) -> Int in
  return { (b: Int) -> Int in
    return a + b
  }
}

func onlyOneFigure (_ arr:[Int], _ closure: ( ([Int]) -> [Int])) -> [Int] {
  return closure(arr)
}

let callOnlyOneFigure =  onlyOneFigure([11, 2, 3, 4, 11, 55, 199], { arr in
  return arr.filter { $0 < 10 }
})

let sortDescending = {(arr: [Int]) -> [Int] in
  return arr.sorted { $0 > $1 }
}

struct SumClosure: View {
  @State private var sum: Int = 0
  @State private var myMax: Int = 0
  @State private var myUppercase: [String] = ["This","is","Sparta"]
  @State private var myOnlyEven: [Int] = [1,2,3,4,5,6]
  @State private var theFirstLetterOfStrings: String = "This"
  @State private var myIsEven = isEven
  @State private var myTwoStrings: String = ""
  @State private var productNum: Int = 2
  @State private var myOnlyFigure: [Int] = [11, 2, 3, 4, 11, 55, 199]
  @State private var sortIntArray: [Int] = [11, 22, 1, 3, 4, 566, 77, 10]
  
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
      
      print("myIsEven",myIsEven)
      
      myTwoStrings = addTwoStrings
      print("concatenateString",myTwoStrings)
      
      productNum = product(productNum)(productNum)
      print("product", productNum)
      
      
      myOnlyFigure = callOnlyOneFigure
      print("myOnlyFigure", myOnlyFigure)
      
      print("Not Sorted",sortIntArray)
      print("Sorted",sortDescending(sortIntArray))
    }
  }
}

struct SumClosure_Previews: PreviewProvider {
  static var previews: some View {
    SumClosure()
  }
}
