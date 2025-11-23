CI/CD Pipeline with Jenkins + Docker
Objective

This project demonstrates a local CI/CD pipeline using Jenkins to automate building, testing, and running a Dockerized application.

Overview

Jenkins runs locally inside Docker.

The pipeline uses a GitHub repository as the source code.

The app is built and tested automatically on every push.

A Docker image is created and the container is run if the build succeeds.

Optional: Notifications can be sent via email or Slack after each build.

Workflow Steps

Set Up Jenkins – Run Jenkins locally using Docker.

Connect to GitHub – Use a repository as the source for the pipeline.

Build & Test App – Jenkins automatically builds and tests the app.

Build Docker Image – On successful build, a Docker image of the app is created.

Run Container – The Docker container is started automatically.

Optional Notifications – Configure email or Slack to get build status updates.

Learning Outcome

Understand how to set up CI/CD pipelines with Jenkins.

Learn to integrate Docker into automated workflows.

Practice automating builds, tests, and deployments locally.

Gain experience with notifications for pipeline results.
