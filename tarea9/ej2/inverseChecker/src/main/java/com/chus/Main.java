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

    try {
      InverseChecker inverseChecker = new InverseChecker(epsilon, filename);
      String instance = inverseChecker.toString();
      System.out.println("Instance: " + instance);
    } catch (IOException e) {
      System.out.println("Error reading file: " + e.getMessage());
      System.exit(1);
    }
  }
}