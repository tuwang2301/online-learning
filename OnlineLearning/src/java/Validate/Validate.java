/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Validate;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author dell
 */
public class Validate {
    private static Pattern pattern;
    private Matcher matcher;

    private static final String EMAIL_REGEX = "^[A-Za-z0-9]+[A-Za-z0-9]*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)$";
    private static String name_regex = "^[\\p{L} ]+$";
    public Validate() {
        pattern = Pattern.compile(EMAIL_REGEX);
    }

    public boolean validateEmail(String regex) {
        matcher = pattern.matcher(regex);
        return matcher.matches();
    }
    public boolean validateName(String regex){
        boolean check = regex.matches(name_regex);
        return check;
    }

    public boolean checkPhone(String str) {
        String reg = "^^0(?:\\d{8}|\\d{9})$";
        boolean kt = str.matches(reg);
        return kt;
    }
    
    public boolean checkPassword(String regex){
        String reg = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{6,}$";
        boolean kt = regex.matches(reg);
        return kt;
    }
    }
