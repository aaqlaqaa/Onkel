# 2 Player Ball Game

A competitive 2D platformer game built with Godot Engine where two players compete to score goals by carrying a ball to the opponent's goal zone.

## Game Concept

- **2 Players**: Local multiplayer competitive game
- **Objective**: Carry the ball to your opponent's goal to score
- **Tackling**: Touch an opponent who has the ball to make them drop it
- **Platformer Mechanics**: Jump and navigate platforms to reach the goal

## Controls

### Player 1 (Blue)
- **Move Left**: A
- **Move Right**: D
- **Jump**: SPACE

### Player 2 (Orange)
- **Move Left**: LEFT ARROW
- **Move Right**: RIGHT ARROW
- **Jump**: RIGHT SHIFT

## How to Play

1. Open the project in Godot Engine (version 4.2 or later)
2. Press F5 or click the "Play" button to run the game
3. Both players start on opposite sides of the arena
4. The ball spawns in the center
5. Walk into the ball to pick it up
6. Navigate to the opponent's goal (the colored zone on their side)
7. Touch an opponent carrying the ball to tackle them and make them drop it
8. First to score wins!

## Game Features

- **Platformer Physics**: Smooth jumping and movement
- **Ball Possession**: Visual feedback when carrying the ball
- **Tackling System**: Strategic gameplay - defend your goal and attack theirs
- **Score Tracking**: Real-time score display
- **Auto Reset**: Game resets positions after each goal

## Project Structure

```
/vercel/sandbox/
├── project.godot          # Main project configuration
├── icon.svg               # Project icon
├── scenes/
│   ├── Main.tscn         # Main game scene with level layout
│   ├── Player.tscn       # Player character scene
│   ├── Ball.tscn         # Ball object scene
│   └── Goal.tscn         # Goal zone scene
└── scripts/
    ├── Main.gd           # Game state management
    ├── Player.gd         # Player movement and ball handling
    ├── Ball.gd           # Ball possession logic
    ├── Goal.gd           # Goal detection and scoring
    └── HUD.gd            # UI and score display
```

## Technical Details

- **Engine**: Godot 4.2
- **Language**: GDScript
- **Resolution**: 1280x720
- **Physics**: 2D with gravity (980.0)
- **Player Speed**: 300 units/sec
- **Jump Velocity**: -500 units/sec

## Gameplay Tips

- Use platforms to gain height advantage
- Time your tackles carefully
- Control the center platform for ball control
- Defend your goal while attacking theirs
- Movement is key - stay mobile!

## Future Enhancements

Potential features to add:
- Power-ups
- Multiple levels/arenas
- Timer and match system
- Special abilities
- Sound effects and music
- Particle effects
- More players (3-4 player mode)
