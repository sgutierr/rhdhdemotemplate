{{/*
Image Url image will be pushed to defaults to internal registry
*/}}
{{- define "image.dev-url" -}}
{{- with .Values.image }}
{{- printf "%s/%s/%s" .host .repository .name }}
{{- end }}
{{- end }}

{{- define "image.preprod-url" -}}
{{- with .Values.image }}
{{- printf "%s/%s-preprod/%s" .host .repository .name }}
{{- end }}
{{- end }}

{{- define "image.prod-url" -}}
{{- with .Values.image }}
{{- printf "%s/%s-prod/%s" .host .repository .name }}
{{- end }}
{{- end }}
