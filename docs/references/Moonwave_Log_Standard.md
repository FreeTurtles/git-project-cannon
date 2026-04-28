---
title: Moonwave Log Standard
owner: project-cannon
status: active
updated: 2026-04-28
tags:
  - moonwave
  - log
  - standard
---

# Moonwave Log Standard

`Daily_Process.md`와 월별 로그 문서는 아래 기준으로 작성한다.

## Frontmatter Required Fields
- `title`
- `owner`
- `status`
- `updated`
- `tags`

## Daily Entry Rule
- 날짜 단위 헤더를 사용한다. 예: `## 2026-04-28`
- 반드시 `Agent Model`을 기록한다.
- `Summary`, `Changes`, `Verification`, `Notes`, `Next` 순서를 유지한다.

## Verification Rule
- 실행한 명령과 결과를 같이 남긴다.
- 실패한 검증도 원인과 후속 액션을 기록한다.

## Example
```md
## 2026-04-28
- Agent Model:
  - Codex 5.3
- Summary:
  - 문서 구조 정리 및 빌드 검증
- Changes:
  - `docs/Daily_Process.md`
- Verification:
  - `npm run docs:build` failed (MDX syntax issue)
- Notes:
  - `<` 문자가 포함된 라인 MDX 문법 점검 필요
- Next:
  - 문제 문서 수정 후 재빌드
```
