package com.chus;

import java.util.Random;

/**
 * Freivalds method for checking if a matrix is the product of two other matrices
 */
public class FreivaldsMethod {
  private final double[][] A;
  private final double[][] B;
  private final double[][] C;
  private static final double THRESHOLD = 1e-9;

  Random rng = new Random();

  public FreivaldsMethod(double[][] A, double[][] B, double[][] C) {
    this.A = A;
    this.B = B;
    this.C = C;
  }

  public boolean check(int seed) {
    rng.setSeed(seed);

    int n = A.length;

    int[] X = new int[n];
    for (int i = 0; i < X.length; i++) {
      X[i] = rng.nextInt(2);
    }

    double[] XA = new double[n];
    double[] XAB = new double[n];
    double[] XC = new double[n];

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        XA[i] += A[j][i] * X[j];
        XC[i] += C[j][i] * X[j];
      }
    }

    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        XAB[i] += B[j][i] * XA[j];
      }
    }

    for (int i = 0; i < n; i++) {
      if (Math.abs(XAB[i] - XC[i]) > THRESHOLD) {
        return false;
      }
    }

    return true;
  }
}
