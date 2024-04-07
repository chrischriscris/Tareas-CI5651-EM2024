package com.chus;

import java.io.IOException;

public class Main {

  public static void main(String[] args) {
    if (args.length != 2) {
      System.out.println("Usage: java -jar InverseChecker.jar <filename> <epsilon>");
      System.exit(1);
    }

    String filename = args[0];
    double epsilon = Double.parseDouble(args[1]);
    
    InverseChecker inverseChecker = null;
    try {
      inverseChecker = new InverseChecker(filename, epsilon);
    } catch (IOException e) {
      System.out.println("Error reading file: " + e.getMessage());
      System.exit(1);
    }

    if (inverseChecker.isInverse()) {
      System.out.println("The matrix is the inverse of the original matrix.");
    } else {
      System.out.println("The matrix is not the inverse of the original matrix.");
    }
  }
}