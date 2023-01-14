{
  isDetected = builtins.getEnv "JENKINS_URL" != "";
  name = "Jenkins";
}
