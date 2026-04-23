# AGENT.md

이 문서는 이 저장소에서 작업하는 AI 에이전트를 위한 기본 작업 가이드입니다.

## 프로젝트 개요

- 플랫폼: Roblox
- 언어: Luau (런타임), Roblox-TS (작성 언어: TypeScript)
- 프레임워크: Flamework
- 스튜디오 연동: Rojo
- 패키지 관리:
  - Node 생태계: npm
  - Luau 패키지(선택): Wally

## 목표

- Roblox 게임 개발을 위한 안정적인 기본 구조 유지
- `src` 중심 구조로 클라이언트/서버/공유 코드 분리
- Rojo 동기화 기준으로 Studio와 코드베이스 일치 유지

## 기본 디렉토리 규칙

- `src/client`: 클라이언트 전용 코드
- `src/server`: 서버 전용 코드
- `src/shared`: 클라이언트/서버 공유 코드

## 개발 규칙

- TypeScript 코드는 Roblox-TS 컴파일 대상 기준으로 작성
- Flamework 진입점은 `main.client.ts`, `main.server.ts` 유지
- 런타임 의존성은 `package.json`으로 관리
- Luau 전용 라이브러리가 필요할 때만 Wally 도입

## 문서 규칙

- 모든 Markdown 문서는 가능한 `200`줄을 넘기지 않는다.
- 문서가 커지면 주제/참조 단위별 하위 폴더와 분리된 `.md` 파일로 나눈다.
- 아키텍처/의사결정은 `docs/project_Structure.md`에 기록한다.
- 일일 작업 기록은 `docs/Daily_Process.md`에 기록한다.

## 권장 작업 순서

1. `npm install`
2. `npm run build` 또는 `npm run watch`
3. `npm run rojo:serve`
4. Roblox Studio에서 Rojo 플러그인으로 동기화

## Git 정책

- 불필요한 산출물(`node_modules`, `out`, sourcemap 등)은 커밋 금지
- 큰 바이너리/Studio 임시 파일은 `.gitignore`로 제외
- 설정 파일 변경 시 목적을 커밋 메시지에 명확히 기록
