import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Main {
    public static void main(String[] args) throws IOException {
        prompt();

    }

    public static void prompt() throws IOException {
        System.out.println("Please enter the directory path: ");
        Scanner input = new Scanner(System.in);
        String directoryPath = input.nextLine();

        File dir = new File(directoryPath);
        File[] directoryFiles = dir.listFiles();
        if(directoryFiles != null){
            for(File file : directoryFiles){
                printCSV(file.getAbsolutePath());
            }
        }

        prompt();
    }

    public static void printCSV(String fileName) throws IOException{
        System.out.println(fileName);
        try (CSVReader reader = new CSVReader(new FileReader(fileName))) {
            String[] lineInArray;
            while ((lineInArray = reader.readNext()) != null) {
                System.out.println(lineInArray[0]+","+lineInArray[1]+","+agentClass(lineInArray[1])+","+lineInArray[2]+","
                        +lineInArray[3]+","+lineInArray[4]+","+lineInArray[5]+","+lineInArray[6]+","+lineInArray[7]+","
                        +lineInArray[8]+","+lineInArray[9]+","+lineInArray[10]);
            }
        } catch (FileNotFoundException | CsvValidationException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void writeCSVToTXT(String csvFileName) throws IOException{
        String txtFile = csvToTXT(csvFileName);
        PrintWriter pw = new PrintWriter(new FileWriter(txtFile));
        try (CSVReader reader = new CSVReader(new FileReader(csvFileName))) {
            String[] lineInArray;
            while ((lineInArray = reader.readNext()) != null) {
                pw.write(lineInArray[0]+","+lineInArray[1]+","+agentClass(lineInArray[1])+","+lineInArray[2]+","
                        +lineInArray[3]+","+lineInArray[4]+","+lineInArray[5]+","+lineInArray[6]+","+lineInArray[7]+","
                        +lineInArray[8]+","+lineInArray[9]+","+lineInArray[10]);
            }
        } catch (FileNotFoundException | CsvValidationException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private static String csvToTXT(String csvFileName){
        String pattern = "(.*/competitive_tier=\\d[2]).csv";

        Pattern r = Pattern.compile(pattern);

        Matcher m = r.matcher(csvFileName);

        if(m.find()){
            return m.group(0)+".txt";
        }
        else{
            return "no match";
        }
    }

    public static String agentClass(String agent){
        if(agent.equals("Agent")){
            return "Agent Class";
        }
        if(agent.equals("Brimstone")|agent.equals("Harbor")|agent.equals("Omen")|agent.equals("Astra")|agent.equals("Viper")){
            return "Controller";
        }
        if(agent.equals("Killjoy")|agent.equals("Chamber")|agent.equals("Cypher")|agent.equals("Sage")){
            return "Sentinel";
        }
        if(agent.equals("Jett")|agent.equals("Raze")|agent.equals("Reyna")|agent.equals("Neon")|agent.equals("Phoenix")|agent.equals("Yoru")){
            return "Duelist";
        }
        if(agent.equals("Breach")|agent.equals("Fade")|agent.equals("Skye")|agent.equals("Gekko")|agent.equals("Sova")|agent.equals("KAY/O")){
            return "Initiator";
        }
        else return "agent did not match";
    }

} // end Main

/**
 import com.opencsv.CSVReader;
 import com.opencsv.exceptions.CsvValidationException;

 import java.io.*;
 import java.util.Arrays;
 import java.util.List;
 import java.util.Scanner;
 import java.util.regex.Matcher;
 import java.util.regex.Pattern;

 public class Main {
 public static void main(String[] args) throws IOException {
 System.out.println("Please enter the file path: ");
 Scanner input = new Scanner(System.in);
 //        String directoryPath = input.nextLine();
 //
 //        File dir = new File(directoryPath);
 //        String[] directoryFiles = dir.list();
 //        if(directoryFiles != null){
 //            for(String file : directoryFiles){
 //                printCSV(file);
 //            }
 //        }
 String filePath = input.nextLine();
 printCSV(filePath);
 }

 public static void printCSV(String fileName) throws IOException{
 System.out.println(fileName);
 try (CSVReader reader = new CSVReader(new FileReader(fileName))) {
 String[] lineInArray;
 while ((lineInArray = reader.readNext()) != null) {
 System.out.println(lineInArray[0]+","+lineInArray[1]+","+agentClass(lineInArray[1])+","+lineInArray[2]+","
 +lineInArray[3]+","+lineInArray[4]+","+lineInArray[5]+","+lineInArray[6]+","+lineInArray[7]+","
 +lineInArray[8]+","+lineInArray[9]+","+lineInArray[10]);
 }
 } catch (FileNotFoundException | CsvValidationException e) {
 throw new RuntimeException(e);
 } catch (IOException e) {
 throw new RuntimeException(e);
 }
 }

 private static String removeCSVTag(String csvFileName){
 String pattern = "(.*).csv";

 Pattern r = Pattern.compile(pattern);

 Matcher m = r.matcher(csvFileName);

 if(m.find()){
 return m.group(0);
 }
 else{
 return "no match";
 }
 }

 public static String agentClass(String agent){
 if(agent.equals("Agent")){
 return "Agent Class";
 }
 if(agent.equals("Brimstone")|agent.equals("Harbor")|agent.equals("Omen")|agent.equals("Astra")|agent.equals("Viper")){
 return "Controller";
 }
 if(agent.equals("Killjoy")|agent.equals("Chamber")|agent.equals("Cypher")|agent.equals("Sage")){
 return "Sentinel";
 }
 if(agent.equals("Jett")|agent.equals("Raze")|agent.equals("Reyna")|agent.equals("Neon")|agent.equals("Phoenix")|agent.equals("Yoru")){
 return "Duelist";
 }
 if(agent.equals("Breach")|agent.equals("Fade")|agent.equals("Skye")|agent.equals("Gekko")|agent.equals("Sova")|agent.equals("KAY/O")){
 return "Initiator";
 }
 else return "agent did not match";
 }

 } // end Main
 */