
import SwiftUI

let addClosure = { (a: Int, b: Int) -> Int  in
  return a + b
}

struct SumClosure: View {
    var body: some View {
        Text("")
    }
}

struct SumClosure_Previews: PreviewProvider {
    static var previews: some View {
        SumClosure()
    }
}
