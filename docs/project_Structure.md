---
title: Project Structure (Architecture & Decisions)
owner: project-cannon
status: active
updated: 2026-04-28
tags:
  - architecture
  - decisions
---

# Project Structure (Architecture & Decisions)

이 문서는 아키텍처와 의사결정만 기록합니다.  
일일 작업 내용은 `docs/Daily_Process.md`에서 관리합니다.

## 1) Project Overview

- Project: `Roblox_Project_Cannon`
- Platform: `Roblox`
- Runtime: `Luau`
- Authoring: `TypeScript (Roblox-TS)`
- Framework: `Flamework`
- Sync: `Rojo`
- Optional Luau packages: `Wally`

## 2) Repository Structure

```text
Roblox_Project_Cannon/
  src/
    client/
    server/
    shared/
  include/
  docs/
    project_Structure.md
    Daily_Process.md
    references/
      README.md
  resource/
```

## 3) Runtime Mapping

- `src/client` -> `out/client` -> `StarterPlayer/StarterPlayerScripts`
- `src/server` -> `out/server` -> `ServerScriptService`
- `src/shared` -> `out/shared` -> `ReplicatedStorage`

## 4) Core Architecture Principles

- 권한이 필요한 게임 로직은 서버에서만 최종 처리한다.
- 클라이언트/서버 계약(타입, 이벤트 규약)은 `shared`에 둔다.
- Flamework `Service`/`Controller` 단위로 기능 경계를 나눈다.
- 구조 확장 시 문서도 참조 단위별 하위 폴더로 분리한다.

## 5) Decision Log

### Template

```md
## [YYYY-MM-DD] Title
- Owner:
- Category: (Architecture | Gameplay | Infrastructure | Tooling | Docs)
- Context:
- Decision:
- Why:
- Impact:
- Affected Paths:
  - `path/to/file`
- Verification:
  - command / test result
- Follow-up:
```

### Entries

## [2026-04-22] Bootstrap Architecture Stack
- Owner: Agent
- Category: Infrastructure
- Context: 새 프로젝트의 공통 개발 기준 수립 필요
- Decision: Roblox-TS + Flamework + Rojo + optional Wally 조합 채택
- Why: Roblox Studio 동기화와 TS 기반 협업을 동시에 확보하기 위해
- Impact: 빌드/동기화 가능한 기본 구조 완성
- Affected Paths:
  - `package.json`
  - `tsconfig.json`
  - `default.project.json`
  - `src/client/main.client.ts`
  - `src/server/main.server.ts`
- Verification:
  - `npm run build` successful
- Follow-up:
  - 도메인별 `Service`/`Controller` 구조 확장

## [2026-04-28] Documentation Governance Baseline
- Owner: Agent
- Category: Docs
- Context: 문서 수가 증가하면서 포맷/로그 일관성 유지 기준이 필요
- Decision:
  - Markdown 문서 frontmatter 표준을 기본 규칙으로 채택
  - 일일 로그는 `Agent Model` 필드 포함을 필수화
  - Moonwave 빌드(`npm run docs:build`)를 문서 검증 기준으로 채택
- Why: 문서 검색성, 자동화 호환성, 이력 추적성을 동시에 확보하기 위해
- Impact: 신규/수정 문서 작성 시 공통 템플릿 및 빌드 검증 루틴 적용
- Affected Paths:
  - `CLAUDE.md`
  - `docs/Daily_Process.md`
  - `docs/references/Moonwave_Log_Standard.md`
  - `package.json`
- Verification:
  - `npm run docs:build` successful
- Follow-up:
  - 문서 템플릿(`docs/templates`) 표준안 정의

