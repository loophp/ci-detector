{
  isDetected = builtins.getEnv "GITHUB_ACTIONS" != "";
  name = "GithubActions";
}