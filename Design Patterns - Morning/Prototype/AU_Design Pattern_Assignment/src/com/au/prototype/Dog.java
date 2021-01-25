package com.au.prototype;

public class Dog  extends Animal{

    public Dog(){
        setAnimalName("Dog");
        setType("Mammal");
    }

    @Override
    void printInfo() {
        System.out.println("This is Dog");

    }
}
