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
/// Time complexity: nlog(n) for all cases
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
pairs.append(("tam1", 2))

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
let numbers: [String] = ["8", "+", "9"]
let numbersMap = numbers.compactMap { return Int($0) }
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

/// @discadableResult: Remove warning if your method has been returning result

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
 Overall new knowledges for swift 4.2
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


enum Tam: String {
    
    /// Enum cannot be stored property
    private var concucdien: String {
        return "tam"
    }
    
    case tam1 = "tam"
    case tam2 = "tam3"
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

extension Tam {
    
    func lethanhtam() {
        
    }
}

var tam: Tam = Tam.tam1
tam = Tam.tam2
print(tam.rawValue)

var thing = "cars"
print("con cac")
let closuse = {
    print(thing)
}
closuse()
thing = "tam love cuc"

struct PersonTam {
    var age: Int
    var name: String
}

extension PersonTam {
    
}

let people = [PersonTam(age: 21, name: "Osame"), PersonTam(age: 17, name: "Masoud"), PersonTam(age: 20, name: "Mehdi")]
let flatMappedAges = people.flatMap({$0.name})  // prints: [21, 17, 20]
let mappedAges = people.map({$0.age})  // prints: [21, 17, 20]
print(flatMappedAges)
print(mappedAges)


struct PersonTamValyeType {
    var age: Int
    var name: String
}

class PersonTamReferenceType {
    var age: Int = 0
    var name: String = ""
}

var arrayTest: [PersonTamReferenceType] = []

arrayTest.append(PersonTamReferenceType.init())
arrayTest.append(PersonTamReferenceType.init())

var arrayTest1 = arrayTest
arrayTest1.append(PersonTamReferenceType.init())
arrayTest1[0].name = "tam"

print(arrayTest[0].name)
print(arrayTest1[0].name)
print(arrayTest.count)
print(arrayTest1.count)


class LocationManager{
    
    static let shared = LocationManager()
    
    init(){
        print("LocationManager")
    }
    
    func requestForLocation(){
        //Code Process
        print("Location granted")
    }
    
}

//Access class function with Singleton Pattern 🚀
LocationManager.shared.requestForLocation()  //"Location granted"
LocationManager.shared.requestForLocation()  //"Location granted"


enum Gender: String { // enum with type
    case male = "I am male", female
}
print(Gender.male) // prints “male”
print(Gender.male.rawValue) // prints “I am male”
print(Gender.female.rawValue) // prints “I am male”


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

/// https://www.hackerrank.com/challenges/sherlock-and-valid-string/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=strings
func isValid(s: String) -> String {
    
    return "YES"
}

// Complete the sherlockAndAnagrams function below.
func sherlockAndAnagrams(s: String) -> Int {
    let length = s.count
    var dic: [[Int]: Int] = [:]
    for i in 0..<length {
        var array: [Int] = Array(repeating: 0, count: 26)
        for j in i..<length {
            let startIndex = s.index(s.startIndex, offsetBy: j)
            let c = s[startIndex]
            let index = Int((c.unicodeScalars.first?.value ?? 0) - (Character("a").unicodeScalars.first?.value ?? 0))
            array[index] += 1
            if let value = dic[array] {
                dic[array] = value + 1
            } else {
                dic[array] = 1
            }
        }
    }
    var res = 0
    dic.forEach { (key, value) in
        res += value * (value - 1) / 2
    }
    return res
}
print(sherlockAndAnagrams(s: "kkkk"))

// Complete the countTriplets function below.
func countTriplets(arr: [Int], r: Int) -> Int {
    
    return 0
}
print(countTriplets(arr: [1, 5, 5, 25, 125], r: 5))


func addNewFrequency(_ queryDic: inout [Int: Int], _ newFrequency: Int) {
    if let value = queryDic[newFrequency] {
        queryDic[newFrequency] = value + 1
    } else {
        queryDic[newFrequency] = 1
    }
}

func removeFrequency(_ queryDic: inout [Int: Int], _ frequency: Int) {
    if let value = queryDic[frequency], value > 0 {
        queryDic[frequency] = value - 1
    }
}

func addNewQuery(_ dic: inout [Int: Int], _ newFrequency: inout Int, _ value: Int) {
    if let value1 = dic[value] {
        newFrequency = value1 + 1
        dic[value] = newFrequency
    } else {
        dic[value] = newFrequency
    }
}

func removeQuery(_ dic: inout [Int: Int], _ frequency: inout Int, _ value: Int) -> Bool {
    if let value1 = dic[value], value1 > 0 {
        frequency = value1 - 1
        dic[value] = frequency
        return true
    }
    return false
}

func freqQuery(queries: [[Int]]) -> [Int] {

    var res: [Int]             = []
    var dic: [Int: Int]        = [:]
    var queryDic: [Int: Int]   = [:]
    for array in queries {
        if array[0] == 1 {
            var newFrequency = 1
            if let value1 = dic[array[1]] {
                removeFrequency(&queryDic, value1)
            }
            addNewQuery(&dic, &newFrequency, array[1])
            addNewFrequency(&queryDic, newFrequency)
        } else if array[0] == 2 {
            var newFrequency = 0
            if let value = dic[array[1]], value > 0 {
                removeFrequency(&queryDic, value)
                if removeQuery(&dic, &newFrequency, array[1]) {
                    addNewFrequency(&queryDic, newFrequency)
                }
            }
        } else {
            if let value = queryDic[array[1]], value > 0 {
                res.append(1)
            } else {
                res.append(0)
            }
        }
    }
    return res
}

freqQuery(queries: [[1, 3], [1, 3]])

///--------------------------------------Hackerrank--------------------------------------------------------------
///--------------------------------------Hackerrank--------------------------------------------------------------
///--------------------------------------Hackerrank--------------------------------------------------------------


///--------------------------------------codility--------------------------------------------------------------
///--------------------------------------codility--------------------------------------------------------------
///--------------------------------------codility--------------------------------------------------------------


func solution(arr: [Int]) -> Int {
    var find: Int = -1
    let n = arr.count
    if(n < 3) {
        return n
    }
    for i in 1..<n {
        if(arr[i] < arr[i-1]) {
            if (find == -1) {
                find = i
            } else {
                return 0
            }
        }
    }
    if(find == -1) {
        return n
    }
    var ans: Int = 0
    if(find == 1 || arr[find] >= arr[find-2]) {
        ans += 1
    }
    if(find == n-1 || arr[find-1] <= arr[find+1]) {
        ans += 1
    }
    return ans
}


print(solution(arr: [1, 4, 4, 4, 3])) // should be return 1
print(solution(arr: [3, 4, 5, 4])) // should be return 2
print(solution(arr: [1, 2, 3, 2, 4])) // should be return 2

print(solution(arr: [4, 5, 2, 3, 4])) // should be return 0
print(solution(arr: [1, 1, 1, 9, 1, 1, 1])) // should be return 1
print(solution(arr: [1, 2, 3, 4, 5, 6, 7, 8])) // should be return 8
print(solution(arr: [1, 2, 3, 8, 9, 8, 8])) // should be return 1

print(solution(arr: [1, 2, 3, 8, 9, 5, 6])) // should be return 0

/// https://app.codility.com/programmers/lessons/2-arrays/odd_occurrences_in_array/
public func solution(_ A : [Int]) -> Int {
    // write your code in Swift 3.0 (Linux)
    var dic: [Int: Bool] = [:]
    var res = 0
    for i in 0..<A.count {
        if dic[A[i]] == nil {
            dic[A[i]] = false
            res += A[i]
        } else {
            var value = (dic[A[i]] ?? false)
            value = !value
            dic[A[i]] = value
            if value == false {
                res += A[i]
            } else {
                res = abs(res - A[i])
            }
        }
    }
    return res
}

solution([9, 3, 9, 3, 9, 7, 9])
solution([1, 2, 3, 1, 2, 1, 1])



///--------------------------------------codility--------------------------------------------------------------
///--------------------------------------codility--------------------------------------------------------------
///--------------------------------------codility--------------------------------------------------------------


///----------------------DBS-Coding-Challenges-------------------------------
///----------------------DBS-Coding-Challenges-------------------------------
///----------------------DBS-Coding-Challenges-------------------------------

func reformatDate(dates: [String]) -> [String] {
    
    //let dayDic: [String: String] = ["1st": "01", "2nd": "02", "3rd": "03", "4th": "04", "5th": "05", "6th": "06", "7th": "07", "8th": "08", "9th": "09", "10th": "10", "11th": "11", "12th": "12", "13th": "13", "14th": "14", "15th": "15", "16th": "16", "17th": "17", "18th": "18", "19th": "19", "20th": "20", "21st": "21", "22nd": "22", "23rd": "23", "24th": "24", "25th": "25", "26th": "26", "27th": "27", "28th": "28", "29th": "29", "30th": "30", "31st": "31"]
    
    let monthDic: [String: String] = ["Jan": "01", "Feb": "02", "Mar": "03", "Apr": "04", "May": "05", "Jun": "06", "Jul": "07", "Aug": "08", "Sep": "09", "Oct": "10", "Nov": "11", "Dec": "12"]
    
    var res: [String] = []
    
    for date in dates {
        
        let array = date.components(separatedBy: " ")
        
        var newDate = array[2] + "-" + monthDic[array[1]]! + "-"
        
        var newday = ""
        let day = array[0]
        for i in 0..<day.count - 2 {
            let index = day.index(day.startIndex, offsetBy: i)
            newday += "\(day[index])"
        }
        
        if newday.count == 1 {
            newday = "0" + newday
        }
        
        newDate += newday
        
        res.append(newDate)
    }
    
    return res
}

//----------------------Permutations Devisible by 8--------------------------------------

func checkDivisibility(arr: [String]) -> [String] {
    
    var res: [String] = []
    
    for item in arr {
        
        if item.count == 1 {
            Int(item)! % 8 == 0 ? res.append("YES") : res.append("NO")
        } else if item.count == 2 {
            if Int(item)! % 8 == 0 {
                res.append("YES")
            } else {
                
                var permutation = ""
                let index1 = item.index(item.startIndex, offsetBy: 0)
                let index2 = item.index(item.startIndex, offsetBy: 1)
                permutation = "\(item[index2])" + "\(item[index1])"
                
                if Int(permutation)! % 8 == 0 {
                    res.append("YES")
                } else {
                    res.append("NO")
                }
            }
        }
            // If the length of number greater or equal 3, we need to check the number formed by the last three individual digits is evenly divisible by 8
        else {
            
            var numbers_8_divible: [String] = []
            numbers_8_divible.append("000")
            
            for i in 13...124 {
                numbers_8_divible.append(String(i * 8))
            }
            
            var dic: [Character : Int] = [:]
            
            for digit in item {
                
                if let times = dic[digit] {
                    if times <= 2  {
                        dic[digit] = times + 1
                    }
                } else {
                    dic[digit] = 1
                }
            }
            
            let originalDic: [Character : Int] = dic
            var isDivisibleFor8 = false
            
            for number in numbers_8_divible {
                
                var flag = true
                
                for digit in number {
                    
                    if let times = dic[digit] {
                        if times == 0 {
                            flag = false
                            break
                        }
                        dic[digit] = times - 1
                    } else {
                        flag = false
                        break
                    }
                }
                
                if flag {
                    isDivisibleFor8 = true
                    res.append("YES")
                    break
                }
                
                dic = originalDic
            }
            
            if !isDivisibleFor8 {
                res.append("NO")
            }
        }
    }
    
    return res
}

//----------------------Approximate Matching--------------------------------------

func calculateScore(text: String, prefixString: String, suffixString: String) -> String {
    
    var arr: [String] = []
    
    for i in 0..<text.count {
        for j in i..<text.count {
            
            let startIndex = text.index(text.startIndex, offsetBy: i)
            let endIndex = text.index(text.startIndex, offsetBy: j)
            
            let subString = text[startIndex...endIndex]
            arr.append("\(subString)")
        }
    }
    
    var textScore = 0
    var prefixScore = 0
    var suffixScore = 0
    
    var dic: [String: Int] = [:]
    
    for sub in arr {
        
        prefixScore = 0
        suffixScore = 0
        
        for k in 0..<sub.count {
            
            if (sub.count - k) <= prefixString.count {
                
                let index1 = sub.index(sub.startIndex, offsetBy: sub.count - k)
                let index2 = prefixString.index(prefixString.startIndex, offsetBy: prefixString.count - (sub.count - k))
                
                let sub1 = sub[..<index1]
                let sub2 = prefixString[index2...]
                
                if sub1 == sub2  {
                    prefixScore = sub.count - k
                    break
                }
            }
        }
        
        for k in 0..<sub.count {
            
            if (sub.count - k) <= suffixString.count {
                
                let index1 = sub.index(sub.startIndex, offsetBy: k)
                let index2 = suffixString.index(suffixString.startIndex, offsetBy: sub.count - k)
                
                let sub1 = sub[index1...]
                let sub2 = suffixString[..<index2]
                
                if sub1 == sub2  {
                    suffixScore = sub.count - k
                    break
                }
            }
        }
        
        textScore = prefixScore + suffixScore
        
        if let score = dic[sub] {
            dic[sub] = max(textScore, score)
        } else {
            dic[sub] = textScore
        }
    }
    
    var keys: [String] = []
    for (key, _) in dic {
        keys.append(key)
    }
    
    keys.sort { (a, b) -> Bool in
        return a < b
    }
    
    var max_score = -1
    var res = ""
    for key in keys {
        if let score = dic[key] {
            if score > max_score {
                max_score = score
                res = key
            }
        }
    }
    
    return res
}

//----------------------Missing Words--------------------------------------

func missingWords(s: String, t: String) -> [String] {
    
    var res: [String] = []
    
    let a = s.components(separatedBy: " ")
    let b = t.components(separatedBy: " ")
    
    var k = 0
    for i in 0..<a.count {
        
        if k >= b.count || a[i] != b[k] {
            res.append(a[i])
        }
        else {
            k += 1
        }
    }
    
    return res
}

//----------------------Substring Calculator--------------------------------------


func lpr(a: String, b: String) -> Int {
    
    var i = 0
    
    while (i < a.count && i < b.count) {
        
        let index1 = a.index(a.startIndex, offsetBy: i)
        let index2 = b.index(b.startIndex, offsetBy: i)
        
        if a[index1] != b[index2] {
            break
        }
        
        i += 1
    }
    
    return i
}


func substringCalculator(s: String) -> Int {
    
    var res: Int = 0
    var arr: [Int] = []
    for i in 0..<s.count {
        arr.append(i)
    }
    
    arr.sort { (a, b) -> Bool in
        let index1 = s.index(s.startIndex, offsetBy: a)
        let index2 = s.index(s.startIndex, offsetBy: b)
        return s[index1...] < s[index2...]
    }
    
    var z = s, y = s
    
    var p: [Int] = []
    
    for _ in 0..<s.count {
        p.append(0)
    }
    
    for i in 1..<s.count {
        
        let index1 = s.index(s.startIndex, offsetBy: arr[i])
        let index2 = s.index(s.startIndex, offsetBy: arr[i-1])
        z = "\(s[index1...])"
        y = "\(s[index2...])"
        
        var k = 0
        
        while (k < z.count && k < y.count) {
            
            p[i] += 1
            
            let index1 = z.index(z.startIndex, offsetBy: k)
            let index2 = y.index(y.startIndex, offsetBy: k)
            
            if z[index1] != y[index2] {
                break
            }
            k += 1
        }
        
        res += p[i]
    }
    
    return res
}

////////////////////////
////////////////////////
////////////////////////
let date_size = 3

let dates: [String] = ["20th Oct 2100", "6th Jan 1933", "26th Feb 1960", "20th Mar 1958", "16th Apr 2068", "25th May 1912", "16th Jun 2018", "2nd Jul 1900", "4th Aug 2030", "28th Sep 1963", "28th Nov 1963", "1st Dec 1963"]

var res = reformatDate(dates: dates)

for date in res {
    print(date)
}

////////////////////////
print("")
////////////////////////

let arr: [String] = ["0", "10", "1000", "4", "111000"]
res = checkDivisibility(arr: arr)

for item in res {
    print(item)
}

////////////////////////
print("")
////////////////////////

print(calculateScore(text: "taggooooooooo", prefixString: "ljdkslfjdsklfjhtagg", suffixString: "bfkta"))

////////////////////////
print("")
////////////////////////
res = missingWords(s: "xx xxxx xxx xxxxx x x xx xxxx X xx XX xx", t: "xxx X")

for word in res {
    print(word)
}

////////////////////////
print("")
////////////////////////

//var n = Int(readLine(strippingNewline: true)!)!
//while n > 0  {
//    let string = readLine(strippingNewline: true)!
let c = substringCalculator(s: "ABABA")
let l = "ABABA".count
print("%lld\n", (l*(l+1)/2)-c)

//    n -= 1
//}

///----------------------DBS-Coding-Challenges-------------------------------
///----------------------DBS-Coding-Challenges-------------------------------
///----------------------DBS-Coding-Challenges-------------------------------

///----------------------GRAB-Coding-Challenges-------------------------------
///----------------------GRAB-Coding-Challenges-------------------------------
///----------------------GRAB-Coding-Challenges-------------------------------

/// 5, 2th -> 1
/// 5 --> 101 --> 001 ->
func turnOn(n: Int, k: Int) -> Int {
    var d = n
    var index = 0
    while d > 0 {
        let t = d % 2
        if index == k {
            if t == 1 {
                return n - NSDecimalNumber(decimal: pow(2, k)).intValue
            } else {
                return n + NSDecimalNumber(decimal: pow(2, k)).intValue
            }
        }
        index += 1
        d = d / 2
    }
    return 0
}
print(turnOn(n: 5, k: 2))

func twoTimesAppearInThreeArrays(_ array1: [Int], _ array2: [Int], _ array3: [Int]) -> [Int] {
    var res: Set<Int> = Set()
    let set1 = Set.init(array1)
    let set2 = Set.init(array2)
    let set3 = Set.init(array3)
    var array: [Int] = Array(set1)
    array.append(contentsOf: set2)
    array.append(contentsOf: set3)
    var countedS = NSCountedSet.init(array: array)
    for item in array {
        if countedS.count(for: item) == 2 {
            res.insert(item)
        }
    }
    return res.map({ (item) -> Int in
        return item
    })
}
twoTimesAppearInThreeArrays([1, 2, 3, 4, 5], [10, 11, 8], [1, 1, 6, 4, 5, 3, 11])


/// tam,""string", tam", ta
/// tam,""string", tam", "ta"
/// [tam, string, tam, ta]
///
func hasToken(s: String) -> [String] {
    var res: [String] = []
    var newString = ""
    var hasQuote = false
    for c in s {
        if c == "\"" {
            hasQuote = true
        }
    }
    return res
}

///----------------------GRAB-Coding-Challenges-------------------------------
///----------------------GRAB-Coding-Challenges-------------------------------
///----------------------GRAB-Coding-Challenges-------------------------------
