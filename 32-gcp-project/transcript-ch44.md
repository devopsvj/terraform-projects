# CHAPTER 4.4

## Understanding `how to create project in GCP using Terraform`

### In this lesson, we are going to talk about how to create project in GCP using Terraform

- Template:

```bash

resource "google_project" "myproj" {
  name = "devopsvj-test-project"
  project_id = "devopsvj-test-project-001"
  org_id = "2021"
  folder_id  = google_folder.mydept.name
  
}

resource "google_folder" "mydept" {
  display_name = "Training"
  parent       = "organizations/2021"
}

```

----

- Output template:

```bash

output "proj-out" {
  value = google_compute_address.proj.id
}
```
