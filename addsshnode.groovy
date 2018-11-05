#!/usr/bin/env groovy
import hudson.model.Node.Mode
import hudson.slaves.*
import jenkins.model.Jenkins
import hudson.plugins.sshslaves.SSHLauncher

String credentialID = build.buildVariableResolver.resolve('credentialID')
String agentName = build.buildVariableResolver.resolve('nodeHostName')
String agentDescription = build.buildVariableResolver.resolve('nodeUUID')
String agentIP = build.buildVariableResolver.resolve('nodeIPAddr')
String agentHome = "/home/jenkins"
String agentExecutors = 1
String agentLabels = "packet"

DumbSlave sshnode = new DumbSlave(agentName,
        agentDescription,
        agentHome,
        agentExecutors,
        Mode.EXCLUSIVE,
        agentLabels,
        new SSHLauncher(agentIP, 22, SSHLauncher.lookupSystemCredentials(credentialID), "", null, null, "", "", 60, 3, 15),
        RetentionStrategy.INSTANCE)
Jenkins.instance.addNode(sshnode)

return
