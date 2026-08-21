{{- define "homepage.labels" -}}
{{ include "homepage.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.Version | quote }}
app.kubernetes.io/part-of: {{ .Values.productName | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service | quote}}
{{- end -}}

{{- define "homepage.selectorLabels" -}}
app.kubernetes.io/name: {{ .Values.productName | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end -}}