# GH-APP-Scanner

Used for bug bounty hunting.
If this causes any issues, please contact me via rreiss@wearehackerone.com

## Canary token instrumentation

This repository is configured to trigger outbound requests during dependency installation and build steps:

- **README beacon:** The image below should be replaced with your canary URL; when rendered by a markdown viewer that permits remote images, it will call the token endpoint:

  ![canary readme beacon](https://CANARYTOKEN_URL/readme_beacon.png)

- **npm preinstall:** `scripts/npm-preinstall-canary.js` runs before install and makes a GET request to `https://CANARYTOKEN_URL/npm_pre_install`.
- **Maven:** `pom.xml` points at `https://CANARYTOKEN_URL/mvn_package/` for the custom repository used by `com.company:myinternallib:1.0.0`.
- **Maven postinstall:** An `exec-maven-plugin` binding in `pom.xml` calls `curl https://CANARYTOKEN_URL/mvn_post_install/mvn_post_install` during the `install` phase (ignoring network errors).
- **Gradle:** `build.gradle` makes a preinstall GET request to `https://CANARYTOKEN_URL/gradle_package/` during initialization before dependency resolution.
- **Gradle postinstall:** `build.gradle` adds a `canaryPostInstall` task that performs a GET to `https://CANARYTOKEN_URL/gradle_post_install/` after `build`.
- **NuGet package:** `NuGet.Config` declares `https://CANARYTOKEN_URL/nuget_package/` as the only source and `dotnet-canary/CanaryProbe.csproj` uses a `Canary.Probe` package to force a restore attempt.
- **Docker build:** `Dockerfile` is multi-stage: the first stage performs a GET to `https://CANARYTOKEN_URL/docker_build/`, and the second stage pulls its base image from `https://CANARYTOKEN_URL/ubuntu-stage-dockerfile/ubuntu-stage-dockerfile` to signal registry pulls.

Replace `CANARYTOKEN_URL` with an actual canary URL before running installs to receive alerts.

### Quick substitution with `sed`

To swap the placeholder with your host everywhere, run (replace `YOUR_CANARY_HOST` first):

```bash
sed -i 's|CANARYTOKEN_URL|YOUR_CANARY_HOST|g' package.json package-lock.json pom.xml build.gradle NuGet.Config dotnet-canary/CanaryProbe.csproj Directory.Build.targets Dockerfile scripts/npm-preinstall-canary.js
```
