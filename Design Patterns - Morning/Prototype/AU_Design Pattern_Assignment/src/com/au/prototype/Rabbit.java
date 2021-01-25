package com.au.prototype;

public class Rabbit extends Animal{

    public Rabbit(){
        setAnimalName("Rabbit");
        setType("Mammal");
    }

    @Override
    void printInfo() {
        System.out.println("This is Rabbit");
    }
}
