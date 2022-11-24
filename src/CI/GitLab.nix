{
  isDetected = builtins.getEnv "GITLAB_CI" != "";
  name = "GitLab";
}