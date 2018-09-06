/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edh.pillbox;

import java.util.Map;

/**
 *
 * @author Erik Hansen
 */
public class Pill {
    Map<String,String> record = null;
    
    public Pill(Map<String, String> record) {
        this.record = record;
    }
    
    public String insert() {
        StringBuilder sb = new StringBuilder();
        sb.append("INSERT INTO pills(");
        for(String key : record.keySet()) {
            sb.append(key).append(",");
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append(") VALUES(");
        for(String value : record.values()) {
            sb.append(formatValue(value)).append(",");
        }
        sb.deleteCharAt(sb.length() - 1);
        sb.append(");\n");
        return sb.toString();
    }
    
    public String formatValue(String value) {
        try {
            Integer.parseInt(value);
        } catch (NumberFormatException e) {
            try {
                Float.parseFloat(value);
            } catch (NumberFormatException e2) {
                if(value.length() == 0) {
                    value = "NULL";
                } else if(value.equalsIgnoreCase("NULL")) {
                    value = "NULL";
                } else {
                    value = "\"" + value + "\"";
                }
            }
        }
        return value;
    }
    
    public void dump() {
        System.out.println("====================================================");
        for(Map.Entry<String,String> e : record.entrySet()) {
            System.out.println("[" + e.getKey() + "] => [" + e.getValue() + "]");
        }
        System.out.println("====================================================");
    }
    
}
