## Get the average rank for each agent on each map
getAverageWinRateAscent<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-ascentAgentData[[selectedAgent]]
  ranks<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    ranks[i]=element$Win..
  }
  return(mean(unlist(ranks)))
}

getAverageWinRateFracture<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-fractureAgentData[[selectedAgent]]
  ranks<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    ranks[i]=element$Win..
  }
  return(mean(unlist(ranks)))
}

getAverageWinRateHaven<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-havenAgentData[[selectedAgent]]
  ranks<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    ranks[i]=element$Win..
  }
  return(mean(unlist(ranks)))
}

getAverageWinRateIcebox<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-iceboxAgentData[[selectedAgent]]
  ranks<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    ranks[i]=element$Win..
  }
  return(mean(unlist(ranks)))
}

getAverageWinRateLotus<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-lotusAgentData[[selectedAgent]]
  ranks<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    ranks[i]=element$Win..
  }
  return(mean(unlist(ranks)))
}

getAverageWinRatePearl<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-pearlAgentData[[selectedAgent]]
  ranks<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    ranks[i]=element$Win..
  }
  return(mean(unlist(ranks)))
}

getAverageWinRateSplit<-function(agent){
  selectedAgent<-which(agents==agent)
  agentData<-splitAgentData[[selectedAgent]]
  ranks<-list()
  for(i in 1:length(agentData)){
    element<-agentData[[i]]
    ranks[i]=element$Win..
  }
  return(mean(unlist(ranks)))
}

getAverageAgentRanks<-function(){
  averageAgentRanks<-list()
  for(i in 1:length(agents)){
    currentAgent<-agents[[i]]
    agentRanks<-list()
    for(j in 1:length(mapDataList)){
      currentMap<-mapDataList[[j]]
      mapRanks<-list()
      for(k in 1:length(currentMap)){
        element<-currentMap[[k]]
        row<-element[element$Agent==currentAgent,]
        rank<-row$Rank
        mapRanks[k]=rank
      }
      agentRanks[[j]]=mapRanks[j]
    }
  }
}

for(k in 1:length(agents)){
  currentAgent<-agents[[k]]
  agentWinRate<-getAverageWinRateFracture(currentAgent)
  print(agentWinRate)
}

