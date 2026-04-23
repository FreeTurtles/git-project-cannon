# Daily Process Log

이 문서는 일일 작업일지 전용입니다.  
아키텍처/의사결정은 `docs/project_Structure.md`에서 관리합니다.

## 운영 규칙

- 날짜 기준으로 최신 항목을 상단에 기록
- 작업 사실, 검증 결과, 다음 액션을 분리 기록
- 문서가 200줄에 가까워지면 월 단위 하위 파일로 분리
  - 예: `docs/logs/2026-04.md`

## Entry Template

```md
## YYYY-MM-DD
- Summary:
- Changes:
  - `path/to/file`
- Verification:
  - command/result
- Notes:
- Next:
```

## 2026-04-22
- Summary:
  - Roblox 개발 베이스 환경 및 문서 구조 초기화
- Changes:
  - `AGENT.md`
  - `CLAUDE.md`
  - `package.json`
  - `tsconfig.json`
  - `default.project.json`
  - `docs/project_Structure.md`
  - `docs/README.md`
  - `resource/README.md`
- Verification:
  - `npm run build` successful
- Notes:
  - Git safe.directory 경고로 상태 확인 전 사용자 설정 필요
- Next:
  - Flamework `Service`/`Controller` 기본 템플릿 추가
