# CLAUDE.md

이 문서는 Claude 계열 모델이 본 저장소에서 일관되게 작업하기 위한 컨텍스트입니다.

## Tech Stack

- Roblox + Luau
- Roblox-TS
- Flamework
- Rojo
- Wally (optional)

## Repository Intent

로블록스 게임 개발의 베이스 프로젝트로 사용하며, 여러 모델이 공통으로 이해할 수 있는 구조와 규칙을 제공한다.

## Source Layout

- `src/client`: Controller, UI, LocalScript 성격 코드
- `src/server`: Service, 서버 로직
- `src/shared`: 타입, 유틸, 공용 로직

## Build and Sync

- TypeScript -> Luau 컴파일 결과는 `out` 폴더 기준
- Rojo 프로젝트 파일(`default.project.json`)을 기준으로 Studio와 동기화

## Commands

- `npm install`
- `npm run build`
- `npm run watch`
- `npm run rojo:serve`

## Notes for Model Collaboration

- 구조 변경 시 `AGENT.md`와 본 문서를 함께 업데이트한다.
- 새 도구 도입 시 설치 방법과 목적을 문서에 즉시 반영한다.
- 코드 생성 시 Roblox-TS/Flamework 관례를 우선한다.
- 모든 Markdown 문서는 가능한 `200`줄 이내로 유지한다.
- 문서가 커질 경우 참조 단위별 하위 폴더/파일로 분리한다.
- 아키텍처/결정은 `docs/project_Structure.md`, 일일 로그는 `docs/Daily_Process.md`에 분리 기록한다.
