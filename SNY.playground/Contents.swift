import UIKit

let array = [1, 2, 4, 5, 8, 9, 10]
let key = 1

///--------------------------------------Algorithm--------------------------------------------------------------
///--------------------------------------Algorithm--------------------------------------------------------------
///--------------------------------------Algorithm--------------------------------------------------------------

/// Binary search (one thing compulsary for BS is the given array shoud be sorted by asending or desending)
/// Time complexity: log(n)
func binarySearch(array: [Int], key: Int) -> Bool {
    let size = array.count
    var minIndex = 0
    var maxIndex = size - 1
    var midIndex = size / 2
    if key > array[maxIndex] || key < array[minIndex] {
        return false
    }
    while minIndex <= maxIndex {
        let midValue = array[midIndex]
        if key == midValue {
            return true
        }
        if key > midValue {
            minIndex = midIndex + 1
        } else {
            maxIndex = midIndex - 1
        }
        midIndex = minIndex + ((maxIndex - minIndex + 1) / 2)
    }
    return false
}
binarySearch(array: array, key: key)

/// Merge sort
/// Time complexity: nlog(n) for all casess
func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else { return array }
    
    let middleIndex = array.count / 2
    
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    
    return merge(leftArray, rightArray)
}

func merge<T: Comparable>(_ left: [T], _ right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedArray: [T] = []
    
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElement = right[rightIndex]
        
        if leftElement < rightElement {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            orderedArray.append(rightElement)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    while leftIndex < left.count {
        orderedArray.append(left[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < right.count {
        orderedArray.append(right[rightIndex])
        rightIndex += 1
    }
    
    return orderedArray
}
mergeSort([2, 3, 6, 7, 9])

///--------------------------------------Algorithm--------------------------------------------------------------
///--------------------------------------Algorithm--------------------------------------------------------------
///--------------------------------------Algorithm--------------------------------------------------------------



///--------------------------------------iOS knowledges--------------------------------------------------------------
///--------------------------------------iOS knowledges--------------------------------------------------------------
///--------------------------------------iOS knowledges--------------------------------------------------------------

/// Upwrap optional: We can use ? and ! to unwrap
struct SNY {
    var company: String?
    var year: Int?
}
var sny: SNY?
let year: Int? = sny?.year /// Safe unwrap
let year1: Int! = sny?.year ?? 0 /// Default value
///let year2 = sny!.year /// Unsafe unwrap

/// Pair in Swift (Same in C++)
var pairs: [(String, Int)] = []
pairs.append(("tam", 1))
pairs.append(("cuc", 2))

/// Reduce returns result of combining the elements of subsequence of given closure like the following:
let reduceRes = array.reduce(0, { (result: Int, item: Int) -> Int in
    return result + item
})
print(reduceRes)

/// Map returns an array of mapping the given closure other the sequence's elements
let newArray = array.map({ $0 * 3})
print(newArray)

/// Flatmap converts the multiplied array of arrays to only one array like the following:
let arrayOfArrays = [ [1, 1], [2, 2], [3, 3] ]
var multipliedByTwo = arrayOfArrays.map { array in
    return array.map { integer in
        return integer * 2
    }
}
print(multipliedByTwo) /// outputs: [ [2, 2], [4, 4], [6, 6] ]
var flattened = Array(multipliedByTwo.joined())
print(flattened) /// outputs: [ 2, 2, 4, 4, 6, 6 ]

let flattenedArray = arrayOfArrays.flatMap { array in
    return array.map { integer in
        return integer * 2
    }
}
print(flattenedArray) /// outputs: [ 2, 2, 4, 4, 6, 6 ]

/// Compare between Map and Flatmap
/// Map and Flatmap have behave similarly:
let numbers: [Int] = [1, 2, 3]
let numbersMap = numbers.map { return $0 }
print(numbersMap) /// [1, 2, 3]
let numbersFlatMap = numbers.compactMap { return $0 }
print(numbersFlatMap) /// [1, 2, 3]
/// But if we had an array of optionals, there would be a big difference:
let numbers1: [Int?] = [1, nil, 3]
let numbersMap1 = numbers1.map { return $0 }
print(numbersMap1) /// [Optional(1), nil, Optional(3)]
let numbersFlatMap1 = numbers1.compactMap { return $0 }
print(numbersFlatMap1) /// [1, 3]

/// Defer: The idea behind defer is simple: anytime you want to ensure a block of code is called before exiting your current scope, simply place the block of code inside a defer statement.

/// @discadableResult: Remove warning if your method has returning result

/* Strong and Weak References in Swift
 When should we use strong and weak references?
 Strong and weak references should consider when we are creating reference types such as classes. Structs and Enums are value types so using any of the ARC keywords would not be applicable in these cases.
 
 Strong references should be used when a parent object is referencing a child object and never the other way around. That is, a child class should not have a strong reference to the parent class.
 
 Weak references should be used to avoid retain cycles and an object has the possibility to become nil at any point of it’s lifetime
 
 Unowned references behave similar to weak ones. They don’t increase the retain count by one as well. Unlike weak references unowned don’t have to be an Optional because they aren’t automatically set to nil on deallocation. It’s important that you only use unowned references when you really know that the object will never be nil once it has been set during initialisation
 */

///-------------------------------------------New Features of Swift 4.2------------------------------------------

/// @dynamicMemberLookup
@dynamicMemberLookup
struct Person {
    subscript(dynamicMember member: String) -> String {
        let properties = ["name": "Taylor Swift", "city": "Nashville"]
        return properties[member, default: ""]
    }
}

let person = Person()
person.name
person.tam

/// Add an allSatisfy algorithm to Sequence: provides a new allSatisfy() method that checks whether all items in a sequence pass a condition.
array.allSatisfy { (element) -> Bool in
    return element > 0
}


/// Adding in-place removeAll(where:) to the Standard Library: This proposal introduced a new removeAll(where:) method. This would remove all entities in a collection in-place matching a given predicate.
var name = ["John", "William", "Michael", "Gary", "Liam"]
name.removeAll { $0.hasSuffix("am") }
print(name)
/// Prints "John", "Michael", "Gary"


///Add last(where:) and lastIndex(where:): This proposal primarily introduced 3 methods namely last(where:) lastIndex(where:) lastIndex(of:) .The first two requires a closure as an argument whereas the last requires the Element to be searched.
let numberSequence = [20, 30, 10, 40, 20, 30, 10, 40, 20]
let lastHighestNumber = numberSequence.last(where: { $0 > 25 })
print("\(lastHighestNumber ?? 0)")
/// Prints 40
let lastHighestNumberIndex = numberSequence.lastIndex(where: { $0 > 25 })
print("\(lastHighestNumberIndex ?? 0)")
/// Prints 7
let lastIndexOfElement = numberSequence.lastIndex(of: 10)
print("\(lastIndexOfElement ?? 0)")
/// Prints 7


/// Adding toggle to Bool: This proposal introduced a new toggle() method to Booleans that would flip between true and false.
var flag = false
flag.toggle()
print(flag)


//// Iterating Enum cases. (Need to conform from CaseIterable)
enum Direction: String, CaseIterable {
    case east = "tam", west, north, south 
}
Direction.east.rawValue
Direction.allCases



/*
 Points To Ponder:
 Calling off ImplicitlyUnwrappedOptional (IUO) type.
 Conditional conformances improvements.
 Iterating Enum cases.
 Dynamic member look up using dot syntax for subscripts.
 Warning and error diagnostic directives.
 In-built remove functionality based on certain conditions.
 Boolean toggling.
 Random number generation and shuffling.
 Method refactoring and adding new methods to Array.
 Hashable enhancements.
 Ability to check whether all elements in a Sequence satisfied a certain condition.
 Compiler version directive.
*/
///--------------------------------------------------------------------------------------------------------------------------------


///--------------------------------------iOS knowledges--------------------------------------------------------------
///--------------------------------------iOS knowledges--------------------------------------------------------------
///--------------------------------------iOS knowledges--------------------------------------------------------------




///--------------------------------------Hackerrank--------------------------------------------------------------
///--------------------------------------Hackerrank--------------------------------------------------------------
///--------------------------------------Hackerrank--------------------------------------------------------------

/// https://www.hackerrank.com/challenges/angry-children/problem?h_r=internal-search
/// Time Complexity: n(logn)
func maxMin(k: Int, arr: [Int]) -> Int {
    let newArr = arr.sorted()
    var res = newArr[k - 1] - newArr[0]
    var runner = k + 1
    while runner <= arr.count {
        res = min(res, newArr[runner - 1] - newArr[runner - k])
        runner += 1
    }
    return res
}

/// https://www.hackerrank.com/challenges/minimum-absolute-difference-in-an-array/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=greedy-algorithms
/// Time Complexity: n(logn)
func minimumAbsoluteDifference(arr: [Int]) -> Int {
    let newArr = arr.sorted()
    var res = abs(newArr[1] - newArr[0])
    var index = 2
    while index < arr.count {
        res = min(res, abs(newArr[index] - newArr[index - 1]))
        index += 1
    }
    return res
}

/// https://www.hackerrank.com/challenges/luck-balance/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=greedy-algorithms
/// Time complexity: nlog(n)
func luckBalance(k: Int, contests: [[Int]]) -> Int {
    let newArr = contests.sorted { (a, b) -> Bool in
        return a[0] > b[0]
    }
    var res = 0, count = k
    newArr.forEach { (arr) in
        if arr[1] == 0 {
            res += arr[0]
        } else {
            if count > 0 {
                res += arr[0]
            } else {
                res -= arr[0]
            }
            count -= 1
        }
    }
    return res
}

func getMinimumCost(k: Int, c: [Int]) -> Int {
    let newArr = c.sorted { (a, b) -> Bool in
        return a > b
    }
    var res = 0
    for index in 0..<newArr.count {
        res += (index / k + 1) * newArr[index]
    }
    return res
    
}
print(getMinimumCost(k: 3, c: [1, 3, 5, 7, 9]))

///--------------------------------------Hackerrank--------------------------------------------------------------
///--------------------------------------Hackerrank--------------------------------------------------------------
///--------------------------------------Hackerrank--------------------------------------------------------------


enum Tam: String {
    case tam1
    case tam2
    mutating func next(tam: Tam) {
        switch tam {
        case .tam1:
            self = .tam2
        case .tam2:
            self = .tam1
        default:
            break
        }
    }
}
let tam: String = Tam.tam1.rawValue
print(tam)


struct PersonTam {
    var age: Int
    var name: String
}

let people = [PersonTam(age: 21, name: "Osame"), PersonTam(age: 17, name: "Masoud"), PersonTam(age: 20, name: "Mehdi")]
let flatMappedAges = people.flatMap({$0.name})  // prints: [21, 17, 20]
let mappedAges = people.map({$0.age})  // prints: [21, 17, 20]
print(flatMappedAges)
print(mappedAges)
