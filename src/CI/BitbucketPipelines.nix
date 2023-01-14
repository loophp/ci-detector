{
  isDetected = builtins.getEnv "BITBUCKET_COMMIT" != "";
  name = "BitbucketPipelines";
}
