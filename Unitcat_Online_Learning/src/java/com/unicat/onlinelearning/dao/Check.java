/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unicat.onlinelearning.dao;

/**
 *
 * @author Admin
 */
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

public class Check {

    String CheckIn(String str, String regex) {

        try {

            if (str.matches(regex)) {

            }

        } catch (Exception e) {

        }

        return str;
    }

//    String checkInputDate(String x1, String x2) {
//        while (true) {
//            try {
//                System.out.println(x1);
//                String result = sc.nextLine().trim();
//                SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
//
//                Date date1 = format.parse(result);
//
//                if (result.equalsIgnoreCase(format.format(date1))) {
//                    return result;
//                } else {
//                    System.out.println(x2);
//                }
//
//            } catch (Exception e) {
//                System.out.println(x2);
//            }
//
//        }
//    }
}
