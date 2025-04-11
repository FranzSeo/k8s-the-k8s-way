# 📘 Kubernetes 로컬 클러스터 구축 및 운영 자동화 작업 계획서  
**프로젝트명**: `k8s-the-k8s-way`

---

## 📑 목차  
1. [가상 환경 구성 기능 요구](#1-가상-환경-구성-기능-요구)  
2. [가상화 환경 구성](#2-가상화-환경-구성)  
3. [OS 설치 및 복수 조치](#3-os-설치-및-복수-조치)  
4. [Kubernetes 환경 구성 (HA + Autoscaling)](#4-kubernetes-환경-구성-ha--autoscaling)  
5. [CI/CD 자동화 (Jenkins + ArgoCD)](#5-cicd-자동화-jenkins--argocd)  
6. [관측성 구성 (Prometheus + Loki + Grafana)](#6-관측성-구성-prometheus--loki--grafana)  
7. [보안 개선 (계정, SUDO, Vault 합성)](#7-보안-개선-계정-sudo-vault-합성)  
8. [Vault 구성 및 K8s 연결](#8-vault-구성-및-k8s-연결)  
9. [자동화 / 관리 패키지 및 보관 연동](#9-자동화--관리-패키지-및-보관-연동)  
10. [회고와 등록 문서 지정](#10-회고와-등록-문서-지정)

---

## 1. 가상 환경 구성 기능 요구
- 모든 구성은 로컬 환경에서 수행
- OS: Rocky Linux 9.3 (kernel 5.14.x)
- 단일 개발자 계정(관리자): `opsadmin`, root 기본 비활성
- containerd + kubeadm 기반 K8s 설치

---

## 2. 가상화 환경 구성
- VMware 또는 VirtualBox 통해 5~6 VM 구성
- HA 구성을 위한 Master 노드 2개 (추후 3개 확장 예정)
- Worker Node 3개 이상 (AutoScaler 사용)
- 노드 리소스:
  - 2 vCPU / 4GB RAM (Master)
  - 2 vCPU / 2~4GB RAM (Worker)
  - 20~30GB SSD 이상

---

## 3. OS 설치 및 복수 조치
- cloud-init 또는 Ansible로 초기 설정 자동화
- `opsadmin` 계정 wheel 그룹 등록, SSH key 기반 로그인
- root 계정은 PermitRootLogin=no, PasswordAuthentication=no
- SELinux enforcing, firewalld 가능
- `dnf`: 자동 업데이트 타이머, 패키지 정리 (`autoremove`, `exclude` 활용)

---

## 4. Kubernetes 환경 구성 (HA + Autoscaling)
- kubeadm + containerd 기반 클러스터
- Control Plane 2개 노드 (HAProxy + Keepalived 구성)
- Worker Node 최소 3개, Horizontal Pod Autoscaler 적용
- CNI: Calico / Ingress: NGINX
- 버전: Kubernetes v1.28.x
- `kubeadm config` YAML 기반 구성 자동화

---

## 5. CI/CD 자동화 (Jenkins + ArgoCD)
- Jenkins:
  - Docker 이미지 빌드 + Registry Push
  - GitOps repo 업데이트 (Helm/Kustomize)
- ArgoCD:
  - Git 기반 리소스 실시간 동기화
  - 자동 배포 + 롤백 지원
- 인증은 opsadmin 또는 ServiceAccount 기반으로 제한

---

## 6. 관측성 구성 (Prometheus + Loki + Grafana)
- Prometheus + node-exporter + kube-state-metrics
- Grafana로 메트릭 및 로그 통합 대시보드 구성
- Fluent Bit → Loki → Grafana 로그 연동
- 알림: Slack, Webhook 등 연동 가능

---

## 7. 보안 개선 (계정, SUDO, Vault 합성)
- root 계정 비활성화
- opsadmin 계정만 sudo 허용
- sudo 제한 및 감사 정책 도입 (예: alias 제한)
- Calico NetworkPolicy로 Pod 간 통신 제어
- RBAC 최소 권한 적용
- Kubernetes native Secret 대신 Vault 사용 전환 예정

---

## 8. Vault 구성 및 K8s 연결
- Helm chart로 Vault 설치 (Raft backend, TLS, Injector 포함)
- 인증 방식: K8s ServiceAccount + JWT
- secrets injection: Vault Agent Sidecar 사용
- GitOps 연동 시 External Secrets Operator 사용
- auto-unseal은 수동 또는 KMS 방식 (로컬은 수동 적용 가능)

---

## 9. 자동화 / 관리 패키지 및 보관 연동
- Ansible: OS 설치 + containerd + kubeadm 구성 자동화
- Helm: Prometheus, Grafana, Vault 설치 자동화
- `dnf-automatic`, `logrotate`, 인증서 자동 갱신 등 주기 작업
- 인증서 발급 자동화: cert-manager or Vault PKI 고려
- etcd + Vault snapshot 백업 주기 구성

---

## 10. 회고와 등록 문서 지정
- Git 저장소에 전체 구성/스크립트/설정 선언적으로 관리
- kubeadm config, ArgoCD app, Vault 정책 등을 GitOps 방식으로 관리
- 운영 정책, 계정 관리, 복구 매뉴얼 등 문서화
- 장애 발생 시 복구 플로우 정의 (Vault / etcd 포함)

