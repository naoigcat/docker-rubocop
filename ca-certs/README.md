# Local CA Certificates

This directory contains CA certificates that will be trusted during Docker image builds.

This is necessary for environments that use SSL inspection/proxies (like corporate networks or CI/CD systems with mkcert).

## For Development/CI Environments

The included mkcert development CA certificate is specifically for testing environments with SSL proxies. It allows the Docker build to successfully install Ruby gems when SSL traffic is intercepted.

## For Production Builds

**IMPORTANT**: Remove all `.crt` files from this directory before building production images. The directory should only contain `.gitkeep` and this README file for production use.

If you're building in a clean environment without SSL proxies, keep this directory empty (except for `.gitkeep`).
