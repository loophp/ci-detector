{
  isDetected = builtins.getEnv "CI" == "drone";
  name = "Drone";
}