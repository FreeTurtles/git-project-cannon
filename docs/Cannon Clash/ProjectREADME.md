---
title: Cannon Clash Project README
owner: project-cannon
status: draft
updated: 2026-04-28
tags:
  - architecture
  - roadmap
---

# Cannon Clash Project README

## Objective
`Project_Plan.md`와 `game_design_document.md`를 구현 가능한 개발 단위로 분해해, 블록별 목표와 책임을 명확히 정의한다.

## Architecture Blocks

### Block A. Session & Round Flow
- Scope: Lobby -> Team Setup -> Spawn -> Turn Loop -> Round End -> Reward
- Goal: 240초 라운드 기준으로 안정적인 상태 전환
- Owner System: Round orchestration service/state machine
- Dependencies: player profile, map loader, network events

### Block B. Cannon Combat
- Scope: cannon place, aim, fire, projectile lifecycle
- Goal: 짧은 발사 윈도우 내 반응성 높은 전투 체감
- Owner System: weapon/controller + server validation
- Dependencies: inventory/loadout, verify rules

### Block C. Destruction & Fall Kill
- Scope: terrain/basepart destruction, fall detection, kill attribution
- Goal: 직접 폭발 피해보다 지형 붕괴 기반 처치 구조 확립
- Owner System: map object domain + damage/score domain
- Dependencies: physics, map authoring standard

### Block D. Scoring & Rewards
- Scope: kill/assist/survival/team win reward 반영
- Goal: 라운드 종료 시점 정확한 점수 정산 및 프로필 업데이트
- Owner System: scoring service + data persistence
- Dependencies: combat event log, profile repository

### Block E. Effects & Feedback
- Scope: projectile/explosion VFX, UI count, hit reaction feedback
- Goal: streaming-aware client effect 표준화
- Owner System: effect manager/controller layer
- Dependencies: shared effect config, device profile

### Block F. Input & Device UX
- Scope: PC/Mobile/Gamepad 입력 매핑 및 UI 대응
- Goal: 디바이스별 조작 일관성 유지
- Owner System: input adapter + UI binding
- Dependencies: action map, accessibility options

## Delivery Priority
1. Session & Round Flow
2. Cannon Combat
3. Destruction & Fall Kill
4. Scoring & Rewards
5. Effects & Feedback
6. Input & Device UX

## Milestone Plan
- M1: Playable Round Skeleton (A + B partial)
- M2: Destruction/Scoring Vertical Slice (B + C + D)
- M3: Polish Build (E + F + tuning)

## Diagram References
- `docs/Cannon Clash/diagram/gameplay_flow.mmd`
- `docs/Cannon Clash/diagram/system_context.mmd`

## Test Linkage
테스트 기준은 `docs/Cannon Clash/Test_Plan.md`를 따른다.
