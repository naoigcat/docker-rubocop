# Local CA Certificates

This directory contains CA certificates that will be trusted during Docker image builds.

This is necessary for environments that use SSL inspection/proxies (like corporate networks or CI/CD systems with mkcert).

If you're building in a clean environment without SSL proxies, this directory can be empty.
