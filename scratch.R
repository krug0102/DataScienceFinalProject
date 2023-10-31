library(stringr)

Astra
Breach
Brimstone
Chamber
Cypher
Fade
Gekko
Harbor
Jett
KAY/O
Killjoy
Neon
Omen
Phoenix
Raze
Reyna
Sage
Skye
Sova
Viper
Yoru




fileRegex<-"competitive_tier=[0-9]+.csv"
filePath<-"~/DataScienceFinalProject/"

agents<-c("Astra", "Breach", "Brimstone", "Chamber", "Cypher", "Fade", "Gekko",
          "Harbor", "Jett", "KAY/O", "Killjoy", "Neon", "Omen", "Phoenix", "Raze",
          "Reyna", "Sage", "Skye", "Sova", "Viper", "Yoru")

maps<-c("ascent", "fracture", "haven", "icebox", "lotus", "pearl", "split")

ranks<-c("Iron I", "Iron II", "Iron III", "Bronze I", "Bronze II", "Bronze III","Silver I", "Silver II", "Silver III", "Gold I", "Gold II", "Gold III", "Platinum I", "Platinum II", "Platinum III", "Diamond I", "Diamond II", "Diamond III")

agentClasses<-c("Controller", "Duelist", "Initiator", "Sentinel")

# Getting all agent data from each map, should be 18 files per map
ascentFiles<-list.files(paste0(filePath,"ascent"), pattern=fileRegex) # 18 files
fractureFiles<-list.files(paste0(filePath,"fracture"), pattern=fileRegex) # 18 files
havenFiles<-list.files(paste0(filePath,"haven"), pattern=fileRegex) # 18 files
iceboxFiles<-list.files(paste0(filePath,"icebox"), pattern=fileRegex) # 18 files
lotusFiles<-list.files(paste0(filePath, "lotus"), pattern=fileRegex) # 18 files
pearlFiles<-list.files(paste0(filePath, "pearl"), pattern=fileRegex) # 18 files
splitFiles<-list.files(paste0(filePath, "split"), pattern=fileRegex) # 18 files

for(i in 1:length(maps)){
  currentMap<-maps[i]
  assign(paste0(currentMap,"Files"),list.files(paste0(filePath,currentMap), pattern=fileRegex))
}

mapFiles<-list(ascentFiles,fractureFiles,havenFiles,iceboxFiles,lotusFiles,pearlFiles,splitFiles)

# A list which contains the list of data.frames for each of the .csv files for each map
getMapData<-function(){
  mapDataList<-list()
  for(i in 1:length(maps)){
    currentMap<-maps[[i]]
    xFiles<-mapFiles[[i]]
    mapDataFrames<-list()
    for(j in seq_along(xFiles)){
      currentFile<-xFiles[j]
      num<-str_match(currentFile,"[0-9]+")
      mapDataFrames[[j]]=assign(paste0(currentMap,"_",num), read.csv(file=paste0(filePath,currentMap,"/",currentFile),header=TRUE,sep=","))
    }
    mapDataList[[i]]=assign(paste0(currentMap,"DataList"),mapDataFrames)
  }
  return(mapDataList)
}

# Initializes the dataLists for each map
for(i in 1:length(mapDataList)){
  assign(paste0(maps[[i]],"DataList"), mapDataList[[i]])
}


# Sums the total number of matches played across all ranks for each map
totalMapMatches<-function(){
  totalMapMatches<-list()
  for(i in 1:length(mapDataList)){
    currentMap<-mapDataList[[i]]
    currentMapTotal<-list()
    for(j in 1:length(currentMap)){
      rank<-currentMap[[j]]
      currentMapTotal[j]=sum(rank$Matches)
    }
    totalMapMatches[i]=sum(unlist(currentMapTotal))
  }
  return(totalMapMatches)
}

initializeMapAgentData<-function(){
  mapAgentData<-list()
  mapAgentData[[1]]<-getAgentAscentData()
  mapAgentData[[2]]<-getAgentFractureData()
  mapAgentData[[3]]<-getAgentHavenData()
  mapAgentData[[4]]<-getAgentIceboxData()
  mapAgentData[[5]]<-getAgentLotusData()
  mapAgentData[[6]]<-getAgentPearlData()
  mapAgentData[[7]]<-getAgentSplitData()
  return(mapAgentData)
}

# Gets the ascent data for each agent
getAgentAscentData<-function(){
  ascentAgentData<-list()
  for(i in 1:length(agents)){
    agent<-agents[i]
    agentData<-list()
    for(j in 1:length(ascentDataList)){
      element<-ascentDataList[[j]]
      agentData[[j]]=element[element$Agent==agent,]
    }
    ascentAgentData[[i]]=assign(paste0(agent,"AscentData"),agentData)
    
  }
  return(ascentAgentData)
}

getAgentFractureData<-function(){
  fractureAgentData<-list()
  for(i in 1:length(agents)){
    agent<-agents[i]
    agentData<-list()
    for(j in 1:length(fractureDataList)){
      element<-fractureDataList[[j]]
      agentData[[j]]=element[element$Agent==agent,]
    }
    fractureAgentData[[i]]=assign(paste0(agent,"FractureData"),agentData)
    
  }
  return(fractureAgentData)
}

getAgentHavenData<-function(){
  havenAgentData<-list()
  for(i in 1:length(agents)){
    agent<-agents[i]
    agentData<-list()
    for(j in 1:length(havenDataList)){
      element<-havenDataList[[j]]
      agentData[[j]]=element[element$Agent==agent,]
    }
    havenAgentData[[i]]=assign(paste0(agent,"HavenData"),agentData)
    
  }
  return(havenAgentData)
}

getAgentIceboxData<-function(){
  iceboxAgentData<-list()
  for(i in 1:length(agents)){
    agent<-agents[i]
    agentData<-list()
    for(j in 1:length(iceboxDataList)){
      element<-iceboxDataList[[j]]
      agentData[[j]]=element[element$Agent==agent,]
    }
    iceboxAgentData[[i]]=assign(paste0(agent,"IceboxData"),agentData)
    
  }
  return(iceboxAgentData)
}

getAgentLotusData<-function(){
  lotusAgentData<-list()
  for(i in 1:length(agents)){
    agent<-agents[i]
    agentData<-list()
    for(j in 1:length(lotusDataList)){
      element<-lotusDataList[[j]]
      agentData[[j]]=element[element$Agent==agent,]
    }
    lotusAgentData[[i]]=assign(paste0(agent,"LotusData"),agentData)
    
  }
  return(lotusAgentData)
}

getAgentPearlData<-function(){
  pearlAgentData<-list()
  for(i in 1:length(agents)){
    agent<-agents[i]
    agentData<-list()
    for(j in 1:length(pearlDataList)){
      element<-pearlDataList[[j]]
      agentData[[j]]=element[element$Agent==agent,]
    }
    pearlAgentData[[i]]=assign(paste0(agent,"PearlData"),agentData)
    
  }
  return(pearlAgentData)
}

getAgentSplitData<-function(){
  splitAgentData<-list()
  for(i in 1:length(agents)){
    agent<-agents[i]
    agentData<-list()
    for(j in 1:length(splitDataList)){
      element<-splitDataList[[j]]
      agentData[[j]]=element[element$Agent==agent,]
    }
    splitAgentData[[i]]=assign(paste0(agent,"SplitData"),agentData)
    
  }
  return(splitAgentData)
}



createAgentDataframes<-function(map, agent){
  selectedMap<-mapAgentData[[which(maps==map)]]
  selectedAgent<-selectedMap[[which(agents==agent)]]
  df<-selectedAgent[[1]]
  for(i in 2:length(selectedAgent)){
    df<-rbind(df,selectedAgent[[i]])
  } # end for
  return(df)
} # end createAgentDataframes




















### end