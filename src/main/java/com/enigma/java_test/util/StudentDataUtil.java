package com.enigma.java_test.util;

import com.enigma.java_test.model.Student;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class StudentDataUtil {
    public static List<Student> getStudents() {
        List<Student> students = new ArrayList<>();
        students.add(new Student("S1", "Student 1", "Dep 1", 35));
        students.add(new Student("S2", "Student 2", "Dep 1", 70));
        students.add(new Student("S3", "Student 3", "Dep 1", 60));
        students.add(new Student("S4", "Student 4", "Dep 1", 90));
        students.add(new Student("S5", "Student 5", "Dep 2", 30));
        students.add(new Student("S6", "Student 6", "Dep 3", 32));
        students.add(new Student("S7", "Student 7", "Dep 3", 70));
        students.add(new Student("S8", "Student 8", "Dep 3", 20));
        return students;
    }

    public static Map<String, Double> calculatePassPercentageByDepartment(List<Student> students) {
        Map<String, Double> passByDepartment = new HashMap<>();

        for (Student student : students) {
            String department = student.getDepartment();
            int passingCount = 0;
            int totalCount = 0;

            for (Student s : students) {
                if (s.getDepartment().equals(department)) {
                    totalCount++;
                    if (s.getMarks() >= 40) {
                        passingCount++;
                    }
                }
            }

            double passPercentage = (passingCount * 100.0) / totalCount;
            passByDepartment.put(department, passPercentage);
        }

        return passByDepartment;
    }
}
