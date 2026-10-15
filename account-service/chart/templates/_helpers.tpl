{{/*
Return the chart name.
*/}}
{{- define "account-service.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Return the fully qualified application name.
*/}}
{{- define "account-service.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- include "account-service.name" . }}
{{- end }}
{{- end }}

{{/*
Common labels.
*/}}
{{- define "account-service.labels" -}}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version | replace "+" "_" }}
app.kubernetes.io/name: {{ include "account-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels.
*/}}
{{- define "account-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "account-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
