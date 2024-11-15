package com.enigma.java_test.model;

public class Student {
    private final String id;
    private final String name;
    private final String department;
    private final int marks;

    public Student(String id, String name, String department, int marks) {
        this.id = id;
        this.name = name;
        this.department = department;
        this.marks = marks;
    }

    public String getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getDepartment() {
        return department;
    }

    public int getMarks() {
        return marks;
    }
}
