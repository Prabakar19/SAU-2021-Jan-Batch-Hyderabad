package com.au.prototype;

import java.util.Hashtable;

public class AnimeCloneDemo {

    private static Hashtable<String, Animal> animalHashtable=  new Hashtable<>();


    public static void loadDetails(){
        Rabbit rabbit = new Rabbit();
        Dog dog = new Dog();
        Snake snake = new Snake();

        rabbit.printInfo();
        dog.printInfo();
        snake.printInfo();

        animalHashtable.put(rabbit.getAnimalName(), rabbit);
        animalHashtable.put(dog.getAnimalName(), dog);
        animalHashtable.put(snake.getAnimalName(), snake);
    }

    public static Animal getAnimal(String animalName) throws CloneNotSupportedException {
        Animal animal = animalHashtable.get(animalName);
        return (Animal) animal.clone();
    }
    public static void main(String[] args) throws CloneNotSupportedException {
        System.out.println("Real Objects :");
        loadDetails();

        System.out.println("\nCloned Objects :");
        Animal clonedSnake = getAnimal("Snake");
        Animal clonedDog = getAnimal("Dog");
        Animal clonedRabbit = getAnimal("Rabbit");

        System.out.println("Cloned animal Snake type: " + clonedSnake.getType());
        System.out.println("Cloned animal Dog type: " + clonedDog.getType());
        System.out.println("Cloned animal Rabbit type: " + clonedRabbit.getType());
    }
}
