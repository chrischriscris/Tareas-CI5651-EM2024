package com.chus;

import java.io.IOException;
import java.util.logging.Logger;

public class Main {
  static Logger logger = Logger.getLogger(Main.class.getName());

  public static void main(String[] args) {
    if (args.length != 2) {
      logger.severe("Usage: java -jar InverseChecker.jar <filename> <epsilon>");
      System.exit(1);
    }

    String filename = args[0];
    double epsilon = Double.parseDouble(args[1]);
    
    try {
      InverseChecker inverseChecker = new InverseChecker(epsilon, filename);
      String instance = inverseChecker.toString();
      logger.info("Instance: " + instance);
    } catch (IOException e) {
      logger.severe("Error reading file: " + e.getMessage());
      System.exit(1);
    }
  }
}