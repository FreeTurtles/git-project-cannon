---
title: Cannon Clash Project Plan
owner: project-cannon
status: active
updated: 2026-04-28
tags:
  - planning
  - project
---

# Project Plan
**Project Name:** Cannon Clash
**Version:** 1.1 (document cleanup)

## Purpose
이 문서는 프로젝트 진행 기준, 문서 구조, 산출물 관리 규칙을 정의한다.  
게임 규칙/루프/기획 상세는 `docs/Cannon Clash/game_design_document.md`를 단일 기준 문서로 사용한다.

## Project Summary
- Platform: Roblox
- Development Stack: Roblox-TS, Flamework, Rojo
- Runtime Target: Luau
- Core Play Concept: 팀 기반 라운드형 Cannon 전투

## Development Environment
- IDE: Cursor, Roblox Studio
- Pipeline: Cursor -> Rojo sync -> Roblox Studio
- Version Control: Git (`git-project-cannon`)

## Core Pillars
Flamework 기본 철학과 중복되는 항목은 Flamework 관례를 우선한다.

1. Modular Scalability
   - 기능을 독립 모듈로 분리하고 결합도를 낮춘다.
   - 확장 시 기존 코어 수정보다 컴포넌트 추가/교체를 우선한다.

2. Tactile Interaction
   - 조작 결과를 시각/청각/상태 변화로 즉시 피드백한다.
   - 게임 로직과 View/UI/Effect 레이어를 분리한다.

3. Data-Driven Logic
   - 수치/룰은 데이터 테이블 기반으로 운영한다.
   - 밸런스 조정은 코드 수정보다 데이터 변경을 우선한다.

## Document System (Project Structure Design)
`Project_Plan.md`와 `game_design_document.md`를 기준으로 아래 문서를 단계적으로 생성한다.

1. `docs/Cannon Clash/ProjectREADME.md`
   - 아키텍처 블록(기능/도메인 단위) 정의
   - 블록별 목표, 책임, 의존성, 구현 우선순위 기록
   - 다이어그램 링크 및 테스트 항목 참조

2. `docs/Cannon Clash/Technical_specification.md`
   - Flamework/Roblox-TS 구조와 Luau 런타임 기준 구현 사양 정리
   - 네트워크, 검증, 데이터 동기화, 매니저 책임 경계 명시
   - 핵심 코드 패턴/인터페이스 표준화

3. `docs/Cannon Clash/Test_Plan.md`
   - 블록별 테스트 기준(기능/통합/회귀)
   - 승패/점수/라운드 전환/동기화 검증 항목
   - 디바이스(PC/Mobile/Gamepad) 입력 검증 기준

4. `docs/Cannon Clash/Asset_library.md`
   - 무기/투사체/VFX/SFX/UI/맵 에셋 요구사항 정리
   - 제작 담당자, 상태, 링크, 버전 관리

5. `docs/Cannon Clash/diagram/`
   - Mermaid 기반 구조 다이어그램 소스 관리
   - 필요 시 이미지(export) 자산 분리 저장

## Content Ownership Rule
- `Project_Plan.md`: 프로젝트 운영/구조/산출물/진행 관리
- `game_design_document.md`: 게임 플레이 규칙/콘텐츠/밸런스 기획
- 기술 구현 상세(폴더 트리, 매니저 API, 네트워크 이벤트)는 `Technical_specification.md`로 이동한다.

## Initial Backlog (From Current Notes)
- 문서 분리 작업: 기획/기술/테스트/에셋 항목 분할
- 충돌 항목 정리:
  - 장르 표기(`RPG/Turn-Based` vs 실제 팀 슈팅) 통일
  - 라운드 시간 240초 기준 확정 및 전 문서 반영
  - 팀 편성 기준(레벨 기반/랜덤) 정책 확정
- 라운드 스펙 최소 기준선 확정 후 구현 착수
