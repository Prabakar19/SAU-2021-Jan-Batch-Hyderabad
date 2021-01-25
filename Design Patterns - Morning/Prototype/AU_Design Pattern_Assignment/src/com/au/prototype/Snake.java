package com.au.prototype;

public class Snake extends Animal{

    public Snake(){
        setAnimalName("Snake");
        setType("Reptile");
    }

    @Override
    void printInfo() {
        System.out.println("This is Snake");
    }
}
