{
  isDetected = builtins.getEnv "TRAVIS" != "";
  name = "Travis";
}
