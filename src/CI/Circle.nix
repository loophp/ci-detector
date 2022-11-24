{
  isDetected = builtins.getEnv "CIRCLECI" != "";
  name = "Circle";
}