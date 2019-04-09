k run busybox --image=busybox:1.28 --dry-run -o yaml --restart=Never --command sleep 6666 --env=var1=var2 |tee busybox.yaml
