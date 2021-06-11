variable "project" {
  type = string
}

variable "extension_name" {
  type = string
}

variable "location" {
  type = string
}

variable "img_bucket" {
  type = string
  validation {
    condition     = can(regex("^([0-9a-z_.-]*)$", var.img_bucket))
    error_message = "Invalid storage bucket."
  }
}

variable "img_sizes" {
  type = string
  validation {
    condition     = can(regex("^\\d+x(\\d+,\\d+x)*\\d+$", var.img_sizes))
    error_message = "Invalid sizes, must be a comma-separated list of WIDTHxHEIGHT values."
  }
  default = "200x200"
}

variable "image_type" {
  validation {
    condition     = contains(["jpeg", "webp", "png", "tiff", "false"], var.image_type)
    error_message = "Unsupported image type."
  }
  default = "false"
}

variable "delete_original_file" {
  type    = string
  default = "false"
}

variable "resized_images_path" {
  type    = string
  default = ""
}

variable "cache_control_header" {
  type    = string
  default = ""
}
