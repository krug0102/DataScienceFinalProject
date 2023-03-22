import com.opencsv.CSVReader;
import com.opencsv.exceptions.CsvValidationException;

import java.io.*;
import java.util.Scanner;


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