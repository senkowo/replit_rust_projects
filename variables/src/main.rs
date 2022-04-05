struct Rectangle {
    width: u32,
    height: u32,
}

impl Rectangle {
    fn area(&self) -> u32 {
        self.width * self.height
    }
    fn square(size: u32) -> Rectangle {
        Rectangle { width: size, height: size }
    }
}

fn main() {
    let rect1 = Rectangle { width: 10, height: 30 };
    println!("The area of rect1 is {}", rect1.area());

    println!(
        "The width of a square of 6 units long per side is {}",
        Rectangle::square(6).width
    )
}