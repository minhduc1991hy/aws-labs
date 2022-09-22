variable "user_names" {
  description = "Create IAM users"
  type = map(object({
    path = string,
    tags = map(string)
  }))
  default = {
    "Paul" = { 
      path = "/sales/"
      tags = {
        "department" = "Sales"
      } 
    }
    "John" = { 
      path = "/marketing/"
      tags = { 
        "department" = "Software"
        } 
    }
    "Hai" = { 
      path = "/marketing/"
      tags = { 
        "department" = "Accounting"
        } 
    }
  }
}