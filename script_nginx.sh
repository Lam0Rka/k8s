#!/bin/bash
cat <<EOF | kubectl apply -f - -n ns-a
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-scripts
  namespace: ns-a
data:
  pod-name.sh: |
    #!/bin/sh
    echo "Content-Type: text/plain"
    echo ""
    echo "\$HOSTNAME"
EOF
