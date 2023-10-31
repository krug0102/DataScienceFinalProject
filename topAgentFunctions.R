# Counts the number of times an agent has the highest win % on ascent
getNumberOfTopRankAscent<-function(){
  agentList<-list()
  mapData<-mapAgentData[[1]]
  for(i in 1:length(agents)){
    currentAgentData<-mapData[[i]]
    countTopRank<-0
    for(j in 1:length(currentAgentData)){
      element<-currentAgentData[[j]]
      if(element$Rank==1){
        countTopRank<-countTopRank+1
      }
    }
    agentList[i]=countTopRank
  }
  return(agentList)
}


for(i in 1:length(maps)){
  currentMap<-maps[[i]]
  assign(paste0(currentMap,"TopWinPrct"),getNumberOfTopRankMap(i))
}

getNumberOfTopRankMap<-function(n){
  agentList<-list()
  mapData<-mapAgentData[[n]]
  for(i in 1:length(agents)){
    currentAgentData<-mapData[[i]]
    countTopRank<-0
    for(j in 1:length(currentAgentData)){
      element<-currentAgentData[[j]]
      if(element$Rank==1){
        countTopRank<-countTopRank+1
      }
    }
    agentList[i]=countTopRank
  }
  return(agentList)
}


# Creates a dataframe from a list
createTopRanksDataFrame<-function(list){
  topRanks<-unlist(list)
  df<-data.frame(agents,topRanks)
  return(df)
}


# TODO: FIX THIS
getWinPrctList<-function(){
  bigList<-list()
  for(i in 1:length(mapAgentData)){
    currentMap<-mapAgentData[[i]]
    currentMapList<-list()
    for(j in 1:length(currentMap)){
      currentAgent<-currentMap[[j]]
      currentAgentList<-list()
      countTopRank<-0
      for(k in 1:length(currentAgent)){
        element<-currentAgent[[k]]
        if(element$Rank==1){
          countTopRank<-countTopRank+1
        }
      }
      currentAgentList[j]<-countTopRank
    }
    currentMapList[[i]]<-currentAgentList[i]
  }
  return(bigList)
}

saveWinPrctDFToRData<-function(list, map){
  topRanks<-unlist(list)
  df<-data.frame(agents,topRanks)
  save(df, file=paste0(map,"TopWinPrct.RData"))
}



# Creates a barplot using only the columns where agents had 1 or more times as top win %
createTopRanksBarplot<-function(list, map){
  dataFrame<-createTopRanksDataFrame(list)
  noZero<-subset(dataFrame, dataFrame$topRanks>0, select=c(agents,topRanks))
  barplot(noZero$topRanks, names.arg=noZero$agents, main=paste0("# of times Agent had highest win % on ", map), sub="Agents that did not have the highest win % are omitted.", xlab="Agent", ylab="count")
}

printTopRanks<-function(list){
  for(i in 1:length(list)){
    currentAgent<-agents[[i]]
    numTopRank<-list[[i]]
    output<-paste0(currentAgent, " : ", numTopRank)
    print(output)
  }
  return("Done")
}

getNumberOfAgentClassTopRankAscent<-function(){
  controllerCount<-0
  duelistCount<-0
  initiatorCount<-0
  sentinelCount<-0
  for(i in 1:length(ascentDataList)){
    currentRank<-ascentDataList[[i]]
    element<-head(currentRank,1)
    class<-element$Agent.Class
    if(class=="Controller"){
      controllerCount=controllerCount+1
    }
    if(class=="Duelist"){
      duelistCount=duelistCount+1
    }
    if(class=="Initiator"){
      initiatorCount=initiatorCount+1
    }
    if(class=="Sentinel"){
      sentinelCount=sentinelCount+1
    }
  }
  counts<-c(controllerCount,duelistCount,initiatorCount,sentinelCount)
  return(counts)
}

getNumberOfAgentClassTopRank<-function(n){
  controllerCount<-0
  duelistCount<-0
  initiatorCount<-0
  sentinelCount<-0
  currentMap<-mapDataList[[n]]
  for(i in 1:length(currentMap)){
    currentRank<-currentMap[[i]]
    element<-head(currentRank,1)
    class<-element$Agent.Class
    if(class=="Controller"){
      controllerCount=controllerCount+1
    }
    if(class=="Duelist"){
      duelistCount=duelistCount+1
    }
    if(class=="Initiator"){
      initiatorCount=initiatorCount+1
    }
    if(class=="Sentinel"){
      sentinelCount=sentinelCount+1
    }
  }
  counts<-c(controllerCount,duelistCount,initiatorCount,sentinelCount)
  return(counts)
}

for(i in 1:length(maps)){
  currentMap<-maps[[i]]
  assign(paste0(currentMap,"ClassTopWinPrct"),getNumberOfAgentClassTopRank(i))
}


