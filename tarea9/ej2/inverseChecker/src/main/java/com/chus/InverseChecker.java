package com.chus;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.stream.IntStream;

/**
 * Checks if a matrix is the inverse of another with a given probability of error
 */
public class InverseChecker {
  private final int iterations;
  private double[][] A;
  private double[][] AInverse;
  private double[][] I;

  public InverseChecker(String filename, double epsilon) throws IOException {
    this.iterations = (int) Math.ceil(Math.log(1 / epsilon) / Math.log(2));
    parseInstance(filename);
  }

  /**
   * Checks if the matrix is the inverse of the other
   * @return true if the matrix is the inverse, false otherwise
   *
   * The result has a probability of error of the given epsilon
   */
  public boolean isInverse() {
    FreivaldsMethod freivalds = new FreivaldsMethod(A, AInverse, I);
    return IntStream.range(0, iterations).allMatch(freivalds::check);
  }

  /**
   * Parses the instance from the given file
   * @param filename the file to parse
   * @throws IOException if an I/O error occurs
   *
   * The file must be in the following format:
   * n
   * a11 a12 ... a1n
   * a21 a22 ... a2n
   * ...
   * an1 an2 ... ann
   * ainv11 ainv12 ... ainv1n
   * ainv21 ainv22 ... ainv2n
   * ...
   * ainvn1 ainvn2 ... ainvnn
   */
  private void parseInstance(String filename) throws IOException {
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
        for (int j = 0; j < n; j++) {
          I[i][j] = i == j ? 1 : 0;
        }
      }
    }
  }
}
