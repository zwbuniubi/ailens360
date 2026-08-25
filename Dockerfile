# Use the official AILens360 image as the base (built from deploy/docker/Dockerfile).
FROM coolbanhub/ailens360:latest

# Override the default CMD/ENTRYPOINT so the process role comes from the
# AILENS360_ROLE env var (api | proxy | collector). Render cannot set a
# dockerCommand, but the MCP create path runs ./Dockerfile, so we bake the
# role selection into this image.
ENTRYPOINT ["/bin/sh", "-lc", "exec /usr/local/bin/ailens360 \"${AILENS360_ROLE:-api}\""]
