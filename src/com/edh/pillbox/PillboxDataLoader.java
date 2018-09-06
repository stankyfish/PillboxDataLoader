/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.edh.pillbox;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

/**
 *
 * @author Erik Hansen
 */
public class PillboxDataLoader {
    String filename;
    File   datafile;
    Collection<Pill> pills = new LinkedList<>();
    
    public PillboxDataLoader(String filename) {
        this.filename = filename;
        datafile = new File(filename);
    }
    
    public void load() throws PillboxDataFileException {
        try {
            BufferedReader reader = new BufferedReader(new FileReader(datafile));
            // First line is field names
            String line = reader.readLine();
            String[] fields = line.split("\t");
            while((line = reader.readLine()) != null) {
                String[] values = line.split("\t");
                Map<String,String> record = new HashMap<>();
                for(int i = 0; i < fields.length; i++) {
                    record.put(fields[i], values[i]);
                }
                Pill p = new Pill(record);
                pills.add(p);
            }
        } catch (FileNotFoundException e) {
            throw new PillboxDataFileException("No such datafile: " + filename, e);
        } catch (IOException e) {
            throw new PillboxDataFileException("Error reading datafile: " + filename, e);
        }
    }
    
    public static void usage() {
        System.out.println("PillboxDataLoader filename");
        System.exit(0);
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        String filename = null;
        String outfile = null;
        
        if(args.length == 0) {
            usage();
        } else if(args.length == 2) {
            outfile = args[1];
        }
        filename = args[0];
        
        PillboxDataLoader loader = new PillboxDataLoader(filename);
        loader.load();

        
        PrintWriter output = null;
        if(outfile != null) {
            output = new PrintWriter(outfile);
        }
        
        for(Pill p : loader.pills) {
            if(output == null) {
                System.out.print(p.insert());
            } else {
                output.write(p.insert());
            }
            
        }
        output.close();
    }

    private static class PillboxDataFileException extends Exception {

        public PillboxDataFileException(String message) {
            super(message);
        }
        public PillboxDataFileException(String message, Throwable t) {
            super(message, t);
        }
    }
    
}
