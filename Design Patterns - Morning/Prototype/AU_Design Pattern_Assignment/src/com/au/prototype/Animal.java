package com.au.prototype;

import java.io.ObjectStreamException;

public abstract class Animal implements Cloneable{
    private String animalName;
    private String type;

    abstract void printInfo();

    public String getAnimalName() {
        return animalName;
    }

    public String getType() {
        return type;
    }

    public void setAnimalName(String animalName) {
        this.animalName = animalName;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
