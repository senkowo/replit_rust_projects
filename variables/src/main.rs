fn main() {
    let rect1 = Rectangle { width: 30, height: 50 };
    let rect1 = Rectangle { width: 30, height: 40 };
    let rect1 = Rectangle { width: 30, height: 45 };

    println!("Can rect1 hold rect2? {}", rect1.can_hold(&rect2));
    println!("Can rect1 hold rect3? {}", rect1.can_hold(&rect3))
}

struct Rectangle {
    
}

impl Rectangle {
    
}