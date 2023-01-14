{
  isDetected = builtins.getEnv "APPVEYOR" == true;
  name = "AppVeyor";
}
