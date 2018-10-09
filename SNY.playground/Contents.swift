import UIKit

let array = [1, 2, 4, 5, 8, 9, 10]
let key = 1

// Binary search (one thing compulsary for BS is the given array shoud be sorted by asending or desending)
// Time complexity: log(n)
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

// Upwrap optional: We can use ? and ! to unwrap
struct SNY {
    var company: String?
    var year: Int?
}
var sny: SNY?
let year: Int? = sny?.year // Safe unwrap
let year1: Int! = sny?.year ?? 0 // Default value
//let year2 = sny!.year // Unsafe unwrap

// Pair in Swift (Same in C++)
var pairs: [(String, Int)] = []
pairs.append(("tam", 1))
pairs.append(("cuc", 2))

// Reduce returns result of combining the elements of subsequence of given closure like the following:
let reduceRes = array.reduce(0, { (result: Int, item: Int) -> Int in
    return result + item
})
print(reduceRes)

// Map returns an array of mapping the given closure other the sequence's elements
let newArray = array.map({ $0 * 3})
print(newArray)

// Flatmap converts the multiplied array of arrays to only one array like the following:
let arrayOfArrays = [ [1, 1], [2, 2], [3, 3] ]
var multipliedByTwo = arrayOfArrays.map { array in
    return array.map { integer in
        return integer * 2
    }
}
print(multipliedByTwo) // outputs: [ [2, 2], [4, 4], [6, 6] ]
var flattened = Array(multipliedByTwo.joined())
print(flattened) // outputs: [ 2, 2, 4, 4, 6, 6 ]

let flattenedArray = arrayOfArrays.flatMap { array in
    return array.map { integer in
        return integer * 2
    }
}
print(flattenedArray) // outputs: [ 2, 2, 4, 4, 6, 6 ]

// Compare between Map and Flatmap
// Map and Flatmap have behave similarly:
let numbers: [Int] = [1, 2, 3]
let numbersMap = numbers.map { return $0 }
print(numbersMap) // [1, 2, 3]
let numbersFlatMap = numbers.flatMap { return $0 }
print(numbersFlatMap) // [1, 2, 3]
// But if we had an array of optionals, there would be a big difference:
let numbers1: [Int?] = [1, nil, 3]
let numbersMap1 = numbers1.map { return $0 }
print(numbersMap1) // [Optional(1), nil, Optional(3)]
let numbersFlatMap1 = numbers1.flatMap { return $0 }
print(numbersFlatMap1) // [1, 3]
