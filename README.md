# k8s-the-k8s-way
Dreaming of full automation of k8s

> 로컬 환경에서 Kubernetes를 Kubernetes답게 운영하기 위한 실전형 클러스터 설계 및 자동화 프로젝트

---

## 프로젝트 개요

이 프로젝트는 Kubernetes를 “Kubernetes답게” 사용하는 것을 목표로 합니다.  
로컬 가상화 환경에서 고가용성(HA), GitOps, 보안 자동화, 관측성 등을 고려한 운영환경을 구축하며,  
이를 통해 실무에 가까운 클러스터 운영 및 관리 능력을 습득합니다.

---

## 주요 기술 스택

- **OS**: Rocky Linux 9.3
- **Container Runtime**: containerd
- **Kubernetes**: v1.28 (kubeadm 기반 설치)
- **CNI Plugin**: Calico
- **Ingress Controller**: NGINX
- **Autoscaler**: Horizontal Pod Autoscaler
- **CI/CD**: Jenkins + ArgoCD (GitOps 기반)
- **Monitoring**: Prometheus + Grafana + Loki + Fluent Bit
- **Secrets Management**: HashiCorp Vault
- **자동화 도구**: Ansible, Helm

---

## 클러스터 구성

- Master 노드: 2대 (HAProxy + Keepalived로 고가용성 구성)
- Worker 노드: 최소 3대 (오토스케일링 지원)
- 모든 노드는 로컬 VM(VirtualBox 또는 VMware)로 구성

---

## 디렉토리 구조 (예정)
```
k8s-the-k8s-way/ 
  ├── ansible/ # OS & K8s 설치 자동화 
  ├── manifests/ # kubeadm, Calico, Ingress 등 YAML 
  ├── argo/ # ArgoCD 애플리케이션 선언 
  ├── vault/ # Vault 구성 및 정책 
  ├── monitoring/ # Prometheus/Grafana/Loki 구성 
  ├── docs/ # 설계 문서 및 운영 가이드 
  └── README.md
```
## 목표

- kubeadm 기반 고가용성 K8s 클러스터 구축 자동화
- GitOps 기반 지속적인 배포 및 구성 관리
- Vault로 보안 중심의 secret 관리
- 메트릭 + 로그 통합 관측 시스템 구축
- 실전과 유사한 구성으로 학습/운영/문서화

---

## 참고

- [Kubernetes 공식문서](https://kubernetes.io/ko/)
- [ArgoCD Docs](https://argo-cd.readthedocs.io/)
- [HashiCorp Vault](https://www.vaultproject.io/)
- [Calico CNI](https://docs.tigera.io/)
