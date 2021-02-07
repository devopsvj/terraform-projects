# Quickstart: Build


### This page explains how to use Cloud Build to build a Docker image and push the image to Artifact Registry. Artifact Registry provides a single location for managing private packages and Docker container images.

### You will first build the image using a Dockerfile, which is the Docker configuration file, and then build the same image using the Cloud Build configuration file.

#### Note: This quickstart shows you how to build an image with docker, but Cloud Build supports most build tools and programming languages.

##### Before you begin

- In the Google Cloud Console, on the project selector page, select or create a Google Cloud project.

Note: If you don't plan to keep the resources that you create in this procedure, create a project instead of selecting an existing project. After you finish these steps, you can delete the project, removing all resources associated with the project.
Go to the project selector page

Make sure that billing is enabled for your Cloud project. Learn how to confirm that billing is enabled for your project.

- Enable the Cloud Build, Artifact Registry APIs.
Enable the APIs

- Install and initialize the Cloud SDK.
If you've already installed Cloud SDK previously, make sure you have the latest available version by running gcloud components update.

Preparing source files
You'll need some sample source code to package into a container image. In this section, you'll create a simple shell script and a Dockerfile. A Dockerfile is a text document that contains instructions for Docker to build an image.

Open a terminal window.

Create a new directory named quickstart-docker and navigate into it:

```
mkdir quickstart-docker
cd quickstart-docker
```
Create a file named quickstart.sh with the following contents:

View on GitHub
```
#!/bin/sh
echo "Hello, world! The time is $(date)."

```
Create a file named Dockerfile with the following contents:

View on GitHub
```
FROM alpine
COPY quickstart.sh /
CMD ["/quickstart.sh"]
```
Run the following command to make quickstart.sh executable:


```
chmod +x quickstart.sh
```
Create a Docker repository in Artifact Registry
Create a new Docker repository named quickstart-docker-repo in the location us-central1 with the description "Docker repository":

```
gcloud artifacts repositories create quickstart-docker-repo --repository-format=docker \
    --location=us-central1 --description="Docker repository"
```
Verify that your repository was created:

```
gcloud artifacts repositories list
```
Build using Dockerfile
Cloud Build allows you to build a Docker image using a Dockerfile. You don't require a separate Cloud Build config file.

To build using a Dockerfile:

Get your Cloud project ID by running the following command:

```
gcloud config get-value project
```
Run the following command from the directory containing quickstart.sh and Dockerfile, where project-id is your Cloud project ID:

```
gcloud builds submit --tag us-central1-docker.pkg.dev/project-id/quickstart-docker-repo/quickstart-image:tag1
```
Note: If your project ID contains a colon, replace the colon with a forward slash.
After the build is complete, you will see an output similar to the following:

```
DONE
------------------------------------------------------------------------------------------------------------------------------------
ID                                    CREATE_TIME                DURATION  SOURCE   IMAGES     STATUS
545cb89c-f7a4-4652-8f63-579ac974be2e  2020-11-05T18:16:04+00:00  16S       gs://gcb-docs-project_cloudbuild/source/1604600163.528729-b70741b0f2d0449d8635aa22893258fe.tgz  us-central1-docker.pkg.dev/gcb-docs-project/quickstart-docker-repo/quickstart-image:tag1  SUCCESS
```
You've just built a Docker image named quickstart-image using a Dockerfile and pushed the image to Artifact Registry.

- Build using a build config file
In this section you will use a Cloud Build config file to build the same Docker image as above. The build config file instructs Cloud Build to perform tasks based on your specifications.

In the same directory that contains quickstart.sh and the Dockerfile, create a file named cloudbuild.yaml with the following contents. This file is your build config file. At build time, Cloud Build automatically replaces $PROJECT_ID with your project ID.

View on GitHub
```
steps:
- name: 'gcr.io/cloud-builders/docker'
  args: [ 'build', '-t', 'us-central1-docker.pkg.dev/$PROJECT_ID/quickstart-docker-repo/quickstart-image:tag1', '.' ]
images:
- 'us-central1-docker.pkg.dev/$PROJECT_ID/quickstart-docker-repo/quickstart-image:tag1'
```
Start the build by running the following command:

```
gcloud builds submit --config cloudbuild.yaml
```
When the build is complete, you will see an output similar to the following:

```
DONE
------------------------------------------------------------------------------------------------------------------------------------
ID                                    CREATE_TIME                DURATION  SOURCE          IMAGES          STATUS
046ddd31-3670-4771-9336-8919e7098b11  2020-11-05T18:24:02+00:00  15S       gs://gcb-docs-project_cloudbuild/source/1604600641.576884-8153be22c94d438aa86c78abf11403eb.tgz  us-central1-docker.pkg.dev/gcb-docs-project/quickstart-docker-repo/quickstart-image:tag1  SUCCESS
```
You've just built quickstart-image using the build config file and pushed the image to Artifact Registry.

View the build details
Open the Cloud Build page in the Google Cloud Console.

Open the Cloud Build page

Select your project and click Open.

You will see the Build history page:

Screenshot of the build history page

Click on a particular build.

You will see the Build details page.

To view the artifacts of your build, under Build Summary, click Build Artifacts.

You will see an output similar to the following:

Screenshot of build artifacts

You can download your build log and view your image details in Artifact Registry from this page.

- Clean up
To avoid incurring charges to your Google Cloud account for the resources used in this quickstart, follow these steps.

Open the Artifact Registry page in the Google Cloud Console.

Open the Artifact Registry page

Select your project and click Open.

Select quickstart-docker-repo.

Click Delete.

You have now deleted the repository that you created as part of this quickstart.

That's it, you completed this quickstart!