Deploy a Firebase Extension using Terraform!

```bash
$ export PROJECT=my-project
$ terraform apply \
  -var "extension_name=storage-resize-images-abcd" \
  -var "img_bucket=$PROJECT.appspot.com" \
  -var "project=$PROJECT" \
  -var "location=us-central1"
```
