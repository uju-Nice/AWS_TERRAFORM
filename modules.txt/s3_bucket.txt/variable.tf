variable "bucket_name" {
    description = "The name of the S3 bucket"
    type        = string        
}

variable "versioning_enabled" {
    description = "Whether versioning is enabled for the S3 bucket"
    type        = bool
}

variable "tags" {
    description = "Tags for the S3 bucket"
    type        = map(string)
}