{
  isDetected = builtins.getEnv "CI_NAME" == "codeship";
  name = "Codeship";
}
