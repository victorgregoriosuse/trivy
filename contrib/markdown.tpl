{{- if . -}}
# Trivy Report for {{ ( index . 0 ).Target }} - {{ now }}

{{- range . }}
## Results for {{ .Type }}

{{- if .Vulnerabilities }}
### Vulnerabilities
| Package | Vulnerability ID | Severity | Installed Version | Fixed Version | Links |
|---|---|---|---|---|---|
{{- range .Vulnerabilities }}
| {{ .PkgName }} | {{ .VulnerabilityID }} | {{ .Vulnerability.Severity }} | {{ .InstalledVersion }} | {{ .FixedVersion }} | {{- range $index, $element := .Vulnerability.References -}}{{- if $index}}, {{end -}}[{{ . }}]({{ . }}) {{- end -}} |
{{- end }}
{{- else }}
No Vulnerabilities found
{{- end }}

{{- if .Misconfigurations }}
### Misconfigurations
| Type | Misconf ID | Check | Severity | Message |
|---|---|---|---|---|
{{- range .Misconfigurations }}
| {{ .Type }} | {{ .ID }} | {{ .Title }} | {{ .Severity }} | {{ .Message }} [{{.PrimaryURL}}]({{.PrimaryURL}}) |
{{- end }}
{{- else }}
No Misconfigurations found
{{- end }}

{{- end }}
{{- else -}}
# Trivy Returned Empty Report
{{- end -}}
