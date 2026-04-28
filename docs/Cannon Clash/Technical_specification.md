---
title: Cannon Clash Technical Specification
owner: project-cannon
status: draft
updated: 2026-04-28
tags:
  - technical-spec
  - flamework
---

# Technical Specification

## Scope
본 문서는 Cannon Clash의 구현 사양을 Flamework + Roblox-TS 기준으로 정의한다.

## Runtime and Build
- Authoring: TypeScript
- Framework: Flamework
- Sync: Rojo
- Runtime: Luau on Roblox

## System Boundaries

### Server Domain
- RoundService: 라운드 상태 전환 및 타이머(240초 기준)
- CombatService: 발사 요청 검증, projectile 생성/동기화
- DestructionService: 지형/오브젝트 파괴 계산
- ScoreService: kill/assist/survival/team win 점수 처리
- ProfileService: 라운드 결과 저장/복구

### Client Domain
- RoundController: 카운트/상태 UI 반영
- CannonController: 조준/발사 입력 처리
- EffectController: projectile/explosion/hit reaction 표시
- InputController: 디바이스별 액션 매핑

### Shared Domain
- Config: 라운드/전투/점수/효과 상수
- Types: 네트워크 payload, 상태 enum, 결과 모델
- Utility: 검증/변환/공통 helper

## Network Contract (Initial)
- Client -> Server
  - `RequestPlaceCannon(payload)`
  - `RequestFire(payload)`
  - `RequestUseItem(payload)`
- Server -> Client
  - `RoundStateChanged(payload)`
  - `ProjectileSpawned(payload)`
  - `ExplosionResolved(payload)`
  - `ScoreUpdated(payload)`

## Validation Rules (Initial)
- 요청 플레이어 상태가 현재 라운드 phase와 일치해야 한다.
- 발사 요청은 장착 무기/쿨다운/탄 상태를 서버에서 재검증한다.
- 아이템 사용은 보유 수량 및 허용 phase를 검사한다.

## Data Model (Initial)
- PlayerRoundStat
  - playerId, teamId, kills, assists, survived, roundScore
- RoundState
  - roundId, phase, remainTime, attackerTeamId, turnIndex
- ProjectileSnapshot
  - projectileId, ownerId, spawnCFrame, velocity, configId

## Folder Guideline
```text
src/
  client/
    controllers/
  server/
    services/
  shared/
    config/
    types/
    net/
    utility/
```

## Performance and Safety Notes
- 클라이언트 VFX는 streaming-aware로 제한 적용
- 서버는 authoritative validation 유지
- 파괴 연산은 프레임 예산을 고려해 배치 처리

## Open Technical Decisions
- 파괴 표현: terrain 우선 vs basepart 우선 비율
- projectile 판정 방식: raycast hybrid vs physics dominant
- 프로필 저장 주기와 안전 저장 트리거
