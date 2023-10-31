countAgentMapMatches<-function(){
  mapAgentMatches<-list() # list of 21 agents
  for(i in 1:length(agents)){
    # loop through the list of agents
    currentAgent<-agents[i]
    mapList<-list() # list of 7 maps
    for(j in 1:length(mapDataList)){
      # loop through the map list
      currentMap<-mapDataList[[j]]
      agentMapTotal<-list() # list of 18 ranks
      for(k in 1:length(currentMap)){
        # loop through the ranks
        rank<-currentMap[[k]]
        element<-rank[rank$Agent==currentAgent,] # get the row for the agent we want
        agentMapTotal[k]=element$Matches
      }
      mapAgentMatches[i]=agentMapTotals[j]
    }
    
  }
}

# Create a function that creates a list that holds the number of matches for each map
getNumberOfMatchesAscent<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-ascentAgentData[[selectedAgent]]
  matches<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    matches[i]=element$Matches
  }
  return(sum(unlist(matches)))
}

getNumberOfMatchesFracture<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-fractureAgentData[[selectedAgent]]
  matches<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    matches[i]=element$Matches
  }
  return(sum(unlist(matches)))
}

getNumberOfMatchesHaven<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-havenAgentData[[selectedAgent]]
  matches<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    matches[i]=element$Matches
  }
  return(sum(unlist(matches)))
}

getNumberOfMatchesIcebox<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-iceboxAgentData[[selectedAgent]]
  matches<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    matches[i]=element$Matches
  }
  return(sum(unlist(matches)))
}

getNumberOfMatchesLotus<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-lotusAgentData[[selectedAgent]]
  matches<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    matches[i]=element$Matches
  }
  return(sum(unlist(matches)))
}

getNumberOfMatchesPearl<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-pearlAgentData[[selectedAgent]]
  matches<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    matches[i]=element$Matches
  }
  return(sum(unlist(matches)))
}

getNumberOfMatchesSplit<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-splitAgentData[[selectedAgent]]
  matches<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    matches[i]=element$Matches
  }
  return(sum(unlist(matches)))
}

getNumberOfMatchesMap<-function(map){
  selectedMap<-which(maps==map)
  mapData<-mapDataList[[selectedMap]]
  matches<-list()
  for(i in 1:length(mapData)){
    element<-mapData[[i]]
    matches[i]=sum(element$Matches)
  }
  return(sum(unlist(matches)))
}

# Make a function that returns a list instead
for(i in 1:length(agents)){
  currentAgent<-agents[[i]]
  agentMapTotals<-list()
  agentMapTotals[1]=assign(paste0(currentAgent,"AscentMatches"), getNumberOfMatchesAscent(currentAgent))
  agentMapTotals[2]=assign(paste0(currentAgent,"FractureMatches"), getNumberOfMatchesFracture(currentAgent))
  agentMapTotals[3]=assign(paste0(currentAgent,"HavenMatches"), getNumberOfMatchesHaven(currentAgent))
  agentMapTotals[4]=assign(paste0(currentAgent,"IceboxMatches"), getNumberOfMatchesIcebox(currentAgent))
  agentMapTotals[5]=assign(paste0(currentAgent,"LotusMatches"), getNumberOfMatchesLotus(currentAgent))
  agentMapTotals[6]=assign(paste0(currentAgent,"PearlMatches"), getNumberOfMatchesPearl(currentAgent))
  agentMapTotals[7]=assign(paste0(currentAgent,"SplitMatches"), getNumberOfMatchesSplit(currentAgent))
  agentMapTotals[8]=assign(paste0(currentAgent,"TotalMatches"), sum(unlist(agentMapTotals)[1:7]))
  assign(paste0(currentAgent,"MapTotals"),agentMapTotals)
}


for(k in 1:length(agents)){
  currentAgent<-agents[[k]]
  agentWinRate<-getNumberOfMatchesAscent(currentAgent)
  print(agentWinRate)
}

