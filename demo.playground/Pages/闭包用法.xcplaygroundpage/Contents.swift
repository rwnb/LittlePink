import UIKit

var greeting = "Hello, playground"

//MARK: 全局函数
let label: UILabel = {
    let label = UILabel()
    label.text =  "xxx"
    return label
}()

//MARK: 返回类型是String  可以作为函数的返回值
let lean = { (lan: String) -> String in
    
   return "学习\(lan)"
}

lean("SwiftUI")

func coding(day: Int , appName: ()->String){
    print("学习了\(day),编写了\(appName()) app")
}

coding(day: 40, appName: {()->String in
    return "LittlePink"
})

//MARK: 尾随闭包 Trailing Closure

coding(day: 130) { () -> String in
    "BigPink"
    
}

//MARK: 闭包简写
func codingSwift(day: Int ,res:  (Int,String)->String) {
    print("用了\(day),\(res(1,"哈哈"))")
}

codingSwift(day: 1) { takeDay,use in
    
    "参数1是\(takeDay),参数二是\(use)"
    
}

//MARK: 逃逸闭包（@escaping）

var completionHandlers: [()->()] = []

func spmeFunction(completionHandler: @escaping()-> ()){
    completionHandlers.append(completionHandler)
}

//MARK: 逃逸闭包捕获

class Catch {
    func catchSomething(finshed: @escaping(String)->()){
        print("捕获前。。。。")
        
        DispatchQueue.global().async {
            
            DispatchQueue.main.asyncAfter(deadline: .now()+2) {
                finshed("闭包中的数据")
            }
        }
        
        print("捕获后。。。。")
        
        
    }
}
let catchSome = Catch()
catchSome.catchSomething { data  in
    print("闭包中的数据 \(data) ")
}

