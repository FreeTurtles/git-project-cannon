---
title: Cannon Clash Test Plan
owner: project-cannon
status: draft
updated: 2026-04-28
tags:
  - test
  - qa
---

# Test Plan

## Test Objective
핵심 라운드 루프와 전투/점수/동기화가 기획 의도대로 동작하는지 검증한다.

## Test Scope
- Round state transition
- Cannon place/fire validation
- Destruction and fall kill logic
- Score/reward update
- Device input compatibility

## Block-Based Test Criteria

### A. Session & Round Flow
- Lobby -> Team Setup -> Spawn -> Turn Loop -> End 순서 보장
- 라운드 총 시간 240초 기준 동작
- 라운드 종료 조건(전멸/시간초과) 정확성

### B. Cannon Combat
- Place/Fire 입력이 phase 규칙에 맞게 제한
- 무효 요청(쿨다운/장착 불일치) 서버 거절
- 공격팀 발사 윈도우 시간 내 입력만 유효

### C. Destruction & Fall Kill
- 지형 파괴가 누적되고 낙하 가능 상태를 만든다
- 추락 사망 시 최종 공격자 kill, 기여자 assist 처리
- 직접 폭발만으로 즉시 사망 처리되지 않음

### D. Scoring & Rewards
- kill 15, assist 5, survival 30 정확 반영
- 라운드 종료 후 프로필 반영 및 다음 라운드 초기화

### E. Effects & Feedback
- 카운트 UI/상태 UI가 phase와 동기화
- VFX가 streaming area 기준으로 과도하게 표시되지 않음

### F. Input & Device UX
- PC/Mobile/Gamepad 입력 매핑 정확성
- 핵심 액션(Move/Fire/Interact/Menu) 모두 실행 가능

## Test Types
- Functional: feature behavior 검증
- Integration: round + combat + scoring 연동 검증
- Regression: 수정 후 핵심 루프 재검증

## Environment Matrix
- Roblox Studio local test
- 2~16 player simulation
- Device mode: PC, Mobile, Gamepad emulation

## Exit Criteria
- P0/P1 결함 0건
- 핵심 시나리오 통과율 100%
- 회귀 테스트 실패 항목 0건

## Initial Test Cases (Smoke)
1. 16명 입장 후 240초 라운드 1회 완주
2. 유효/무효 발사 요청 각각 검증
3. 지형 파괴로 1회 이상 추락 처치 발생 확인
4. 라운드 종료 후 점수 및 프로필 반영 확인
