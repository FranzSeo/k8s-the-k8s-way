# Git Repository 구조 설계 - k8s-the-k8s-way

본 문서는 `k8s-the-k8s-way` 레포지토리의 디렉토리 구조와 각 구성 요소의 목적을 정의합니다.  
전체 인프라 구성과 자동화를 단일 레포에서 관리하여 가시성과 일관성을 확보하기 위한 설계입니다.

---

## 디렉토리 구조 

```bash
k8s-the-k8s-way/
├── 00_Docs/                    # 문서 및 구조 설명
│   └── 99_git_structure.md     # *해당 문서의 위치*
│
├── 01_Infra/
│   ├── 01_Terraform/
│   │   ├── 01_Network/         # 가상 네트워크, 라우팅
│   │   ├── 02_VMs/             # VM 프로비저닝
│   │   └── 03_Kubernetes/      # K8s 관련 리소스 생성
│   └── 02_Vagrant/             # 로컬 개발환경 초기 셋업
│
├── 02_Ansible/
│   ├── 01_ControlNode/         # 제어 노드 설정
│   ├── 02_K8sNodes/            # 마스터/워커 설정
│   └── 03_Roles/               # 재사용 역할 정의
│
├── 03_CI-CD/
│   ├── 01_Jenkins/             # CI 구성
│   └── 02_ArgoCD/              # CD 및 GitOps 설정
│
├── 04_Monitoring/
│   ├── 01_Prometheus/
│   │   ├── alertmanager/
│   │   ├── server/
│   │   └── exporters/
│   ├── 02_Grafana/
│   │   ├── dashboards/
│   │   └── provisioning/
│   ├── 03_FluentBit/
│   │   ├── config/               # fluent-bit.conf, parsers.conf 등
│   │   └── output/               # output plugin 설정 (Loki, ES 등)
│   └── 04_Misc/
│ 
├── .github/
│   └── workflows/
├── .gitignore
└── README.md
```