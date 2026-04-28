---
title: Setup Reference (Project Cannon)
owner: project-cannon
status: active
updated: 2026-04-28
tags:
  - setup
  - environment
  - reference
---

# Setup Reference (Project Cannon)

새 Roblox-TS 기반 프로젝트를 빠르게 재구성하기 위한 설정/구성 참고 문서입니다.

## 1) 기본 스택

- Roblox + Luau
- Roblox-TS
- Flamework
- Rojo
- Wally (optional)

## 2) 설치된 npm 패키지

`package.json` 기준입니다.

### devDependencies

- `roblox-ts` `^3.0.0`
- `typescript` `^5.9.3`
- `@rbxts/types` `^1.0.916`
- `@rbxts/compiler-types` `^3.0.0-types.0`

### dependencies

- `@flamework/core` `^1.3.2`

## 3) npm 스크립트 구성

- `npm run build` -> `rbxtsc`
- `npm run watch` -> `rbxtsc -w`
- `npm run rojo:serve` -> `rojo serve`
- `npm run rojo:sourcemap` -> `rojo sourcemap default.project.json -o sourcemap.json`

권장 시작 순서:

1. `npm install`
2. `npm run build`
3. `npm run rojo:serve`
4. Roblox Studio에서 Rojo 플러그인으로 연결

## 4) TypeScript / Roblox-TS 컴파일 설정

`tsconfig.json` 핵심값:

- `rootDir: "src"`
- `outDir: "out"`
- `strict: true`
- `target: "ESNext"`
- `module: "CommonJS"`
- `noLib: true`
- `types: ["types", "compiler-types"]`
- `typeRoots: ["node_modules/@rbxts", "node_modules/@flamework"]`
- `include: ["src"]`

의미 요약:

- 소스는 `src`, 컴파일 결과는 `out`으로 고정
- 엄격 타입 검사(`strict`) 활성화
- Roblox-TS/Flamework 타입 루트를 명시해 자동 타입 해석 안정화

## 5) Rojo 동기화 트리 설정

`default.project.json` 기준:

- `ReplicatedStorage.TS` maps to `out/shared`
- `ServerScriptService.TS` maps to `out/server`
- `StarterPlayer.StarterPlayerScripts.TS` maps to `out/client`
- `ReplicatedStorage.node_modules.@rbxts` maps to `node_modules/@rbxts`
- `ReplicatedStorage.node_modules.@flamework` maps to `node_modules/@flamework`
- `ReplicatedStorage.Include` maps to `include`

의미 요약:

- 빌드 결과(`out`)를 클라이언트/서버/공용으로 분리 배치
- 런타임에서 필요한 패키지 모듈 경로를 `ReplicatedStorage`에 연결

## 6) Wally 설정

`wally.toml` 기준:

- `name = "project-cannon/base"`
- `version = "0.1.0"`
- `realm = "shared"`
- `registry = "https://github.com/UpliftGames/wally-index"`
- 현재 `[dependencies]`는 비어 있음

참고:

- 현재 프로젝트는 npm 기반 의존성이 중심이며, Wally는 확장 대비 상태

## 7) Git/파일 관리 설정

### `.gitignore`

- Node 산출물: `node_modules/`, `npm-debug.log*`
- Roblox-TS 산출물: `out/`, `sourcemap.json`
- Roblox 파일: `*.rbxl`, `*.rbxlx`, `*.rbxm`, `*.rbxmx`
- OS/에디터 노이즈: `.DS_Store`, `Thumbs.db`, `.vscode/*.log`

### `.gitattributes`

- 기본 텍스트 처리: `* text=auto eol=lf`
- 바이너리 취급: `*.png`, `*.jpg`, `*.jpeg`, `*.gif`, `*.rbxl*`, `*.rbxm*`

## 8) 새 프로젝트 복제 체크리스트

- [ ] `package.json` 의존성/스크립트 복사
- [ ] `tsconfig.json`의 `rootDir/outDir/types/typeRoots` 동일 적용
- [ ] `default.project.json`의 `out/*` 매핑과 `node_modules` 매핑 반영
- [ ] `.gitignore`, `.gitattributes` 복사
- [ ] `wally.toml` 기본 메타데이터 및 registry 반영
- [ ] `src/client`, `src/server`, `src/shared` 기본 폴더 구조 생성
- [ ] `npm install` 후 `npm run build` + `npm run rojo:serve`로 동작 확인
- [ ] 필요 시 기능 추가 단계에서 `@flamework/networking`, `@rbxts/services`를 재설치

## 9) 권장 검증 절차

1. `npm run build`가 에러 없이 완료되는지 확인
2. `out/client`, `out/server`, `out/shared`가 생성되는지 확인
3. `npm run rojo:serve` 실행 후 Studio 연결 확인
4. Studio Explorer에서 `TS` 폴더가 각 서비스에 매핑되는지 확인

## 10) 운영 메모

- 아키텍처/결정 기록은 `docs/project_Structure.md`
- 일일 작업 기록은 `docs/Daily_Process.md`
- 도구 추가/변경 시 이 문서를 즉시 업데이트
