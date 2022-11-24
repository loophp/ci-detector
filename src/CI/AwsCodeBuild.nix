{
  isDetected = builtins.getEnv "CODEBUILD_CI" != "";
  name = "AwsCodeBuild";
}
