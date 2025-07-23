{{- define "pickrelated.tlsSecret" }}
apiVersion: v1
kind: Secret
metadata:
  namespace: {{ .Values.global.namespace }}
  name: tls-pickrelated-wildcard
type: kubernetes.io/tls
data:
  tls.crt: {{ .Values.global.tlsCertBase64 }}
  tls.key: {{ .Values.global.tlsKeyBase64 }}
{{- end }}
