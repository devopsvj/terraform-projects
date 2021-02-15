# GCP Project Instance:

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

#Output template:

output "proj-out" {
  value = google_project.myproj.id
}
