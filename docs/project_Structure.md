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

