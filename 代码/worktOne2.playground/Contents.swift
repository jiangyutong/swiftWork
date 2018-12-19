//: Playground - noun: a place where people can play

import UIKit
/*
 （1）    实现Person类：
 a)    要求具有firstName,  lastName，age，gender等存储属性,fullName计算属性；其中gender是枚举类型（male，female）；
 b)    具有指定构造函数和便利构造函数；
 c)    两个Person实例对象可以用==和!=进行比较；
 d)    Person实例可以直接用print输出；
 */
enum Gender:Int {
    case male,female
    static func >(gender1:Gender,gender2:Gender)->Bool
    {
        return gender1.rawValue>gender2.rawValue
    }
}
class Person: CustomStringConvertible
{
    var firstName:String = ""
    var lastName:String = ""
    var age:Int = 0
    var gender:Gender
    var fullName:String
    {
        get
        {
            return self.firstName+" "+self.lastName
        }
    }
    init(firstName:String, lastName:String,age:Int,gender:Gender)
    {
        self.firstName=firstName
        self.lastName=lastName
        self.age=age
        self.gender=gender
    }
    convenience init(name:String,age:Int)
    {
        self.init(firstName:name,lastName:"",age:age,gender:Gender.female)
    }
    static func ==(p1:Person,p2:Person)->Bool
    {
        return p1.fullName==p2.fullName&&p1.age==p2.age
    }
    static func != (p1:Person,p2:Person)->Bool
    {
        return p1.fullName != p2.fullName||p1.age != p2.age
    }
    var description: String {
        return "fullName: \(self.fullName), age: \(self.age), gender: \(self.gender)"
    }
}
let person1=Person(name: "jyt",age:10);
let person2=Person(name: "jyt",age:20);
let p3=person2
if person1 == person2
{
    print("same")
}
print(p3)
/*
 （2）    从Person分别派生Teacher类和Student类：
 a)    Teacher类增加属性title，实例可以直接用print输出；
 b)    Student类增加属性stuNo，实例可以直接用print输出；
 
 */
//老师
class Teacher:Person
{
    var title:String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,title:String) {
        self.title=title
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String
    {
        return "fullName: \(self.fullName), age: \(self.age), gender: \(self.gender) title:\(self.title)"
    }
}
var tea11=Teacher(firstName: "jyt", lastName: "yu", age: 20, gender: Gender.female, title: "first")
print(tea11)

//学生
class Student:Person
{
    var stuNo:String
    
    init(firstName: String, lastName: String, age: Int, gender: Gender,stuNo:String) {
        self.stuNo=stuNo
        super.init(firstName: firstName, lastName: lastName, age: age, gender: gender)
    }
    override var description: String
    {
        return "fullName: \(self.fullName), age: \(self.age), gender: \(self.gender) stuNo:\(self.stuNo)"
    }
}
var stu11=Student(firstName: "ttt", lastName: "yu", age: 20, gender: Gender.female, stuNo: "first")
print(stu11)
//（3）    分别构造多个Person、Teacher和Student对象，并将这些对象存入同一个数组中；
var p1=Person(firstName: "p1", lastName: "", age: 10, gender: Gender.female)
var p2=Person(firstName: "p2", lastName: "", age: 30, gender: Gender.female)

var tea1=Teacher(firstName: "tea1", lastName: "", age: 99, gender: Gender.female, title: "yx")
var tea2=Teacher(firstName: "tea2", lastName: "", age: 60, gender: Gender.male, title: "ky")

var stu1=Student(firstName: "stu1", lastName: "", age: 90, gender: Gender.male, stuNo: "001")
var stu2=Student(firstName: "stu2", lastName: "", age: 80, gender: Gender.male, stuNo: "002")

var arry=[p1,p2,tea1,tea2,stu1,stu2]
/*
 （4）    对数组执行以下要求：
 a)    分别统计Person、Teacher和Student对象的个数并放入一字典中，统计完后输出字典内容；
 b)    对数组按以下要求排序并输出：age、fullName、gender+age；
 
 */
var dictionary=["person":0,"teacher":0,"student":0]
var k=dictionary["person"]
print(k!)
for i in arry
{
    if i is Teacher {dictionary["teacher"]! += 1}
    else if i is Student{dictionary["student"]! += 1}
    else  { dictionary["person"]! += 1}
}
for (key,value) in dictionary
{
    print("\(key):\(value)")
}
var arryTwo=arry
arryTwo.sort{$0.age>$1.age}
print(arryTwo)
var arryThree=arry
arryThree.sort{$0.fullName>$1.fullName}
print(arryThree)
var arryFour=arry
arryFour.sort{$0.gender>$1.gender&&$0.age>$1.age}
print(arryFour)








