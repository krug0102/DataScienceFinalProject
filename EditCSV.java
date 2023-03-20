import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class EditCSV {

public String agentClass(String agentName){
    return "";
}

public static void main(String[] args) throws IOException{
    BufferedReader csvReader = new BufferedReader(new FileReader("/home/krug0102/Documents/DataScienceFinalProject/fracture/competitive_tier=01.csv"));
    String row;
    while ((row = csvReader.readLine()) != null) {
        String[] data = row.split(",");
        System.out.println(data[1]);


    }
    csvReader.close();
}
   
}