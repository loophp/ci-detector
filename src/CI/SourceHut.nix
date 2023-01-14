{
  isDetected = builtins.getEnv "CI_NAME" == "sourcehut";
  name = "SourceHut";
}
