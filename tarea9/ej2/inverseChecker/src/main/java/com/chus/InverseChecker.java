package com.chus;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class InverseChecker {
  double epsilon;
  double[][] A;
  double[][] AInverse;
  double[][] I;

  public InverseChecker(double epsilon, String filename) throws IOException {
    this.epsilon = epsilon;
    parseInstance(filename);
  }

  void parseInstance(String filename) throws IOException {
    // Open the file in the following format:
    // n
    // a11 a12 ... a1n
    // a21 a22 ... a2n
    // ...
    // an1 an2 ... ann
    // ainv11 ainv12 ... ainv1n
    // ainv21 ainv22 ... ainv2n
    // ...
    // ainvn1 ainvn2 ... ainvnn

    try (BufferedReader reader = new BufferedReader(new FileReader(filename))) {
      int n = Integer.parseInt(reader.readLine());
      
      A = new double[n][n];
      AInverse = new double[n][n];
      I = new double[n][n];

      for (int i = 0; i < n; i++) {
        String[] line = reader.readLine().split(" ");
        for (int j = 0; j < n; j++) {
          A[i][j] = Double.parseDouble(line[j]);
        }
      }

      for (int i = 0; i < n; i++) {
        String[] line = reader.readLine().split(" ");
        for (int j = 0; j < n; j++) {
          AInverse[i][j] = Double.parseDouble(line[j]);
        }
      }

      for (int i = 0; i < n; i++) {
        String[] line = reader.readLine().split(" ");
        for (int j = 0; j < n; j++) {
          I[i][j] = Double.parseDouble(line[j]);
        }
      }
    }
  }
  
  @Override
  public String toString() {
    StringBuilder sb = new StringBuilder();
    sb.append("A:\n");
    for (double[] row : A) {
      for (double elem : row) {
        sb.append(elem).append(" ");
      }
      sb.append("\n");
    }
    sb.append("AInverse:\n");
    for (double[] row : AInverse) {
      for (double elem : row) {
        sb.append(elem).append(" ");
      }
      sb.append("\n");
    }
    sb.append("I:\n");
    for (double[] row : I) {
      for (double elem : row) {
        sb.append(elem).append(" ");
      }
      sb.append("\n");
    }
    return sb.toString();
  }
}
