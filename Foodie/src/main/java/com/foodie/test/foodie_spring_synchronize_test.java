package com.foodie.test;

public class foodie_spring_synchronize_test {

  public static void main(String[] args) {
    // TODO Auto-generated method stub

    int a = 10;
    int b = 20;
    int c = 30;
    double d = 3.14;
    double pi = 3.14;
    int res_1 = 0;
    int res_2 = 0;

    res_1 = ((a + b) - c) + (int) (d - pi);

    if (res_1 == res_2) {
      System.out.println("[0] Synchronized Success");
    } else {
      System.out.println("[0] Synchronized Failed");
    }

  }

}
