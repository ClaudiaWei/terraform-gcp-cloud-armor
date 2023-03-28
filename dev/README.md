## Apply changes

pre-requests

* tfenv

```
GOOGLE_APPLICATION_CREDENTIALS=<secret file>.json terraform init -backend-config=backend.tfvars -reconfigure
GOOGLE_APPLICATION_CREDENTIALS=<secret file>.json terraform plan
GOOGLE_APPLICATION_CREDENTIALS=<secret file>.json terraform apply
```

- only allow TW,HK,JP country code