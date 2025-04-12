# infra-utils

이 저장소는 인프라 작업에 필요한 스크립트와 템플릿을 모아 관리하기 위한 목적의 유틸리티 모음입니다.

## 주요 기능

- 디렉토리 + README 구조 자동 생성 (`init/make_structure.sh`)
- Terraform 캐시 삭제, Ansible inventory 생성
- Git 작업용 사전 훅/설정 적용 스크립트

## 디렉토리 설명

- `init/`: 프로젝트 초기 구조 설정용
- `terraform/`: Terraform 관련 유틸
- `ansible/`: 인벤토리 자동 생성 등
- `git/`: Git 설정, SSH 등 보조 스크립트
- `utils/`: 공통 유틸 함수, 색상 출력 등