//: Playground - noun: a place where people can play

import UIKit
var primes=[Int]()
for i in 2...1000
{
    var isPrime = true
    for j in 2..<i
    {
        if i%j==0
        {
            isPrime=false
        }
    }
    if isPrime
    {
        primes.append(i)
    }
}
//从大到小输出
//方法一 使用外部写函数然后调用
var primestwo=primes
func compare(a:Int,b:Int)->Bool
{
    return a>b
}
primestwo.sort(by: compare)
//方法二 闭包完整的
var primesthree=primes
primesthree.sort(by: {(num1:Int,num2:Int)->Bool in return num1>num2})
//方法三  闭包 不指定参数参数类型
var primesfour=primes
primesfour.sort(by: {(num1,num2)->Bool in return num1>num2})
//方法四 闭包不指定参数
var primesfive=primes
primesfive.sort(by: {return $0>$1})
//方法五 闭包省略return
var primesfsix=primes
primesfsix.sort(by: {$0>$1})
//方法六 如果闭包是函数调用的最后一个参数，可以将闭包放到括号外面，提高代码的可读性
var primesseven=primes
primesseven.sort(){$0>$1}
//输出
print(primes)
print(primestwo)
print(primesthree)
print(primesfour)
print(primesfive)
print(primesfsix)
print(primesseven)





