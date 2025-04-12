#!/bin/bash

ROOT="k8s-the-k8s-way"

dirs=(
  "00_Docs"
  "01_Infra/01_Terraform/01_Network"
  "01_Infra/01_Terraform/02_VMs"
  "01_Infra/01_Terraform/03_Kubernetes"
  "01_Infra/02_Vagrant"
  "02_Ansible/01_ControlNode"
  "02_Ansible/02_K8sNodes"
  "02_Ansible/03_Roles"
  "03_CI-CD/01_Jenkins"
  "03_CI-CD/02_ArgoCD"
  "04_Monitoring/01_Prometheus/server"
  "04_Monitoring/01_Prometheus/alertmanager"
  "04_Monitoring/01_Prometheus/exporters"
  "04_Monitoring/02_Grafana/dashboards"
  "04_Monitoring/02_Grafana/provisioning"
  "04_Monitoring/03_FluentBit/config"
  "04_Monitoring/03_FluentBit/output"
  "04_Monitoring/04_Misc"
  ".github/workflows"
)

for dir in "${dirs[@]}"; do
  full_path="$ROOT/$dir"
  readme_path="$dir/README.md"

  mkdir -p "$dir"

  # 파일이 없을 때만 생성
  if [[ ! -f "$readme_path" ]]; then
    {
      echo ""
      echo "# $full_path"
    } > "$readme_path"
    echo "Created: $readme_path"
  else
    echo "Skipped (exists): $readme_path"
  fi
done
