# Game Design Document

## Visual Layout

```
┌─────────────────────────────────────────────────────────────┐
│                    Player 1: 0  |  Player 2: 0               │
├─────────────────────────────────────────────────────────────┤
│                                                               │
│  [GOAL1]                                          [GOAL2]     │
│   (Blue)                                          (Orange)   │
│    │                                                  │       │
│    │                    ┌──────┐                     │       │
│    │                    │ BALL │                     │       │
│    │                    └──────┘                     │       │
│    │                                                  │       │
│    │              ┌────────────────┐                 │       │
│    │              │   Platform 3   │                 │       │
│    │              └────────────────┘                 │       │
│    │                                                  │       │
│  ┌───┐         ┌──────────┐           ┌──────────┐ ┌───┐   │
│  │ P1│         │Platform 1│           │Platform 2│ │ P2│   │
│  └───┘         └──────────┘           └──────────┘ └───┘   │
│═══════════════════════════════════════════════════════════  │
│                         GROUND                               │
└─────────────────────────────────────────────────────────────┘
```

## Game Flow

### 1. Game Start
- Player 1 (Blue) spawns on the left side
- Player 2 (Orange) spawns on the right side
- Ball spawns in the center, elevated on Platform 3
- Score starts at 0-0

### 2. Ball Pickup
```
Player touches Ball → Player.pickup_ball() → Ball.set_carrier()
→ Ball follows player position → Ball collision disabled
```

### 3. Movement
- Players can move left/right with acceleration and friction
- Players can jump (only when on ground)
- Ball carrier moves with ball attached above their head

### 4. Tackling
```
Player A (with ball) touches Player B (without ball)
→ TackleArea detects collision
→ Player A.get_tackled()
→ Player A.drop_ball()
→ Ball falls to ground
→ Ball collision re-enabled
→ Either player can pick it up
```

### 5. Scoring
```
Player with ball enters opponent's goal
→ Goal.body_entered() detects player
→ Check: player.has_ball AND player.player_id != goal.goal_owner
→ Emit goal_scored signal
→ Main.gd increments score
→ Reset all positions
```

## Component Interactions

### Player.gd
**Responsibilities:**
- Handle input (movement, jumping)
- Apply physics (gravity, velocity)
- Manage ball possession state
- Detect and execute tackles

**Key Variables:**
- `has_ball`: Boolean tracking possession
- `ball_reference`: Reference to Ball node
- `player_id`: 1 or 2 for input mapping
- `player_color`: Visual identification

### Ball.gd
**Responsibilities:**
- Detect player contact for pickup
- Follow carrier when held
- Enable/disable collision based on state

**Key Variables:**
- `is_carried`: Boolean tracking if held
- `carrier`: Reference to carrying player

### Goal.gd
**Responsibilities:**
- Detect player entry
- Validate scoring conditions
- Emit scoring signal

**Key Variables:**
- `goal_owner`: Which player this goal belongs to (1 or 2)

### Main.gd
**Responsibilities:**
- Manage game state
- Track scores
- Handle resets
- Coordinate all game objects

**Key Variables:**
- `player1_score`, `player2_score`: Score tracking
- Spawn position references for reset

## Collision Layers

### Players (CharacterBody2D)
- Collide with: Ground, Platforms, Other Players
- Detect: Ball (via Area2D)

### Ball (Area2D)
- Detect: Players
- Disabled when carried

### Goals (Area2D)
- Detect: Players

### Platforms (StaticBody2D)
- Collide with: Players

## Input Mapping

| Action    | Player 1 | Player 2     |
|-----------|----------|--------------|
| Move Left | A        | Left Arrow   |
| Move Right| D        | Right Arrow  |
| Jump      | Space    | Right Shift  |

## Game States

1. **Playing**: Normal gameplay
2. **Goal Scored**: Brief moment when goal is detected
3. **Resetting**: Positions being reset after goal

## Win Conditions

Currently: Infinite play with score tracking
Future: First to X goals wins

## Physics Constants

- Gravity: 980.0 (Godot default)
- Player Speed: 300.0
- Jump Velocity: -500.0
- Acceleration: 1500.0
- Friction: 1200.0

## Visual Design

### Colors
- Player 1: Blue (0, 0.5, 1)
- Player 2: Orange (1, 0.3, 0)
- Ball: Yellow/Gold (1, 0.8, 0)
- Goal 1: Transparent Blue
- Goal 2: Transparent Orange
- Platforms: Gray (0.4, 0.4, 0.4)
- Ground: Dark Gray (0.3, 0.3, 0.3)

### Sizes
- Players: 40x60 pixels
- Ball: 30x30 pixels (15px radius)
- Goals: 60x200 pixels
- Platforms: Various widths, 30px height
