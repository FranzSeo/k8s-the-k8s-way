# ✅커밋 메시지 작성 가이드

이 문서는 프로젝트 `k8s-the-k8s-way`에서 사용하는 커밋 메시지 작성 규칙을 설명합니다. 
본 가이드는 [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) 사양을 기반으로 하며, 
커밋 메시지를 일관되게 관리하고 변경 이력을 명확히 하기 위해 사용됩니다.

---

## 기본 구조

```
<type>(optional scope): <subject>

[optional body]

[optional footer]
```

### 예시
```markdown
feat(autoscaler): add HPA and metrics-server manifests
fix(containerd): correct cgroup setting for systemd
```

---

## Type 목록

| 타입      | 설명                                  |
|-----------|---------------------------------------|
| `feat`    | 새로운 기능 추가                      |
| `fix`     | 버그 수정                              |
| `docs`    | 문서 변경 (README 등)                 |
| `style`   | 코드 스타일 변경 (기능 영향 없음)     |
| `refactor`| 코드 리팩토링 (기능 변화 없음)        |
| `perf`    | 성능 향상                              |
| `test`    | 테스트 코드 추가 또는 수정             |
| `build`   | 빌드 관련 작업, 의존성 관리 포함       |
| `ci`      | CI/CD 구성 파일 또는 스크립트 수정     |
| `chore`   | 기타 변경사항 (빌드 제외 설정 등)      |
| `revert`  | 이전 커밋 되돌리기                    |

> **소문자 사용, 마침표 금지**, 제목은 50자 이내로 간결하게 작성

---

## Scope 사용 예시 (선택)

scope는 변경된 파일 또는 기능 모듈을 괄호로 지정합니다:

```markdown
feat(monitoring): integrate grafana dashboard for node metrics
fix(vault): unseal issue on restart with raft backend
```

---

## Body (본문, 선택)

본문은 커밋의 배경, 이유 또는 상세 내용을 설명할 때 사용합니다. 마크다운 문법 사용 가능.

```markdown
This adds support for horizontal pod autoscaler
with the metrics-server setup and resource limits.
```

---

## Footer (하단, 선택)

- **이슈 연결**: 관련 GitHub 이슈를 자동으로 닫기 위해 사용합니다
- **BREAKING CHANGE**: 파괴적인 변경임을 명시할 때 사용합니다

```markdown
Closes #42
BREAKING CHANGE: container runtime must be containerd v1.6+
```

---

## 좋은 커밋 메시지 예시 모음

```markdown
docs(readme): add project overview and stack description
feat(kubeadm): add HA cluster configuration with keepalived
fix(calico): correct IP pool setting in manifest
refactor(ansible): split install playbook into roles
style(manifests): format YAML with 2-space indent
chore(repo): add .gitignore and pre-commit config
```

---

## 🚫 피해야 할 메시지 예시

```markdown
update stuff
fix bugs
asdfasdf
한글만 작성
.
```

> 🚫 이렇게 작성하면 커밋 내역 검색과 자동화 도구 활용이 매우 어려워집니다.

---

## 권장 사용 도구
- [commitizen](https://github.com/commitizen/cz-cli): 커밋 메시지 작성 인터페이스
- [husky + lint-staged](https://typicode.github.io/husky/): 커밋 전에 검사 자동화
- [semantic-release](https://semantic-release.gitbook.io/semantic-release/): 버전 관리 자동화 (선택)

---

## 참고 문서
- https://www.conventionalcommits.org/
- https://www.conventionalcommits.org/en/v1.0.0/
- https://docs.github.com/en/get-started/quickstart/github-glossary#commit

---

> 유지보수와 협업을 위해 커밋 메시지는 위 기준을 **반드시 준수**해 주세요 🙌

