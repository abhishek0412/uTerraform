data "github_repository" "myRepo" {
  full_name = "hashicorp/terraform"
}



resource "github_repository" "tf-Repo" {
  name        = "tf-Test"
  description = "My awesome codebase"
  visibility  = "public"
}


resource "github_repository_file" "myFile" {
  repository          = github_repository.tf-Repo.name
  #branch              = "main"
  file                = ".gitignore"
  content             = "**/*.tfstate"
  commit_message      = "Added the .gitignore file using terraform automation"
  commit_author       = "tf-AutoUser"
  commit_email        = "tf-autouser@example.com"
  overwrite_on_create = true
}

resource "github_repository_file" "myReadMe" {
  repository          = github_repository.tf-Repo.name
  #branch              = "main"
  file                = "README.md"
  content             = "This is a repository generated automatically using terrform."
  commit_message      = "Added the ReadMe.md file using terraform automation"
  commit_author       = "tf-AutoUser"
  commit_email        = "tf-autouser@example.com"
  overwrite_on_create = true
}

resource "github_branch" "tf-Branch" {
  repository = github_repository.tf-Repo.name
  branch     = "tf-auto-dev"
  depends_on = [ github_repository_file.myFile ]
}

resource "github_branch_default" "default" {
  repository = github_branch.tf-Branch.repository
  branch     = github_branch.tf-Branch.branch
}

output "myOldRepoURL" {
  value = data.github_repository.myRepo.git_clone_url
}

output "GitCloneUrl" {
  value = github_repository.tf-Repo.git_clone_url
}