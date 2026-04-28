---
title: Cannon Clash Game Design Document
owner: project-cannon
status: active
updated: 2026-04-28
tags:
  - game-design
  - gameplay
---

# Game Design Document
**Game Title:** Cannon Clash  
**Version:** 1.1 (document cleanup)

## 1) Design Goal
빠른 라운드 전환과 강한 피드백을 가진 팀 기반 Cannon 슈팅 게임.  
핵심 재미는 `위치 선정 -> 발사 -> 지형 파괴 -> 추락 유도`의 짧은 반복에 있다.

## 2) Genre & Target
- Genre: Team-based round shooter (mini-game style)
- Platform: Roblox
- Target Age Group: under 16
- Server Size: 16 players (Blue 8 vs Red 8)

## 3) Core Game Elements
- Main Weapon: Cannon
- Upgrade Elements: cannon skin/model, bullet skin/model, explosion effects, character accessories/emotion items
- Round Maps: 3~5 maps per match rotation

## 4) Core Loop
Lobby -> Team Setup -> Spawn -> Move/Place -> Attack/Defence Turn Loop -> Round End -> Reward -> Back to Lobby

### Round Phase (baseline)
1. Lobby: 20 sec (vote/map and loadout check)
2. Team arrange: 5 sec
3. Round start countdown: 10 sec
4. Initial move/place time: 15 sec
5. Attack/Defence turn loop: 8 turns
   - Fire window: 15 sec
   - Resolve window: 15 sec
6. Round end condition:
   - one team eliminated, or
   - round timer exceeded
7. Return all players to lobby
8. Round timer baseline: 240 sec

## 5) Combat & Rules
- 공격팀은 발사 윈도우 내 조준/발사 수행
- 방어팀은 위치 이동 불가(액션/아이템 사용 가능)
- 공격하지 않으면 해당 턴 공격권 소멸(추가 패널티 없음)
- 폭발 직접 피해보다 지형 파괴로 인한 추락이 주요 처치 수단
- 처치 판정은 최종 공격자 kill, 기여자는 assist

## 6) Map / Destruction Concept
- Candidate Maps:
  - Amazon River, Downtown Building, Desert Temple, Hill of Storm, Broken Castle, Clouds of Heaven, Lava of Hell
- Structure: wall/ground/pillar + terrain/basepart 혼합
- 파괴 설계 목표:
  - 3~4회 공격 누적으로 낙하 가능한 관통/붕괴 발생
  - 과도한 즉사 지형보다 전술적 균열 생성 우선

## 7) Controls by Device
| Action | PC | Mobile | Gamepad |
|:--|:--|:--|:--|
| Move | WASD | Virtual Joystick | Left Stick |
| Jump | Space | Jump Button | X |
| Crawl/LowWalk | C | C/L Button | A |
| Fire | Left Mouse / F | Touch Fire Button | Y |
| Interact (Place Cannon) | E | Interact Button | R1 |
| Menu | Tab | Menu Button | Menu |

## 8) Progression / Reward
- Kill: 15
- Assist: 5
- Round survival: 30
- Team win bonus: (TBD)

## 9) Item Categories
- Movement: move speed / mobility extension
- Defence: explosion reduction / shield effect
- Fun(Tease): animation, sound, billboard interactions
- Weapon cosmetics: cannon, bullet, explosion effects

## 10) Signature Experience
1. Short Time Turn-Based Round
2. Team Balance per Round
3. Projectile + Explosion visual identity
4. Client-side effect presentation (streaming-aware)

## 11) Open Decisions (Need Lock)
- 팀 편성 규칙(레벨 기반 균형 vs 단순 분배)
- 방어 아이템 수량/효율 상한
- 지형 두께 및 파괴 임계값 수치

## 12) Out-of-Scope for This Document
아래 항목은 기획 문서가 아닌 기술 문서로 관리한다.
- 매니저/서비스 책임 분리 상세
- 폴더 구조/디렉터리 트리
- 네트워크 이벤트/검증 플로우 상세
- VFX 템플릿 데이터 스키마
