#!/usr/bin/env groovy
import jenkins.model.Jenkins

String agentName = build.buildVariableResolver.resolve('nodeHostName')
if (agentName == null) {
    println "Error: agentName was not passed"
    return
}

Jenkins.instance.nodes.each { node ->
    String nodeName = node.name
    if (nodeName.equals(agentName)) {
        Jenkins.instance.removeNode(node)
    }
}

return
