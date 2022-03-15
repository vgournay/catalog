{{/* Append the hardcoded volumes */}}
{{- define "openhab.configmap" -}}
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "common.names.fullname" . }}-init
  labels:
    {{- include "common.labels" . | nindent 4 }}
data:
  enable-console-logging.sh: |
    echo 'Enabling console logging.'
    sed -i -E 's|(<AppenderRef ref="OSGI"/>).*|\1<AppenderRef ref="STDOUT"/>|' /openhab/userdata/etc/log4j2.xml
{{- end -}}
