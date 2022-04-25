#[cfg(test)]
mod tests {
    #[test]
    fn it_works() {
        let result = 2 + 2;
        assert_eq!(result, 4);
    }
}

mod front_of_house {
    mod hosting {
        fn add_to_waitlist() {}

        fn seat_to_table() {}
    }

    mod serving {
        fn take_order() {}

        fn serve_order() {}

        fn take_payment() {}
    }
}

pub fn eat_at_restaurant() {
    crate::front_of_house::add_to_waitlist();

    front_of_house::add_to_waitlist();
}