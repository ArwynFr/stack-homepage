{{- define "labels" -}}
{{ include "selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.Version | quote }}
app.kubernetes.io/part-of: {{ .Values.product.name | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote}}
{{- end -}}

{{- define "selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.product.name | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}