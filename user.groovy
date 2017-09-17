import jenkins.model.*
import hudson.security.*

def env = System.getenv()

def jenkinsInstance = Jenkins.getInstance()

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
jenkinsInstance.setSecurityRealm(hudsonRealm)
hudsonRealm.createAccount(env.JENKINS_USER, env.JENKINS_PASS)
jenkinsInstance.setSecurityRealm(hudsonRealm)

def strategy = new GlobalMatrixAuthorizationStrategy()
strategy.add(jenkinsInstance.ADMINISTER, "admin")
instance.setAuthorizationStrategy(strategy)

jenkinsInstance.save()
