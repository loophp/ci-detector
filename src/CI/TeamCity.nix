{
  isDetected = builtins.getEnv "TEAMCITY_VERSION" != "";
  name = "TeamCity";
}